local QBCore = exports['qb-core']:GetCoreObject()

local cachedVehicles = nil
local detailIndex = nil

local function _L(key, ...)
    local locale = Config.Locale or 'en'
    local value = nil

    if Locales and Locales[locale] and Locales[locale][key] then
        value = Locales[locale][key]
    elseif Locales and Locales['en'] and Locales['en'][key] then
        value = Locales['en'][key]
    else
        value = key
    end

    local args = { ... }
    if #args > 0 then
        return string.format(value, ...)
    end

    return value
end

local function Normalize(value)
    value = tostring(value or '')
    return string.lower(value)
end

local function LocalizeField(value)
    if type(value) == 'table' then
        local locale = Config.Locale or 'en'
        return value[locale] or value['en'] or value['tr'] or '-'
    end

    return value
end

local function FormatPrice(value)
    if value == nil then return '-' end

    if type(value) == 'string' then
        if value:find('%$') then return value end
        return '$' .. value
    end

    if type(value) == 'number' then
        local formatted = tostring(math.floor(value))
        local left, num, right = string.match(formatted, '^([^%d]*%d)(%d*)(.-)$')
        return '$' .. left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
    end

    return tostring(value)
end

local function LoadDetailIndex()
    if detailIndex then return detailIndex end

    detailIndex = {}

    local raw = LoadResourceFile(GetCurrentResourceName(), 'html/vehicledata.json')
    if not raw or raw == '' then
        print('^3[af-showroom]^7 ' .. _L('warning_detail_file_missing'))
        return detailIndex
    end

    local ok, data = pcall(json.decode, raw)
    if not ok or type(data) ~= 'table' then
        print('^3[af-showroom]^7 ' .. _L('warning_detail_json_invalid'))
        print('^3[af-showroom]^7 ' .. _L('warning_detail_json_error', tostring(data)))
        return detailIndex
    end

    for _, item in ipairs(data) do
        local key = Normalize(item.spawncode or item.model)
        if key ~= '' then
            detailIndex[key] = item
        end
    end

    print('^5[af-showroom]^7 ' .. _L('detail_data_loaded', #data))
    return detailIndex
end

local function MergeVehicle(vehicle, detail)
    local model = vehicle.model or vehicle.spawncode
    local merged = {}

    if type(detail) == 'table' then
        for k, v in pairs(detail) do
            merged[k] = v
        end
    end

    for k, v in pairs(vehicle) do
        merged[k] = v
    end

    merged.spawncode = merged.spawncode or model
    merged.model = model
    merged.name = LocalizeField(merged.name) or model
    merged.brand = LocalizeField(merged.brand) or _L('ui_unknown')
    merged.category = LocalizeField(merged.category) or _L('category_Diğer')
    merged.price = FormatPrice(merged.price)
    merged.stock = tonumber(merged.stock or 0) or 0
    merged.description = LocalizeField(merged.description) or _L('ui_no_description')
    merged.trunkspace = LocalizeField(merged.trunkspace) or '-'
    merged.performance = merged.performance or {
        power = 0,
        acceleration = 0,
        handling = 0,
        topspeed = 0
    }

    return merged
end

local function BuildCatalog()
    local index = LoadDetailIndex()
    local vehicles = {}

    for _, vehicle in ipairs(Config.Vehicles or {}) do
        local model = Normalize(vehicle.model or vehicle.spawncode)
        local detail = index[model]
        vehicles[#vehicles + 1] = MergeVehicle(vehicle, detail)
    end

    return vehicles
end

local function GetVehicles()
    if cachedVehicles then return cachedVehicles end

    cachedVehicles = BuildCatalog()
    print('^5[af-showroom]^7 ' .. _L('catalog_ready', #(Config.Vehicles or {}), #cachedVehicles))

    return cachedVehicles
end

local function ParseVersion(version)
    local major, minor, patch = tostring(version or '0.0.0'):match('(%d+)%.(%d+)%.(%d+)')
    return tonumber(major) or 0, tonumber(minor) or 0, tonumber(patch) or 0
end

local function IsNewerVersion(latest, current)
    local latestMajor, latestMinor, latestPatch = ParseVersion(latest)
    local currentMajor, currentMinor, currentPatch = ParseVersion(current)

    if latestMajor > currentMajor then return true end
    if latestMajor < currentMajor then return false end

    if latestMinor > currentMinor then return true end
    if latestMinor < currentMinor then return false end

    return latestPatch > currentPatch
end

local function CheckForUpdates()
    if not Config.UpdateChecker or not Config.UpdateChecker.enabled then
        if Config.Debug then print('^3[af-showroom]^7 ' .. _L('update_check_disabled')) end
        return
    end

    if not Config.UpdateChecker.url or Config.UpdateChecker.url == '' then
        print('^3[af-showroom]^7 ' .. _L('update_check_failed'))
        return
    end

    PerformHttpRequest(Config.UpdateChecker.url, function(statusCode, response)
        if statusCode ~= 200 or not response or response == '' then
            print('^3[af-showroom]^7 ' .. _L('update_check_failed'))
            return
        end

        local ok, data = pcall(json.decode, response)
        if not ok or type(data) ~= 'table' or not data.version then
            print('^3[af-showroom]^7 ' .. _L('update_check_invalid'))
            return
        end

        local currentVersion = Config.Version or '0.0.0'
        local latestVersion = tostring(data.version)
        local changelog = data.changelog or 'No changelog provided.'
        local downloadUrl = data.url or (Config.UpdateChecker and Config.UpdateChecker.repository) or 'https://github.com/ArdaFuat/af-showroom'

        print('^5[af-showroom]^7 ' .. _L('update_current_version', currentVersion))
        print('^5[af-showroom]^7 ' .. _L('update_latest_version', latestVersion))

        if IsNewerVersion(latestVersion, currentVersion) then
            print('^1[af-showroom]^7 ' .. _L('update_available'))
            print('^1[af-showroom]^7 ' .. _L('update_changelog', changelog))
            print('^1[af-showroom]^7 ' .. _L('update_download', downloadUrl))
        else
            print('^2[af-showroom]^7 ' .. _L('update_latest_installed'))
        end
    end, 'GET')
end

QBCore.Functions.CreateCallback('mandalina-showroom:server:getVehicles', function(source, cb)
    cb(GetVehicles())
end)

RegisterCommand('showroomreload', function(source)
    if source ~= 0 then return end
    cachedVehicles = nil
    detailIndex = nil
    GetVehicles()
    print('^2[af-showroom]^7 ' .. _L('catalog_reloaded'))
end, true)

CreateThread(function()
    Wait(3000)
    CheckForUpdates()
end)
