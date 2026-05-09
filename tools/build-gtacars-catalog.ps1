param(
    [switch]$Apply,
    [switch]$DryRun,
    [switch]$SkipImages,
    [int]$Delay = 150,
    [int]$Limit = 0,
    [string]$Classes = 'compacts,coupe,motorcycle,muscle,off_road,van,suv,super,sport_classic,sport,sedan'
)

$ErrorActionPreference = 'Stop'

$RootDir = Resolve-Path (Join-Path $PSScriptRoot '..')
$HtmlDir = Join-Path $RootDir 'html'
$VehicleDataPath = Join-Path $HtmlDir 'vehicledata.json'
$ConfigPath = Join-Path $RootDir 'config.lua'
$ImageDir = Join-Path $HtmlDir 'vehicle-images'
$GeneratedDir = Join-Path $RootDir 'tools\generated'
$ReportPath = Join-Path $GeneratedDir 'gtacars-catalog-report.json'
$SitemapUrl = 'https://gtacars.net/sitemap.xml'
$BaseUrl = 'https://gtacars.net'
$Headers = @{
    'User-Agent' = 'af-showroom-catalog-builder/1.0 (+https://github.com/ArdaFuat/af-showroom)'
}

$SelectedClasses = @{}
$Classes.Split(',') | ForEach-Object {
    $key = $_.Trim()
    if ($key) { $SelectedClasses[$key] = $true }
}

$ClassLabels = @{
    compacts = 'Compacts'
    coupe = 'Coupes'
    motorcycle = 'Motorcycles'
    muscle = 'Muscle'
    off_road = 'Off-Road'
    van = 'Vans'
    suv = 'SUVs'
    super = 'Supers'
    sport_classic = 'Sports Classics'
    sport = 'Sports'
    sedan = 'Sedans'
}

$TrunkByClass = @{
    compacts = '100 KG'
    coupe = '100 KG'
    motorcycle = '20 KG'
    muscle = '300 KG'
    off_road = '300 KG'
    van = '650 KG'
    suv = '300 KG'
    super = '100 KG'
    sport_classic = '100 KG'
    sport = '100 KG'
    sedan = '225 KG'
}

$StockByClass = @{
    compacts = 4
    coupe = 2
    motorcycle = 4
    muscle = 2
    off_road = 2
    van = 3
    suv = 2
    super = 1
    sport_classic = 1
    sport = 1
    sedan = 3
}

function ConvertTo-PlainText {
    param([string]$Html)

    if ([string]::IsNullOrWhiteSpace($Html)) { return '' }

    $text = $Html -replace '<script\b[^>]*>.*?</script>', '' `
                 -replace '<style\b[^>]*>.*?</style>', '' `
                 -replace '<[^>]+>', ' ' `
                 -replace '\s+', ' '
    return [System.Net.WebUtility]::HtmlDecode($text).Trim()
}

function ConvertTo-LuaString {
    param([string]$Value)

    $safe = ([string]$Value).Replace('\', '\\').Replace("'", "\'")
    return "'$safe'"
}

function ConvertTo-Slug {
    param([string]$Url)
    return ([string]$Url).TrimEnd('/').Split('/')[-1]
}

function Get-Number {
    param([string]$Value)
    $match = [regex]::Match(([string]$Value), '[\d.]+')
    if ($match.Success) { return [double]::Parse($match.Value, [System.Globalization.CultureInfo]::InvariantCulture) }
    return $null
}

function Get-IntFromText {
    param([string]$Value)
    $match = [regex]::Match(([string]$Value), '\d+')
    if ($match.Success) { return [int]$match.Value }
    return 0
}

function Clamp-Score {
    param([double]$Value)
    return [int][Math]::Max(0, [Math]::Min(100, [Math]::Round($Value)))
}

function Get-RowHtml {
    param([string]$Html, [string]$Label)

    $escaped = [regex]::Escape($Label)
    $pattern = "<tr>\s*<td[^>]*>(?:(?!</td>).)*$escaped(?:(?!</td>).)*</td>\s*<td[^>]*>(.*?)</td>\s*</tr>"
    $match = [regex]::Match($Html, $pattern, 'IgnoreCase,Singleline')
    if ($match.Success) { return $match.Groups[1].Value }
    return ''
}

function Get-RowText {
    param([string]$Html, [string]$Label)
    return ConvertTo-PlainText (Get-RowHtml $Html $Label)
}

function Get-OgImage {
    param([string]$Html)

    $matches = [regex]::Matches($Html, '<meta\b[^>]*>', 'IgnoreCase')
    foreach ($match in $matches) {
        $tag = $match.Value
        $isOgImage = $tag -match '\bproperty=["'']og:image["'']' -or $tag -match '\bname=["'']og:image["'']'
        if (-not $isOgImage) { continue }

        $content = [regex]::Match($tag, '\bcontent=["'']([^"'']+)["'']', 'IgnoreCase')
        if ($content.Success) {
            $url = [System.Net.WebUtility]::HtmlDecode($content.Groups[1].Value)
            if ($url -match '^https?://') { return $url }
            return ([System.Uri]::new([System.Uri]$BaseUrl, $url)).AbsoluteUri
        }
    }

    return ''
}

function Get-Extension {
    param([string]$ContentType)

    $value = $ContentType.ToLowerInvariant()
    if ($value.Contains('png')) { return '.png' }
    if ($value.Contains('webp')) { return '.webp' }
    if ($value.Contains('jpeg') -or $value.Contains('jpg')) { return '.jpg' }
    return '.jpg'
}

function Get-PriceNumber {
    param([string]$PriceText)

    $match = [regex]::Match(([string]$PriceText), '\$\s*([\d,]+)')
    if ($match.Success) {
        return [int](($match.Groups[1].Value).Replace(',', ''))
    }

    return 0
}

function Get-ExistingConfigVehicles {
    if (-not (Test-Path $ConfigPath)) { return @{} }

    $raw = Get-Content -Raw -Encoding UTF8 -LiteralPath $ConfigPath
    $index = @{}
    $blocks = [regex]::Matches($raw, '\{\s*model\s*=\s*''([^'']+)''(.*?)\n\s*\}', 'Singleline')

    foreach ($block in $blocks) {
        $model = $block.Groups[1].Value
        $body = $block.Groups[2].Value
        $price = [regex]::Match($body, 'price\s*=\s*(\d+)')
        $stock = [regex]::Match($body, 'stock\s*=\s*(\d+)')
        $index[$model] = @{
            price = if ($price.Success) { [int]$price.Groups[1].Value } else { $null }
            stock = if ($stock.Success) { [int]$stock.Groups[1].Value } else { $null }
        }
    }

    return $index
}

function Get-ExistingVehicleData {
    if (-not (Test-Path $VehicleDataPath)) { return @{} }

    $raw = Get-Content -Raw -Encoding UTF8 -LiteralPath $VehicleDataPath
    if ([string]::IsNullOrWhiteSpace($raw)) { return @{} }

    $data = $raw | ConvertFrom-Json
    $index = @{}

    foreach ($item in $data) {
        $value = $item.spawncode
        if ([string]::IsNullOrWhiteSpace($value)) { $value = $item.model }
        $key = ([string]$value).Trim().ToLowerInvariant()
        if ($key) { $index[$key] = $item }
    }

    return $index
}

function Get-SitemapUrls {
    $response = Invoke-WebRequest -UseBasicParsing -Uri $SitemapUrl -Headers $Headers
    $xml = [xml]$response.Content
    $urls = @()

    foreach ($node in $xml.urlset.url) {
        $loc = [string]$node.loc
        if ($loc -match '^https://gtacars\.net/gta5/[^/?#]+$') {
            $urls += $loc
        }
    }

    return $urls
}

function Get-DownloadedImage {
    param([string]$ImageUrl, [string]$Model)

    if ($SkipImages -or [string]::IsNullOrWhiteSpace($ImageUrl)) { return '' }

    $imageResponse = Invoke-WebRequest -UseBasicParsing -Uri $ImageUrl -Headers $Headers
    $contentType = [string]$imageResponse.Headers['Content-Type']
    if (-not $contentType.ToLowerInvariant().StartsWith('image/')) {
        throw "unexpected image content-type: $contentType"
    }

    $extension = Get-Extension $contentType
    $fileName = "$Model$extension"
    $filePath = Join-Path $ImageDir $fileName

    if (-not $DryRun) {
        if (-not (Test-Path $ImageDir)) {
            New-Item -ItemType Directory -Path $ImageDir | Out-Null
        }

        $fileStream = [System.IO.File]::Create($filePath)
        try {
            $imageResponse.RawContentStream.Position = 0
            $imageResponse.RawContentStream.CopyTo($fileStream)
        } finally {
            $fileStream.Dispose()
        }
    }

    return "vehicle-images/$fileName"
}

function Get-VehicleFromPage {
    param([string]$Url, $ExistingDetails, $ExistingConfig)

    $model = ConvertTo-Slug $Url
    $html = (Invoke-WebRequest -UseBasicParsing -Uri $Url -Headers $Headers).Content

    $classMatch = [regex]::Match($html, '<tr><td>Class</td>\s*<td><a href="/gta5\?filter_class=([^"]+)" class="link">(.*?)</a>', 'IgnoreCase,Singleline')
    if (-not $classMatch.Success) { return $null }

    $classId = $classMatch.Groups[1].Value
    if (-not $SelectedClasses.ContainsKey($classId)) { return $null }

    $nameMatch = [regex]::Match($html, '<h1[^>]*>.*?<span[^>]*>(.*?)</span>', 'IgnoreCase,Singleline')
    $name = if ($nameMatch.Success) { ConvertTo-PlainText $nameMatch.Groups[1].Value } else { $model }
    $type = Get-RowText $html 'Type'
    $brand = Get-RowText $html 'Manufacturer'
    $seatsText = Get-RowText $html 'Seats'
    $drivetrain = Get-RowText $html 'Drivetrain'
    $mass = Get-RowText $html 'Mass'
    $dimensions = Get-RowText $html 'Dimensions'
    $featuresText = Get-RowText $html 'Features'
    $lapTimeText = Get-RowText $html 'Lap Time'
    $topSpeedText = Get-RowText $html 'Top Speed'
    $offroadText = Get-RowText $html 'Off-Road Traction Loss'
    $upgradesText = Get-RowText $html 'Upgrades'
    $raceClassText = Get-RowText $html 'Race Class'
    if ([string]::IsNullOrWhiteSpace($raceClassText)) { $raceClassText = Get-RowText $html 'Race Classes' }

    $pageText = ConvertTo-PlainText $html
    $priceNumber = 0
    $priceMatch = [regex]::Match($pageText, 'Price:\s*\$\s*([\d,]+)')
    if ($priceMatch.Success) { $priceNumber = [int]($priceMatch.Groups[1].Value.Replace(',', '')) }
    $priceText = if ($priceNumber -gt 0) { '$' + $priceNumber.ToString('N0', [System.Globalization.CultureInfo]::InvariantCulture) } else { '-' }

    $releaseDate = ''
    $releaseMatch = [regex]::Match($pageText, 'Released on\s+(\d{4}-\d{2}-\d{2})')
    if ($releaseMatch.Success) { $releaseDate = $releaseMatch.Groups[1].Value }

    $lapTime = ''
    $lapMatch = [regex]::Match($lapTimeText, '\d+:\d+\.\d+')
    if ($lapMatch.Success) { $lapTime = $lapMatch.Value }

    $topSpeed = ''
    $topSpeedMatch = [regex]::Match($topSpeedText, '[\d.]+\s*km/h')
    if ($topSpeedMatch.Success) { $topSpeed = $topSpeedMatch.Value }

    $raceTier = ''
    $tierMatch = [regex]::Match($raceClassText, 'Tier:\s*([A-Z]+)')
    if ($tierMatch.Success) { $raceTier = $tierMatch.Groups[1].Value }

    $raceClass = ($raceClassText -replace 'Tier:\s*[A-Z]+', '').Trim()
    if ([string]::IsNullOrWhiteSpace($raceClass)) { $raceClass = $ClassLabels[$classId] }

    $features = @()
    if (-not [string]::IsNullOrWhiteSpace($featuresText)) {
        $features = $featuresText -split ',\s*' | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    }

    $upgrades = @()
    if (-not [string]::IsNullOrWhiteSpace($upgradesText)) {
        $upgrades = $upgradesText -split ',\s*' | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    }

    $engineStock = Get-Number (Get-RowText $html 'Engine (Stock)')
    $engineMaxed = Get-Number (Get-RowText $html 'Engine (Maxed)')
    $maxSpeedValue = Get-Number (Get-RowText $html 'Max. Speed')
    $brakeForce = Get-Number (Get-RowText $html 'Brake Force')
    $maxGrip = Get-Number (Get-RowText $html 'Maximum Grip')
    $minGrip = Get-Number (Get-RowText $html 'Minimum Grip')
    $massNumber = Get-Number $mass

    $powerScore = if ($engineMaxed) { Clamp-Score ($engineMaxed * 210) } elseif ($engineStock) { Clamp-Score ($engineStock * 230) } else { 50 }
    $accelScore = if ($engineStock -and $massNumber) { Clamp-Score (($engineStock * 260) - ($massNumber / 120)) } elseif ($engineStock) { Clamp-Score ($engineStock * 220) } else { 50 }
    $handlingScore = if ($maxGrip -and $minGrip) { Clamp-Score ((($maxGrip + $minGrip) / 2) * 30) } elseif ($maxGrip) { Clamp-Score ($maxGrip * 30) } else { 50 }
    $brakingScore = if ($brakeForce) { Clamp-Score ($brakeForce * 110) } else { 50 }
    $topSpeedScore = if ($maxSpeedValue) { Clamp-Score (($maxSpeedValue / 180) * 100) } else { 50 }

    $existingDetail = $ExistingDetails[$model]
    $existingConfigItem = $ExistingConfig[$model]
    $configPrice = if ($existingConfigItem -and $existingConfigItem.price) { $existingConfigItem.price } elseif ($priceNumber -gt 0) { $priceNumber } else { 0 }
    $stock = if ($existingConfigItem -and $existingConfigItem.stock -ne $null) { $existingConfigItem.stock } else { $StockByClass[$classId] }
    $trunkspace = if ($existingDetail -and $existingDetail.trunkspace) { $existingDetail.trunkspace } else { $TrunkByClass[$classId] }

    $ogImage = Get-OgImage $html
    $localImage = Get-DownloadedImage $ogImage $model
    if ([string]::IsNullOrWhiteSpace($localImage)) { $localImage = $ogImage }

    $description = "$brand $name; $($ClassLabels[$classId]) sinifinda, $seatsText koltuklu, $drivetrain cekisli bir secenek. Rol icin fiyat, koltuk, bagaj, hiz ve yol tutus dengesi dikkate alinabilir."

    return [pscustomobject][ordered]@{
        config = [pscustomobject][ordered]@{
            model = $model
            brand = $brand
            name = $name
            category = $ClassLabels[$classId]
            price = $configPrice
            stock = $stock
        }
        detail = [pscustomobject][ordered]@{
            name = $name
            modelName = $name
            model = $model
            spawncode = $model
            brand = $brand
            description = $description
            brandLogo = if ($existingDetail) { $existingDetail.brandLogo } else { '' }
            image = $localImage
            imageSource = 'gtacars'
            gtacarsUrl = $Url
            gtacarsImageUrl = $ogImage
            price = $priceText
            category = $ClassLabels[$classId]
            categoryId = $classId
            type = $type
            trunkspace = $trunkspace
            seats = Get-IntFromText $seatsText
            seatsText = $seatsText
            drivetrain = $drivetrain
            mass = $mass
            dimensions = $dimensions
            features = @($features)
            lapTime = $lapTime
            topSpeed = $topSpeed
            offroadTractionLoss = if ([string]::IsNullOrWhiteSpace($offroadText)) { '' } else { $offroadText }
            upgrades = @($upgrades)
            raceClass = $raceClass
            raceTier = $raceTier
            releaseDate = $releaseDate
            performance = [pscustomobject][ordered]@{
                power = $powerScore
                acceleration = $accelScore
                handling = $handlingScore
                braking = $brakingScore
                topspeed = $topSpeedScore
            }
        }
    }
}

function ConvertTo-ConfigLua {
    param($Vehicles)

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add('Config.Vehicles = {')

    $grouped = $Vehicles | Group-Object { $_.category }
    foreach ($group in $grouped) {
        $lines.Add("    -- $($group.Name)")
        foreach ($vehicle in $group.Group) {
            $lines.Add('    {')
            $lines.Add("        model = $(ConvertTo-LuaString $vehicle.model),")
            $lines.Add("        brand = $(ConvertTo-LuaString $vehicle.brand),")
            $lines.Add("        name = $(ConvertTo-LuaString $vehicle.name),")
            $lines.Add("        category = $(ConvertTo-LuaString $vehicle.category),")
            $lines.Add("        price = $($vehicle.price),")
            $lines.Add("        stock = $($vehicle.stock)")
            $lines.Add('    },')
        }
        $lines.Add('')
    }

    $lines.Add('}')
    return ($lines -join [Environment]::NewLine) + [Environment]::NewLine
}

function Set-ConfigVehiclesBlock {
    param([string]$NewBlock)

    $raw = Get-Content -Raw -Encoding UTF8 -LiteralPath $ConfigPath
    $start = $raw.IndexOf('Config.Vehicles = {')
    if ($start -lt 0) { throw 'Config.Vehicles block not found' }

    $depth = 0
    $end = -1
    for ($i = $start; $i -lt $raw.Length; $i++) {
        if ($raw[$i] -eq '{') { $depth++ }
        elseif ($raw[$i] -eq '}') {
            $depth--
            if ($depth -eq 0) {
                $end = $i + 1
                break
            }
        }
    }

    if ($end -lt 0) { throw 'Config.Vehicles block end not found' }

    return $raw.Substring(0, $start) + $NewBlock.TrimEnd() + $raw.Substring($end)
}

if (-not (Test-Path $GeneratedDir)) {
    New-Item -ItemType Directory -Path $GeneratedDir | Out-Null
}

$existingConfig = Get-ExistingConfigVehicles
$existingDetails = Get-ExistingVehicleData
$urls = Get-SitemapUrls
if ($Limit -gt 0) { $urls = @($urls | Select-Object -First $Limit) }

Write-Host "[gtacars] sitemap urls: $($urls.Count)"
Write-Host "[gtacars] selected classes: $($SelectedClasses.Keys -join ', ')"

$vehicles = New-Object System.Collections.Generic.List[object]
$errors = New-Object System.Collections.Generic.List[object]
$checked = 0

foreach ($url in $urls) {
    $checked++
    try {
        $result = Get-VehicleFromPage $url $existingDetails $existingConfig
        if ($result) {
            $vehicles.Add($result)
            Write-Host "[gtacars] add: $($result.detail.name) ($($result.detail.model))"
        }
    } catch {
        $errors.Add([pscustomobject][ordered]@{
            url = $url
            reason = $_.Exception.Message
        })
        Write-Host "[gtacars] error: $url - $($_.Exception.Message)"
    }

    if ($checked % 50 -eq 0) {
        Write-Host "[gtacars] progress: $checked / $($urls.Count), selected $($vehicles.Count)"
    }

    if ($Delay -gt 0) { Start-Sleep -Milliseconds $Delay }
}

$configVehicles = @($vehicles | ForEach-Object { $_.config })
$detailVehicles = @($vehicles | ForEach-Object { $_.detail })

$configBlock = ConvertTo-ConfigLua $configVehicles
$newConfig = Set-ConfigVehiclesBlock $configBlock

$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
$generatedConfigPath = Join-Path $GeneratedDir 'config.gtacars.generated.lua'
$generatedVehicleDataPath = Join-Path $GeneratedDir 'vehicledata.gtacars.generated.json'

if (-not $DryRun) {
    [System.IO.File]::WriteAllText($generatedConfigPath, $newConfig, $utf8NoBom)
    [System.IO.File]::WriteAllText($generatedVehicleDataPath, (($detailVehicles | ConvertTo-Json -Depth 20) + [Environment]::NewLine), $utf8NoBom)

    if ($Apply) {
        $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
        Copy-Item -LiteralPath $ConfigPath -Destination (Join-Path $GeneratedDir "config.backup.$stamp.lua")
        Copy-Item -LiteralPath $VehicleDataPath -Destination (Join-Path $GeneratedDir "vehicledata.backup.$stamp.json")
        [System.IO.File]::WriteAllText($ConfigPath, $newConfig, $utf8NoBom)
        [System.IO.File]::WriteAllText($VehicleDataPath, (($detailVehicles | ConvertTo-Json -Depth 20) + [Environment]::NewLine), $utf8NoBom)
    }
}

$summary = [ordered]@{
    checked = $checked
    selected = $vehicles.Count
    errors = $errors.Count
    applied = [bool]$Apply
    skippedImages = [bool]$SkipImages
}

$classCounts = [ordered]@{}
foreach ($group in ($detailVehicles | Group-Object categoryId)) {
    $classCounts[$group.Name] = $group.Count
}

$report = [pscustomobject][ordered]@{
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
    selectedClasses = @($SelectedClasses.Keys)
    summary = [pscustomobject]$summary
    classCounts = [pscustomobject]$classCounts
    errors = $errors
}

if (-not $DryRun) {
    [System.IO.File]::WriteAllText($ReportPath, (($report | ConvertTo-Json -Depth 20) + [Environment]::NewLine), $utf8NoBom)
}

Write-Host "[gtacars] done: $(($summary | ConvertTo-Json -Compress))"
if (-not $DryRun) {
    Write-Host "[gtacars] generated config: tools\generated\config.gtacars.generated.lua"
    Write-Host "[gtacars] generated vehicle data: tools\generated\vehicledata.gtacars.generated.json"
    if ($Apply) { Write-Host "[gtacars] applied to config.lua and html\vehicledata.json" }
}
