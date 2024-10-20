local Config = {}
local DefaultDanceFortnite = {}

local UpgradeID = {
    ["Turbo"] = 18,
    ["Engine"] = 11,
    ["Brakes"] = 12,
    ["Transmission"] = 13,
    ["Suspension"] = 15,
    ["XenonHeadlights"] = 22, 
}

TriggerServerEvent("ReturnConfig_sv")    


RegisterNetEvent("ReturnConfig_cl")
AddEventHandler("ReturnConfig_cl", function(Hendlingz,Default)
    Config = Hendlingz
    DefaultDanceFortnite = Default
end)


RegisterKeyMapping('pursuit', '[Gov] Pursuit Mode', "NONE", "NONE")
RegisterCommand('pursuit',function()
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        local driver = GetPedInVehicleSeat(vehicle, -1)
        local TypeOfIntreceptor = GetVehicleIn(vehicle)
        if TypeOfIntreceptor ~= nil then
            local engine = GetVehicleMod(vehicle,11)
            local Next = Config[TypeOfIntreceptor][engine]["Dalje"]
            local PursuitConfig = Config[TypeOfIntreceptor][Next]   
            local PursuitMods = PursuitConfig["mods"]
            local PursuitHandling = PursuitConfig["handling"]
            local PursuitIme = PursuitConfig["Ime"] 
            local Ped = GetPlayerPed(-1)
            local notify = "Pursuit Mod: ".. PursuitIme
            if (GetPedInVehicleSeat(vehicle, -1) == Ped) then 
                TriggerEvent('karma-ui:notify', notify, 4000, "info")
                if PursuitIme == "A" then
                    SendPursuitValue(25)
                elseif PursuitIme == "A+" then
                    SendPursuitValue(50)
                elseif PursuitIme == "S" then
                    SendPursuitValue(75)
                elseif PursuitIme == "S+" then
                    SendPursuitValue(100)
                end
                SetVehicleModKit(vehicle, 0)
                for k, v in pairs(PursuitHandling) do
                    local TypeMod = v["field"]          
                    local Default = DefaultDanceFortnite[TypeOfIntreceptor]["handling"][TypeMod]
                    SetVehicleHandlingField(vehicle,"CHandlingData",v["field"],Default * v["multiplier"])
                end
                for k, v in pairs(PursuitMods) do
                    local ModName = v["ModIme"]
                    local ModID = UpgradeID[ModName]
                    SetVehicleMod(vehicle,ModID,v["ModLevel"],false)
                    ToggleVehicleMod(vehicle, ModID,v["ModLevel"])                   
                end
            end
        end 
    end
end)


function GetVehicleIn(vehicle)
    local Auto = nil
    for i = 1, #PoliceCars do
        if IsVehicleModel( vehicle, PoliceCars[i]) then 
            Auto = PoliceCars[i]
        end
    end
    return Auto
end