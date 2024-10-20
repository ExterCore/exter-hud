local HandlingPromena = {            
  -- 2014 Chevrolet Corvette C7 Z06 
    ["police"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 2,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},        
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 0.91},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.0},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      },
      [2] =  {
        ["Ime"] = "A+",
        ["Dalje"] = 4,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 0.95},
            {["field"] = "fBrakeForce",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.0},
          },
        },
      [4] =  {
        ["Ime"] = "S+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 4}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},                
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.5},
            {["field"] = "fBrakeForce",["multiplier"] = 1.28},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.0},
          },
      },
    },
  -- 2005 Ford Crown Victoria  
    ["nkcruiser"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 3,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = -1}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = -1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.00},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      },
      [3] =  {
        ["Ime"] = "A+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 2}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},              
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.00},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      }
    },
  -- 2015 Ford Mustang GT 5.0
    ["polpenumbra"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 2,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},        
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 0.95},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.2},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.2},
            {["field"] = "fBrakeForce",["multiplier"] = 1.2},
          },
      },
      [2] =  {
        ["Ime"] = "A+",
        ["Dalje"] = 4,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.23},
            {["field"] = "fBrakeForce",["multiplier"] = 1.1},
          },
        },
      [4] =  {
        ["Ime"] = "S+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 4}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},                
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 2.35},
            {["field"] = "fBrakeForce",["multiplier"] = 1.25},
          },
      },
    },
  -- 2018 Dodge Challenger Demon
    ["nkgauntlet4"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 2,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},        
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 0.89},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.0},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      },
      [2] =  {
        ["Ime"] = "A+",
        ["Dalje"] = 4,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.2},
            {["field"] = "fBrakeForce",["multiplier"] = 1.18},
          },
        },
      [4] =  {
        ["Ime"] = "S+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 4}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},                
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 2.35},
            {["field"] = "fBrakeForce",["multiplier"] = 1.22},
          },
      },
    },
  -- 2016 Dodge Charger w/ Hellcat
    ["trubuffalowidebody"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 2,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},        
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 0.89},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.0},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      },
      [2] =  {
        ["Ime"] = "A+",
        ["Dalje"] = 4,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.20},
            {["field"] = "fBrakeForce",["multiplier"] = 1.2},
          },
        },
      [4] =  {
        ["Ime"] = "S+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 4}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 3}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},                
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.75},
            {["field"] = "fBrakeForce",["multiplier"] = 1.25},
          },
      },
    },
  -- 2017 BMW R1200 GS
    ["npolmm"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 3,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = -1}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},        
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.0},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      },
      [3] =  {
        ["Ime"] = "A+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 1}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.25},
            {["field"] = "fBrakeForce",["multiplier"] = 1.18},
          },
      },
    },
  -- PD Ranger Blazer
    ["npolblazer"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 3,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = -1}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},        
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.0},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.0},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      },
      [3] =  {
        ["Ime"] = "A+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 1}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.75},
            {["field"] = "fBrakeForce",["multiplier"] = 1.18},
          },
      },
    },
    ["nkscout2020"] = {
      [-1] =  {
        ["Ime"] = "A",
        ["Dalje"] = 2,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 0}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = -1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = -1}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},        
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.00},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.00},
            {["field"] = "fBrakeForce",["multiplier"] = 1.00},
          },
      },
      [2] =  {
        ["Ime"] = "A+",
        ["Dalje"] = 3,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 2}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 2}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},               
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.15},
            {["field"] = "fBrakeForce",["multiplier"] = 1.05},
          },
        },
      [3] =  {
        ["Ime"] = "S+",
        ["Dalje"] = -1,
          ["mods"] = {   
            {["ModIme"] = "Turbo" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Engine" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Brakes" ,["ModLevel"] = 1}, 
            {["ModIme"] = "Transmission" ,["ModLevel"] = 3}, 
            {["ModIme"] = "Suspension" ,["ModLevel"] = 2}, 
            {["ModIme"] = "XenonHeadlights" ,["ModLevel"] = 1},                
          },
          ["handling"] = {
            {["field"] = "fInitialDriveForce",["multiplier"] = 1.19},
            {["field"] = "fBrakeForce",["multiplier"] = 1.15},
            {["field"] = "fTractionCurveMax",["multiplier"] = 1.050},
            {["field"] = "fTractionCurveMin",["multiplier"] = 1.068},
          },
      },
    },

}


local DefaultValues = {
    ["nkgauntlet4"] = {
        ["handling"] = {
            ["fInitialDriveForce"] = 0.265069,
            ["fTractionCurveMax"] = 2.380000,
            ["fTractionCurveMin"] = 2.050000,
            ["fBrakeForce"] = 1.10000, 
        },
    },
    ["nkcruiser"] =     {
        ["handling"] = {
            ["fInitialDriveForce"] = 0.271000,
            ["fTractionCurveMax"] = 2.410000,
            ["fTractionCurveMin"] = 2.030000,
            ["fBrakeForce"] = 1.200000, 
        },
    },
    ["nkscout2020"] =     {
        ["handling"] = {
            ["fInitialDriveForce"] = 0.235000,
            ["fTractionCurveMax"] = 2.375000,
            ["fTractionCurveMin"] = 2.025000,
            ["fBrakeForce"] = 1.150000, 
        },
    },
    ["npolblazer"] =     {
        ["handling"] = {
            ["fInitialDriveForce"] = 0.210000,
            ["fTractionCurveMax"] = 1.900000,
            ["fTractionCurveMin"] = 1.800000,
            ["fBrakeForce"] = 1.000000, 
        },
    },
    ["polpenumbra"] =     {
        ["handling"] = {
            ["fInitialDriveForce"] = 0.220000,
            ["fTractionCurveMax"] = 2.250000,
            ["fTractionCurveMin"] = 1.850000,
            ["fBrakeForce"] = 0.800000, 
        },
    },
    ["police"] =     {
        ["handling"] = {
            ["fInitialDriveForce"] = 0.275000,
            ["fTractionCurveMax"] = 2.450000,
            ["fTractionCurveMin"] = 2.100000,
            ["fBrakeForce"] = 1.200000, 
        },
    }, 
    ["npolmm"] =     {
        ["handling"] = {
            ["fInitialDriveForce"] = 0.200000,
            ["fTractionCurveMax"] = 2.160000,
            ["fTractionCurveMin"] = 2.120000,
            ["fBrakeForce"] = 1.800000, 
        },
    },
    ["trubuffalowidebody"] =     {
      ["handling"] = {
          ["fInitialDriveForce"] = 0.271000,
          ["fTractionCurveMax"] = 2.380000,
          ["fTractionCurveMin"] = 2.050000,
          ["fBrakeForce"] = 1.500000, 
      },
  },
}


RegisterServerEvent("ReturnConfig_sv")                   
AddEventHandler("ReturnConfig_sv", function()
  local src = source 
  TriggerClientEvent("ReturnConfig_cl",src,HandlingPromena,DefaultValues)
end)