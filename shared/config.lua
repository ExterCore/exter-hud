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
    local newFuelLevel = 8.0 -- Defina o novo nível de combustível aqui (em porcentagem)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    
    if DoesEntityExist(vehicle) then
        exports['cdn-fuel']:SetFuel(vehicle, newFuelLevel)
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
    return exports['cdn-fuel']:GetFuel(veh, false)  -- Here you put your Fuel System export
end

function getElectro(veh)
    return exports['cdn-fuel']:GetFuel(veh, false)  -- Here you put your Electro System export
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