-- ==================================================
-- MUSCLE LEGENDS - GOLDGUERRERO HUB
-- Creado para Delta Executor (Anti-Kick & Anti-Lag)
-- ==================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Variables Globales
getgenv().AutoStrength = false
getgenv().AutoDurability = false
getgenv().AutoAgility = false
getgenv().AutoRebirth = false
getgenv().AutoKills = false
getgenv().AutoPets = false
getgenv().AutoSize = false
getgenv().TargetSize = 2
getgenv().WalkSpeedValue = 16
getgenv().AntiAFK = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RepStorage = game:GetService("ReplicatedStorage")

-- ==================================================
-- VENTANA PRINCIPAL
-- ==================================================

local Window = Rayfield:CreateWindow({
   Name = "Muscle Legends | GoldGuerrero Hub",
   LoadingTitle = "Iniciando GoldGuerrero Hub...",
   LoadingSubtitle = "Modo Anti-Kick & Ahorro de Energía",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- ==================================================
-- PESTAÑAS (TABS)
-- ==================================================

local MainTab = Window:CreateTab("Main", 4483362458)
local AutoFarmTab = Window:CreateTab("Auto Farm", 4483362458)
local RebirthTab = Window:CreateTab("Rebirth", 4483362458)
local PetsTab = Window:CreateTab("Pets & Items", 4483362458)
local KillerTab = Window:CreateTab("Killer", 4483362458)
local MiscTab = Window:CreateTab("Misc & Stats", 4483362458)

-- ==================================================
-- 1. AUTO FARM TAB
-- ==================================================
AutoFarmTab:CreateSection("Auto Farm de Atributos")

AutoFarmTab:CreateToggle({
   Name = "Auto Fuerza Seguro",
   CurrentValue = false,
   Flag = "ToggleStrength",
   Callback = function(Value)
      getgenv().AutoStrength = Value
      spawn(function()
         while getgenv().AutoStrength do
            local char = LocalPlayer.Character
            if char then
               local tool = char:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
               if tool then
                  if tool.Parent ~= char then
                     char.Humanoid:EquipTool(tool)
                     task.wait(0.3)
                  end
                  tool:Activate()
               end
            end
            task.wait(0.8 + (math.random(1, 30) / 100))
         end
      end)
   end,
})

AutoFarmTab:CreateToggle({
   Name = "Auto Durabilidad",
   CurrentValue = false,
   Flag = "ToggleDurability",
   Callback = function(Value)
      getgenv().AutoDurability = Value
      spawn(function()
         while getgenv().AutoDurability do
            local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent") or RepStorage:FindFirstChild("muscleEvent", true)
            if muscleEvent then
               muscleEvent:FireServer("pushups")
            end
            task.wait(0.9 + (math.random(1, 20) / 100))
         end
      end)
   end,
})

AutoFarmTab:CreateToggle({
   Name = "Auto Agilidad",
   CurrentValue = false,
   Flag = "ToggleAgility",
   Callback = function(Value)
      getgenv().AutoAgility = Value
      spawn(function()
         while getgenv().AutoAgility do
            local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent") or RepStorage:FindFirstChild("muscleEvent", true)
            if muscleEvent then
               muscleEvent:FireServer("situps")
            end
            task.wait(0.9 + (math.random(1, 20) / 100))
         end
      end)
   end,
})

-- ==================================================
-- 2. REBIRTH TAB
-- ==================================================
RebirthTab:CreateSection("Renacimiento Automático")

RebirthTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "ToggleRebirth",
   Callback = function(Value)
      getgenv().AutoRebirth = Value
      spawn(function()
         while getgenv().AutoRebirth do
            local rebirthEvent = RepStorage:FindFirstChild("rEvents") and RepStorage.rEvents:FindFirstChild("rebirthRemote")
            if rebirthEvent then
               rebirthEvent:InvokeServer("rebirthRequest")
            end
            task.wait(2)
         end
      end)
   end,
})

-- ==================================================
-- 3. PETS & ITEMS TAB
-- ==================================================
PetsTab:CreateSection("Mascotas y Cofres")

PetsTab:CreateToggle({
   Name = "Auto Abrir Cristal Azul",
   CurrentValue = false,
   Flag = "TogglePets",
   Callback = function(Value)
      getgenv().AutoPets = Value
      spawn(function()
         while getgenv().AutoPets do
            local openPetEvent = RepStorage:FindFirstChild("rEvents") and RepStorage.rEvents:FindFirstChild("openPetCrystalRemote")
            if openPetEvent then
               openPetEvent:InvokeServer("openCrystal", "Blue Crystal")
            end
            task.wait(1.5)
         end
      end)
   end,
})

-- ==================================================
-- 4. KILLER TAB
-- ==================================================
KillerTab:CreateSection("Asesinatos Automáticos")

KillerTab:CreateToggle({
   Name = "Auto Kills",
   CurrentValue = false,
   Flag = "ToggleKills",
   Callback = function(Value)
      getgenv().AutoKills = Value
      spawn(function()
         while getgenv().AutoKills do
            for _, player in pairs(Players:GetPlayers()) do
               if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                  local punchTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch") or LocalPlayer.Backpack:FindFirstChild("Punch")
                  if punchTool then
                     if punchTool.Parent ~= LocalPlayer.Character then
                        LocalPlayer.Character.Humanoid:EquipTool(punchTool)
                     end
                     punchTool:Activate()
                  end
               end
            end
            task.wait(0.5)
         end
      end)
   end,
})

-- ==================================================
-- 5. MISC & STATS TAB
-- ==================================================
MiscTab:CreateSection("Ajustes de Personaje & Anti-AFK")

MiscTab:CreateSlider({
   Name = "Velocidad de Caminado (Speed)",
   Range = {16, 200},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SliderWalkSpeed",
   Callback = function(Value)
      getgenv().WalkSpeedValue = Value
      if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

MiscTab:CreateSlider({
   Name = "Auto Size (Tamaño)",
   Range = {1, 10},
   Increment = 1,
   Suffix = "Size",
   CurrentValue = 2,
   Flag = "SliderSize",
   Callback = function(Value)
      getgenv().TargetSize = Value
      local changeSizeEvent = RepStorage:FindFirstChild("rEvents") and RepStorage.rEvents:FindFirstChild("changeSpeedSizeRemote")
      if changeSizeEvent then
         changeSizeEvent:InvokeServer("changeSize", Value)
      end
   end,
})

MiscTab:CreateToggle({
   Name = "Anti-AFK (Evita desconexión)",
   CurrentValue = true,
   Flag = "ToggleAntiAFK",
   Callback = function(Value)
      getgenv().AntiAFK = Value
   end,
})

-- Loop de Anti-AFK pasivo
spawn(function()
   local VirtualUser = game:GetService("VirtualUser")
   LocalPlayer.Idled:Connect(function()
      if getgenv().AntiAFK then
         VirtualUser:CaptureController()
         VirtualUser:ClickButton1(Vector2.new())
      end
   end)
end)

-- Notificación de carga
Rayfield:Notify({
   Title = "GoldGuerrero Hub Cargado",
   Content = "¡Todas las funciones listas para usar!",
   Duration = 5,
   Image = 4483362458,
})
