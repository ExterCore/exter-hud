local food = 100
local water = 100

local playerInCar = false 
local vehicle = nil
local speedMultiplier = 2.23694
local minimapEnabled = false
local wasMinimapEnabled = true

local speedometerfps60 = 0 
local speedometerfps45 = 250 
local speedometerfps30 = 400
local speedometerfps15 = 500

local speedometerfps = speedometerfps60

local seatbelt = false
local minimapBlocked = false 
local blackbar = false 
local crosshair = false
local StartBatteryTemp = math.random(3, 8)

-- hud loop
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
        local player = PlayerPedId()
        vehicle = GetVehiclePedIsIn(player)
        local oxy = false
        if IsPedSwimmingUnderWater(player) then
            oxy = math.ceil(GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10)
            if oxy < 1 then
                oxy = 1
            end
        else
            oxy = false
        end

        local health = math.floor(GetEntityHealth(player) - 100)
        if health < 1 then
            health = 1
        end
        if health == 100 and IsEntityPlayingAnim(player, 'misslamar1dead_body', 'dead_idle', 3) then
            health = 1
        end
        local armor = GetPedArmour(player)
        if armor < 1 then
            armor = 1
        end
        
        SendNUIMessage({
            action = "refreshStatus",
            health = health,
            armor = armor,
            food = hunger,
            water = thirst,  
            oxy = oxy,
            nitrous = getNitrousLevel(),
            harness = getHarnessLevel(),
        })

        if vehicle ~= 0 and not blackbar then 
            SendNUIMessage({
                action = "carHud", 
                open = true
            })
            playerInCar = true 
            roundedRadar()
        else 
            seatbelt = false
            SendNUIMessage({
                action = "carHud", 
                open = false
            })
            playerInCar = false 
            DisplayRadar(false)
        end     
    end 
end)

-- Compass

local playerData = {
    IsWaypointActive = false,
    travelDistance = 0,
    heading = 0
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            SendNUIMessage({
                action="updatePusula",
                locinfo = getLocationInfo()
            })
            Citizen.Wait(100) 
        end
    end
end)

function setEngineIconState(active)
    SendNUIMessage({
        action = "engine",
        active = active
    })
end

function setFuelIconState(active)
    SendNUIMessage({
        action = "lowfuel",
        active = active
    })
end

Citizen.CreateThread(function()
    local vehicle, engineHealth, fuelLevel
    while true do
        Citizen.Wait(500) 
        vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= 0 then
            engineHealth = math.ceil(GetVehicleEngineHealth(vehicle) / 10)
            fuelLevel = math.ceil(getFuel(vehicle) / 1)
            setEngineIconState(engineHealth <= 40)
            setFuelIconState(fuelLevel <= 10)
        end
    end
end)

function getLocationInfo()
    local locationInfo = {}
    local playerCoords = GetEntityCoords(PlayerPedId(), true)
    local streetNames, crossingRoad  = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName1 = GetStreetNameFromHashKey(streetNames)
    locationInfo.myHeading = GetEntityHeading(PlayerPedId())
    local streetName2 = GetStreetNameFromHashKey(crossingRoad)

    locationInfo.zone = GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)
    locationInfo.zoneLabel = GetLabelText(locationInfo.zone)

    if streetName2 ~= nil and streetName2 ~= '' then
        locationInfo.street1 = streetName1
        locationInfo.street2 = streetName2
    else
        if streetName1 ~= nil and streetName1 ~= '' then
            locationInfo.street1 = streetName1
            locationInfo.street2 = ''
        else
            locationInfo.street1 = ''
            locationInfo.street2 = ''
        end
    end

    if IsWaypointActive() then
        local waypointCoords = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
        local heading = GetHeadingFromVector_2d(waypointCoords.x - playerCoords.x, waypointCoords.y - playerCoords.y)

        locationInfo.waypointActive = true
        locationInfo.distanceToWaypoint = CalculateTravelDistanceBetweenPoints(playerCoords.x, playerCoords.y, playerCoords.z, waypointCoords.x, waypointCoords.y, waypointCoords.z) * 0.000625
        locationInfo.waypointHeading = heading
    else
        locationInfo.waypointActive = false
        locationInfo.distanceToWaypoint = 0
        locationInfo.waypointHeading = 0
    end 
    return locationInfo
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
     Wait(500)
     startHud()
    end
end)

function startHud()
    SendNUIMessage({
        action = "refreshPreference",
        preference = 1,
        guides = Config.Guidemenu,
    })
end

RegisterNUICallback('closeMenu', function()
    SetNuiFocus(false, false)
end)

function roundedRadar()
    if minimapBlocked then  
        DisplayRadar(0)
        return 
    end 
    Citizen.CreateThread(function()
        DisplayRadar(1)
        SetBlipAlpha(GetNorthRadarBlip(), 0.0)
        local screenX, screenY = GetScreenResolution()
        local modifier = screenY / screenX

        local baseXOffset = 0.0046875
        local baseYOffset = 0.74

        local baseSize    = 0.20 -- 20% of screen

        local baseXWidth  = 0.1313 -- baseSize * modifier -- %
        local baseYHeight = baseSize -- %

        local baseXNumber = screenX * baseSize  -- 256
        local baseYNumber = screenY * baseSize  -- 144

        local radiusX     = baseXNumber / 2     -- 128
        local radiusY     = baseYNumber / 2     -- 72

        local innerSquareSideSizeX = math.sqrt(radiusX * radiusX * 2) -- 181.0193
        local innerSquareSideSizeY = math.sqrt(radiusY * radiusY * 2) -- 101.8233

        local innerSizeX = ((innerSquareSideSizeX / screenX) - 0.01) * modifier
        local innerSizeY = innerSquareSideSizeY / screenY

        local innerOffsetX = (baseXWidth - innerSizeX) / 2
        local innerOffsetY = (baseYHeight - innerSizeY) / 2

        local innerMaskOffsetPercentX = (innerSquareSideSizeX / baseXNumber) * modifier

        local function setPos(type, posX, posY, sizeX, sizeY)
            SetMinimapComponentPosition(type, "I", "I", posX, posY, sizeX, sizeY)
        end
          local function setPosLB(type, posX, posY, sizeX, sizeY)
              SetMinimapComponentPosition(type, "L", "B", posX, posY, sizeX, sizeY)
          end

          setPosLB("minimap",       -0.0055,  -0.0252,  0.150, 0.18888)
          setPosLB("minimap_mask",  0.025,    0.015,  0.111, 0.159)
          setPosLB("minimap_blur",  -0.035,    -0.005,  0.266, 0.237)
          SetMinimapClipType(0)

        Wait(500)
        if minimapEnabled == false and wasMinimapEnabled == true then
            DisplayRadar(0)
            SetBigmapActive(true, false)
                
            Citizen.Wait(0)
            SetBigmapActive(false, false)
            DisplayRadar(1)
            minimapEnabled = true
        end

        if minimapEnabled and wasMinimapEnabled == false then 
            DisplayRadar(0)
        end 
    end)
end

RegisterNUICallback('speedometerfps', function(data)
    if data.fps == "30" then 
        speedometerfps = speedometerfps30
    elseif data.fps == "60" then 
        speedometerfps = speedometerfps60
    elseif data.fps == "15" then 
        speedometerfps = speedometerfps15
    elseif data.fps == "45" then 
        speedometerfps = speedometerfps45
    end 
end)

RegisterNUICallback('minimapenabled', function(data)
    minimapBlocked = not data.active
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            if seatbelt then
                DisableControlAction(0, 75, true)
                DisableControlAction(27, 75, true)
            end
        end
    end
end)

RegisterCommand('seatbelt', function()
    if IsPedInAnyVehicle(PlayerPedId()) then
        if not IsThisModelABicycle(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(),false))) and not IsThisModelABoat(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(),false))) and not IsThisModelAHeli(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(),false))) then
            if seatbelt == false then
                seatbelt = true
                beltFunc(true)
                SeatBeltActived()
                TriggerEvent("InteractSound_CL:PlayOnOne","seatbelt",0.1)
            else
                TriggerEvent("InteractSound_CL:PlayOnOne","seatbeltoff",0.7)
                SeatBeltDesactivated()
                seatbelt = false
                beltFunc(false)
            end
        else
            SeatBeltError()
        end
    end 
end)

function beltFunc(acik)
    if acik == true then
        SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
    else
        SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
    end
end

function enchantment(name, value) 
    SendNUIMessage({
        action = "enchantmentNui",
        name = name,
        value = value
    })
end 

RegisterNUICallback('blackbar', function(data)
    blackbar = data.show 
end)


function changeVoiceMetre(number)
    voiceMode = number

    SendNUIMessage({
        action = "changeVoiceMode",
        voiceMode = voiceMode
    })
end

function talking(status, radioshit)
    SendNUIMessage({
        action = "talking",
        talking = status,
        radioshit = radioshit
    })
  
end

function radioenter(status, number)
    SendNUIMessage({
        action = "radioConnected",
        wireless = status,   
        number = number    
    })
end

exports("talkingRadio", talkingRadio)
exports('talking', talking)
exports('radioenter', radioenter, number)
exports('enchantment', enchantment)

AddEventHandler("pma-voice:setTalkingMode", function(voiceMode, enabled, radioEnabled, callEnabled)
    if voiceMode then
        if voiceMode == 1 then
            changeVoiceMetre(0)
        elseif voiceMode == 2 then
            changeVoiceMetre(1)
        elseif voiceMode == 3 then
            changeVoiceMetre(2)
        end
    end
end) 

function DebugMode(active)
    SendNUIMessage({
        action="debug",
        active = active
    })
end 

function GodMode(active)
    SendNUIMessage({
        action="god",
        active = active
    })
end 

function ParachuteMode(active)
    SendNUIMessage({
        action="parachute",
        active = active
    })
end 

function DevMode(active)
    SendNUIMessage({
        action="dev",
        active = active
    })
end 

function xHairMode(active) 
    SendNUIMessage({
        action="xHair",
        active = active
    })
end

RegisterCommand("debug", function(source, args, rawCommand)
    local active = tonumber(args[1]) == 1
    DebugMode(active)
end, false)

RegisterCommand("god", function(source, args, rawCommand)
    local active = tonumber(args[1]) == 1
    GodMode(active)
end, false)

RegisterCommand("parachute", function(source, args, rawCommand)
    local active = tonumber(args[1]) == 1
    ParachuteMode(active)
end, false)

RegisterCommand("dev", function(source, args, rawCommand)
    local active = tonumber(args[1]) == 1
    DevMode(active)
end, false)

-- CROSSHAIR

RegisterNUICallback('crosshair', function(data)
    crosshair = data.active 
    SendNUIMessage({
        type = "crosshair",
        status = crosshair
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)      
        if crosshair == true then
            if IsPedArmed(PlayerPedId(), 6) then
                local carcam = GetFollowVehicleCamViewMode()
                local cam = GetFollowPedCamViewMode()
                if cam ~= 4 or carcam == 4 then
                    if (IsPlayerFreeAiming(PlayerId()))  then      
                        xHairMode(true) 
                    else
                        xHairMode(false)   
                    end
                end
            end 
        end
    end
end)

-- Battery Temp Thread

local BatteryLevels = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(800)
        local radioStations = {
            "RADIO_01_CLASS_ROCK",
            "RADIO_02_POP",
            "RADIO_03_HIPHOP_NEW",
            "RADIO_04_PUNK",
            "RADIO_05_TALK_01",       
        } 
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local modelHash = GetEntityModel(vehicle)
        if Config.useElectricVehicles and Config.electricVehicles[modelHash] then
            local speed = GetEntitySpeed(vehicle) 
            local batteryChange
            if speed > (75 / 2.23694) then 
                batteryChange = 0.3 
            elseif speed > (30 / 2.23694) then 
                batteryChange = -0.2 
            else
                batteryChange = 0
            end
            local plate = GetVehicleNumberPlateText(vehicle)
            BatteryLevels[plate] = math.max((BatteryLevels[plate] or StartBatteryTemp) + batteryChange, 0) 
            if BatteryLevels[plate] >= 100 then
                NetworkExplodeVehicle(vehicle, true, false, false)
            elseif BatteryLevels[plate] > 80 then
                SetVehicleEngineHealth(vehicle, 300) 
            end
            if BatteryLevels[plate] > 50 then
                local randomStation = radioStations[math.random(#radioStations)]
                SetVehRadioStation(vehicle, randomStation) 
                local randomLightState = math.random(0, 1) 
                SetVehicleLights(vehicle, randomLightState) 
            end
            SendNUIMessage({
                action = "enteredElectricVehicle",
                vehicleIcon1Value = BatteryLevels[plate],     
            })
        end
    end
end)

AddEventHandler('baseevents:enteredVehicle', function(vehicle, seat)
    local modelHash = GetEntityModel(vehicle)
    local modelName = GetDisplayNameFromVehicleModel(modelHash)
    local plate = GetVehicleNumberPlateText(vehicle)
    local ifIntreceptor = GetVehicleIn(vehicle)
    local value = SendPursuitValue() 
        
    if Config.useElectricVehicles and Config.electricVehicles[modelHash] then
        SendNUIMessage({
            action = "enteredElectricVehicle",
            vehicleIcon1Value = BatteryLevels[plate] or StartBatteryTemp,
        })
    else
        SendNUIMessage({
            action = "enteredNonElectricVehicle"
        })
    end   
    if ifIntreceptor then  
        SendNUIMessage({
            action = "PoliceVehicle",
            pursuit = value
        })
    else       
        SendNUIMessage({
            action = "NoPoliceVehicle"
        })
    end
end)

-- carhud Thread -- 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(speedometerfps)
        if playerInCar then
            local modelHash = GetEntityModel(vehicle)
            local speed = GetEntitySpeed(vehicle)
            local speedInUnit = speed
            if Config.SpeedUnit == "KMH" then
                speedInUnit = speed * 3.6
            elseif Config.SpeedUnit == "MPH" then
                speedInUnit = speed * 2.23694
            end
            local fuel = getFuel(vehicle)
            if Config.useElectricVehicles and Config.electricVehicles[modelHash] then
                fuel = getElectro(vehicle)
            end
            local value = SendPursuitValue()
            SendNUIMessage({
                action = "carHudUpdate",
                speed = math.ceil(speedInUnit),
                rpm = GetVehicleCurrentRpm(vehicle),
                gear = GetVehicleCurrentGear(vehicle),
                fuel = fuel,
                seatbelt = seatbelt,
                pursuit = value
            })
        end
    end
end)

function SendPursuitValue(value)
    if value then   
        Pursuit = value
    end
    return Pursuit or 10
end

exports('SendPursuitValue', SendPursuitValue)

function GetVehicleIn(vehicle)
    local Auto = nil
    for i = 1, #PoliceCars do
        if IsVehicleModel( vehicle, PoliceCars[i]) then 
            Auto = PoliceCars[i]
        end
    end
    return Auto
end

if Config.Framework == "qbcore" then
    RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) 
        hunger = newHunger
        thirst = newThirst
    end)
end

if Config.Framework == "esx" then
    RegisterNetEvent('esx_status:onTick')
    AddEventHandler('esx_status:onTick', function(status)
        for i=1, #status, 1 do
            if status[i].name == 'hunger' then
                hunger = status[i].val / 10000
            elseif status[i].name == 'thirst' then
                thirst = status[i].val / 10000
            end
        end
    end)
end