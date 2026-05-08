local QBCore = exports['qb-core']:GetCoreObject()

local showroomPed = nil
local catalogOpen = false
local targetAdded = false

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

local function GetLocaleData()
    local locale = Config.Locale or 'en'
    return (Locales and Locales[locale]) or (Locales and Locales['en']) or {}
end

local function DebugPrint(message)
    if Config.Debug then
        print('^5[af-showroom]^7 ' .. tostring(message))
    end
end

local function OpenCatalog()
    if catalogOpen then return end

    QBCore.Functions.TriggerCallback('mandalina-showroom:server:getVehicles', function(vehicles)
        vehicles = vehicles or {}

        catalogOpen = true
        SetNuiFocus(true, true)

        SendNUIMessage({
            action = 'open',
            data = {
                vehicles = vehicles,
                locale = GetLocaleData(),
                localeCode = Config.Locale or 'en'
            }
        })

        DebugPrint(_L('debug_catalog_opened', #vehicles))

        if #vehicles == 0 then
            print('^3[af-showroom]^7 ' .. _L('warning_empty_vehicle_list'))
        end
    end)
end

local function CloseCatalog()
    if not catalogOpen then return end

    catalogOpen = false
    SetNuiFocus(false, false)

    SendNUIMessage({ action = 'close' })
    DebugPrint(_L('debug_catalog_closed'))
end

RegisterNetEvent('mandalina-showroom:client:openCatalog', function()
    OpenCatalog()
end)

RegisterNUICallback('close', function(_, cb)
    CloseCatalog()
    cb('ok')
end)

CreateThread(function()
    if not Config.Showroom.blip.enabled then return end

    local coords = Config.Showroom.ped.coords
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipSprite(blip, Config.Showroom.blip.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, Config.Showroom.blip.scale)
    SetBlipColour(blip, Config.Showroom.blip.color)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(_L('showroom_name'))
    EndTextCommandSetBlipName(blip)
end)

CreateThread(function()
    if not Config.Showroom.ped.enabled then return end

    local pedConfig = Config.Showroom.ped
    local model = joaat(pedConfig.model)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(25)
    end

    showroomPed = CreatePed(
        0,
        model,
        pedConfig.coords.x,
        pedConfig.coords.y,
        pedConfig.coords.z - 1.0,
        pedConfig.coords.w,
        false,
        false
    )

    FreezeEntityPosition(showroomPed, true)
    SetEntityInvincible(showroomPed, true)
    SetBlockingOfNonTemporaryEvents(showroomPed, true)

    if pedConfig.scenario and pedConfig.scenario ~= '' then
        TaskStartScenarioInPlace(showroomPed, pedConfig.scenario, 0, true)
    end

    SetModelAsNoLongerNeeded(model)
end)

CreateThread(function()
    Wait(1000)

    while not showroomPed do
        Wait(250)
    end

    if GetResourceState(Config.TargetResource) ~= 'started' then
        print(('^1[af-showroom]^7 ' .. _L('error_target_not_started')):format(Config.TargetResource))
        return
    end

    exports[Config.TargetResource]:AddTargetEntity(showroomPed, {
        options = {
            {
                icon = Config.Showroom.target.icon,
                label = _L('target_open'),
                action = function()
                    OpenCatalog()
                end
            }
        },
        distance = Config.Showroom.target.distance
    })

    targetAdded = true
end)

if Config.Debug then
    RegisterCommand('showroom', function()
        OpenCatalog()
    end, false)
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    if catalogOpen then
        SetNuiFocus(false, false)
    end

    if targetAdded and showroomPed and DoesEntityExist(showroomPed) and GetResourceState(Config.TargetResource) == 'started' then
        exports[Config.TargetResource]:RemoveTargetEntity(showroomPed)
    end

    if showroomPed and DoesEntityExist(showroomPed) then
        DeleteEntity(showroomPed)
    end
end)
