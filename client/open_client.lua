RegisterKeyMapping("seatbelt", "[HUD] SeatBelt", "keyboard", "B")
RegisterKeyMapping("status", "[HUD] Status", "keyboard", 'TAB')

RegisterCommand('status', function()
    Wait(10)
    startHud()
end)

AddEventHandler('playerSpawned', function()
    Wait(500)
    startHud()
end)

RegisterCommand('hud', function(source, args)
    if args[1] then 
        if tonumber(args[1]) ~= 1 and tonumber(args[1]) ~= 2 then
            args[1] = 1
        end 
        SendNUIMessage({
            action = "refreshPreference",
            preference = tonumber(args[1])
        })
    else 
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openMenu",
        })
    end 
end)

-- Here you can put your things if you are using a Custom Framework : 

if Config.Framework == "custom" then
    RegisterNetEvent('hud:client:UpdateNeeds')
    AddEventHandler('hud:client:UpdateNeeds', function(newHunger, newThirst) -- you need to use this
        statusHud["hunger"] = newHunger -- This was my example
        statusHud["thirst"] = newThirst -- This was my example
    end)
end

