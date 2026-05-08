local QBCore = exports['qb-core']:GetCoreObject()

local showroomPed = nil
local catalogOpen = false
local targetAdded = false

local function DebugPrint(message)
    if Config.Debug then
        print('[mandalina-showroom] ' .. tostring(message))
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
                vehicles = vehicles
            }
        })

        DebugPrint(('Katalog açıldı. Araç sayısı: %s'):format(#vehicles))

        if #vehicles == 0 then
            print('[mandalina-showroom] UYARI: Araç listesi boş geldi. Config.Vehicles kontrol et.')
        end
    end)
end

local function CloseCatalog()
    if not catalogOpen then return end

    catalogOpen = false
    SetNuiFocus(false, false)

    SendNUIMessage({ action = 'close' })
    DebugPrint('Katalog kapatıldı.')
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
    AddTextComponentSubstringPlayerName(Config.Showroom.blip.label)
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
        print(('[mandalina-showroom] HATA: %s çalışmıyor. Bu sürüm sadece target ile çalışır.'):format(Config.TargetResource))
        return
    end

    exports[Config.TargetResource]:AddTargetEntity(showroomPed, {
        options = {
            {
                icon = Config.Showroom.target.icon,
                label = Config.Showroom.target.label,
                action = function()
                    OpenCatalog()
                end
            }
        },
        distance = Config.Showroom.target.distance
    })

    targetAdded = true
end)

RegisterCommand('showroom', function()
    OpenCatalog()
end, false)

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
