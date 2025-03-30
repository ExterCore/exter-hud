hunger = 100  -- dont change this
thirst = 100 -- dont change this

Config = {}

Config.Framework = "qbcore"  -- qbcore or esx or custom

Config.useElectricVehicles = true -- True if you are uising electric vehicles, false if not

Config.SpeedUnit = "MPH" -- MPH or KMH (in index.html change the line "1555" to show speed in KMH instead of MPH)

Config.Guidemenu = {     -- You can add more just copy and paste the ones that already exists.
    {
        Title = "Finding your Windows Communication Device", 
        Description = "EXTERCITY 2.0"
    },
    {
        Title = "FPS Capping for UI lag:", 
        Description = "EXTERCITY 2.0"
    },
}

RegisterCommand('fuelxd', function(source, args, rawCommand)
    local newFuelLevel = 8.0 -- Atur level fuel baru dalam persen
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if DoesEntityExist(vehicle) then
        if GetResourceState('cdn-fuel') == 'started' then
            exports['cdn-fuel']:SetFuel(vehicle, newFuelLevel)
        elseif GetResourceState('ps-fuel') == 'started' then
            exports['ps-fuel']:setFuel(vehicle, newFuelLevel)
        elseif GetResourceState('ox_fuel') == 'started' then
            exports['ox_fuel']:setFuel(vehicle, newFuelLevel)
        elseif GetResourceState('LegacyFuel') == 'started' then
            exports['LegacyFuel']:SetFuel(vehicle, newFuelLevel)
        else
            print("No compatible fuel system found.")
        end
    else
        print("You are not inside a vehicle.")
    end
end, false)


RegisterCommand('enginexd', function(source, args, rawCommand)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if DoesEntityExist(vehicle) then
        SetVehicleEngineHealth(vehicle, 0.0)
        print("The vehicle's engine was damaged.")
    else
        print("You are not inside a vehicle.")
    end
end, false)


function getFuel(veh)
    if GetResourceState('cdn-fuel') == 'started' then
        return exports['cdn-fuel']:GetFuel(veh, false)
    elseif GetResourceState('ps-fuel') == 'started' then
        return exports['ps-fuel']:getFuel(veh)
    elseif GetResourceState('ox_fuel') == 'started' then
        return exports['ox_fuel']:getFuel(veh)
    elseif GetResourceState('LegacyFuel') == 'started' then
        return exports['LegacyFuel']:GetFuel(veh)
    else
        return 100.0 -- Default jika tidak ada fuel system yang aktif
    end
end

function getElectro(veh)
    if GetResourceState('cdn-fuel') == 'started' then
        return exports['cdn-fuel']:GetFuel(veh, false)
    elseif GetResourceState('ps-fuel') == 'started' then
        return exports['ps-fuel']:getFuel(veh)
    elseif GetResourceState('ox_fuel') == 'started' then
        return exports['ox_fuel']:getFuel(veh)
    elseif GetResourceState('LegacyFuel') == 'started' then
        return exports['LegacyFuel']:GetFuel(veh)
    else
        return 100.0 -- Default jika tidak ada fuel system yang aktif
    end
end


function SeatBeltActived()
    -- exports['your_notification']:SendAlert('inform', "Seatbelt enabled")
end

function SeatBeltDesactivated()
    -- exports['your_notification']:SendAlert('inform', "Seatbelt enabled")
end

function SeatBeltError()
    -- exports['your_notification']:SendAlert('error', "You cant enable seatbelt on this car")
end

function getNitrousLevel()
    local nitrous = true 
    if nitrous then 
        return 0
    else 
        return false 
    end 
end 

function getHarnessLevel()
    local harness = true 
    if harness then 
        return 0
    else 
        return false 
    end 
end 

Config.electricVehicles = {
    [GetHashKey('voltic')] = true,
    [GetHashKey('surge')] = true,
    [GetHashKey('dilettante')] = true,
    [GetHashKey('raiden')] = true,
    [GetHashKey('cyclone')] = true,
    [GetHashKey('neon')] = true,
    [GetHashKey('tezeract')] = true,
    -- Add more model hashes as needed
}

PoliceCars = {
    "police",
}
