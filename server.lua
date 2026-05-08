local QBCore = exports['qb-core']:GetCoreObject()

local cachedVehicles = nil
local detailIndex = nil

local function Normalize(value)
    value = tostring(value or '')
    return string.lower(value)
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
        print('[mandalina-showroom] UYARI: html/vehicledata.json yok veya boş. Sadece Config.Vehicles gösterilecek.')
        return detailIndex
    end

    local ok, data = pcall(json.decode, raw)
    if not ok or type(data) ~= 'table' then
        print('[mandalina-showroom] UYARI: html/vehicledata.json JSON formatı bozuk. Sadece Config.Vehicles gösterilecek.')
        print('[mandalina-showroom] JSON hata detayı: ' .. tostring(data))
        return detailIndex
    end

    for _, item in ipairs(data) do
        local key = Normalize(item.spawncode or item.model)
        if key ~= '' then
            detailIndex[key] = item
        end
    end

    print(('[mandalina-showroom] Detay verisi yüklendi. Eşleşebilir kayıt: %s'):format(#data))
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
    merged.name = merged.name or model
    merged.brand = merged.brand or 'Bilinmiyor'
    merged.category = merged.category or 'Diğer'
    merged.price = FormatPrice(merged.price)
    merged.stock = tonumber(merged.stock or 0) or 0
    merged.description = merged.description or 'Bu araç için açıklama bulunamadı.'
    merged.trunkspace = merged.trunkspace or '-'
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
    print(('[mandalina-showroom] Showroom kataloğu hazır. Config araç sayısı: %s | Menü araç sayısı: %s'):format(#(Config.Vehicles or {}), #cachedVehicles))

    return cachedVehicles
end

QBCore.Functions.CreateCallback('mandalina-showroom:server:getVehicles', function(source, cb)
    cb(GetVehicles())
end)

RegisterCommand('showroomreload', function(source)
    if source ~= 0 then return end
    cachedVehicles = nil
    detailIndex = nil
    GetVehicles()
end, true)
