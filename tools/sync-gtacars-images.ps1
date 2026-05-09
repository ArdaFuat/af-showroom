param(
    [switch]$Force,
    [switch]$DryRun,
    [switch]$RemoteOnly,
    [int]$Delay = 500,
    [int]$Limit = 0
)

$ErrorActionPreference = 'Stop'

$RootDir = Resolve-Path (Join-Path $PSScriptRoot '..')
$VehicleDataPath = Join-Path $RootDir 'html\vehicledata.json'
$ImageDir = Join-Path $RootDir 'html\vehicle-images'
$ReportPath = Join-Path $ImageDir 'sync-report.json'
$GtacarsBaseUrl = 'https://gtacars.net'
$Headers = @{
    'User-Agent' = 'af-showroom-image-sync/1.0 (+https://github.com/ArdaFuat/af-showroom)'
}

function Get-ModelKey {
    param($Vehicle)

    $value = $Vehicle.spawncode
    if ([string]::IsNullOrWhiteSpace($value)) {
        $value = $Vehicle.model
    }

    return ([string]$value).Trim().ToLowerInvariant()
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
            return ([System.Uri]::new([System.Uri]$GtacarsBaseUrl, $url)).AbsoluteUri
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

function Set-JsonProperty {
    param($Object, [string]$Name, $Value)

    if ($Object.PSObject.Properties.Name -contains $Name) {
        $Object.$Name = $Value
    } else {
        $Object | Add-Member -NotePropertyName $Name -NotePropertyValue $Value
    }
}

function Sync-Vehicle {
    param($Vehicle)

    $model = Get-ModelKey $Vehicle
    if ([string]::IsNullOrWhiteSpace($model)) {
        return [ordered]@{
            status = 'skipped'
            reason = 'missing spawncode/model'
            vehicle = [string]$Vehicle.name
        }
    }

    $currentImage = [string]$Vehicle.image
    $isLocalGtacarsImage = $currentImage.Replace('\', '/').Contains("vehicle-images/$model.")
    if (-not $Force -and -not [string]::IsNullOrWhiteSpace($currentImage) -and -not $isLocalGtacarsImage) {
        return [ordered]@{
            status = 'skipped'
            reason = 'image already set'
            model = $model
            vehicle = [string]$Vehicle.name
        }
    }

    $vehicleUrl = "$GtacarsBaseUrl/gta5/$model"
    $page = Invoke-WebRequest -Uri $vehicleUrl -UseBasicParsing -Headers $Headers
    $gtacarsImageUrl = Get-OgImage $page.Content

    if ([string]::IsNullOrWhiteSpace($gtacarsImageUrl)) {
        return [ordered]@{
            status = 'missing'
            reason = 'og:image not found'
            model = $model
            vehicle = [string]$Vehicle.name
            vehicleUrl = $vehicleUrl
        }
    }

    $imageValue = $gtacarsImageUrl
    $bytes = $null

    if (-not $RemoteOnly) {
        $imageResponse = Invoke-WebRequest -Uri $gtacarsImageUrl -UseBasicParsing -Headers $Headers
        $contentType = [string]$imageResponse.Headers['Content-Type']
        if (-not $contentType.ToLowerInvariant().StartsWith('image/')) {
            throw "unexpected image content-type: $contentType"
        }

        $extension = Get-Extension $contentType
        $fileName = "$model$extension"
        $filePath = Join-Path $ImageDir $fileName
        $imageValue = "vehicle-images/$fileName"
        $bytes = $imageResponse.RawContentStream.Length

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
    }

    if (-not $DryRun) {
        Set-JsonProperty $Vehicle 'image' $imageValue
        Set-JsonProperty $Vehicle 'imageSource' 'gtacars'
        Set-JsonProperty $Vehicle 'gtacarsUrl' $vehicleUrl
        Set-JsonProperty $Vehicle 'gtacarsImageUrl' $gtacarsImageUrl
    }

    return [ordered]@{
        status = 'synced'
        model = $model
        vehicle = [string]$Vehicle.name
        image = $imageValue
        gtacarsImageUrl = $gtacarsImageUrl
        bytes = $bytes
    }
}

$vehicles = Get-Content -Raw -Encoding UTF8 -LiteralPath $VehicleDataPath | ConvertFrom-Json
if ($Limit -gt 0) {
    $candidates = @($vehicles | Select-Object -First $Limit)
} else {
    $candidates = @($vehicles)
}

Write-Host "[gtacars] $(if ($DryRun) { 'dry run: ' } else { '' })checking $($candidates.Count) vehicles"
Write-Host "[gtacars] mode: $(if ($Force) { 'force' } else { 'missing-only' }), storage: $(if ($RemoteOnly) { 'remote-url' } else { 'local-download' })"

$results = New-Object System.Collections.Generic.List[object]

foreach ($vehicle in $candidates) {
    try {
        $result = Sync-Vehicle $vehicle
        $results.Add([pscustomobject]$result)

        $label = if ($result.model) { "$($result.vehicle) ($($result.model))" } else { $result.vehicle }
        $reason = if ($result.reason) { " - $($result.reason)" } else { '' }
        Write-Host "[gtacars] $($result.status): $label$reason"
    } catch {
        $model = Get-ModelKey $vehicle
        $result = [pscustomobject][ordered]@{
            status = 'error'
            model = $model
            vehicle = [string]$vehicle.name
            reason = $_.Exception.Message
        }
        $results.Add($result)
        Write-Host "[gtacars] error: $($result.vehicle) ($($result.model)) - $($result.reason)"
    }

    if ($Delay -gt 0) {
        Start-Sleep -Milliseconds $Delay
    }
}

$summary = [ordered]@{}
foreach ($result in $results) {
    if (-not $summary.Contains($result.status)) {
        $summary[$result.status] = 0
    }
    $summary[$result.status]++
}

$report = [pscustomobject][ordered]@{
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
    options = [pscustomobject][ordered]@{
        force = [bool]$Force
        dryRun = [bool]$DryRun
        remoteOnly = [bool]$RemoteOnly
        delayMs = $Delay
        limit = $Limit
    }
    summary = [pscustomobject]$summary
    results = $results
}

if (-not $DryRun) {
    if (-not (Test-Path $ImageDir)) {
        New-Item -ItemType Directory -Path $ImageDir | Out-Null
    }

    $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
    [System.IO.File]::WriteAllText($VehicleDataPath, (($vehicles | ConvertTo-Json -Depth 20) + [Environment]::NewLine), $utf8NoBom)
    [System.IO.File]::WriteAllText($ReportPath, (($report | ConvertTo-Json -Depth 20) + [Environment]::NewLine), $utf8NoBom)
}

Write-Host "[gtacars] done: $(($summary | ConvertTo-Json -Compress))"
if (-not $DryRun) {
    Write-Host "[gtacars] report: html\vehicle-images\sync-report.json"
}
