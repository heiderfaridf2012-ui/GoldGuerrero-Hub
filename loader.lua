-- ==========================================
-- MUSCLE LEGENDS - AUTO FARM ULTRA SEGURO
-- Optimizado para no calentar el celular
-- ==========================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Muscle Legends | Anti-Lag Hub",
   LoadingTitle = "Cargando Script...",
   LoadingSubtitle = "Modo Ahorro de Energía",
   ConfigurationSaving = { Enabled = false }
})

local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

getgenv().AutoFarmFuerza = false

FarmTab:CreateToggle({
   Name = "Auto Fuerza Seguro (Sin Lag)",
   CurrentValue = false,
   Flag = "AutoFarmSafeToggle",
   Callback = function(Value)
      getgenv().AutoFarmFuerza = Value
      
      spawn(function()
         while getgenv().AutoFarmFuerza do
            -- 1. Equipar herramienta si no está en mano
            local char = game.Players.LocalPlayer.Character
            local backpack = game.Players.LocalPlayer.Backpack
            if char and not char:FindFirstChildOfClass("Tool") then
               local tool = backpack:FindFirstChildOfClass("Tool")
               if tool then char.Humanoid:EquipTool(tool) end
            end
            
            -- 2. Activar la herramienta directamente (Evita llamar a VirtualUser)
            if char and char:FindFirstChildOfClass("Tool") then
               char:FindFirstChildOfClass("Tool"):Activate()
            end
            
            -- 3. Tiempo de espera humano + Aleatorio (Evita el Anti-Cheat y reduce uso de CPU)
            task.wait(0.35 + (math.random(1, 15) / 100))
         end
      end)
   end,
})

-- Anti-AFK ligero (Se ejecuta cada 60 segundos para no gastar batería)
spawn(function()
    while task.wait(60) do
        local VU = game:GetService("VirtualUser")
        VU:CaptureController()
        VU:ClickButton1(Vector2.new())
    end
end)
