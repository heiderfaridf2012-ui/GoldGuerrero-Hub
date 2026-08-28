local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Muscle Legends Hub",
   LoadingTitle = "Cargando Script...",
   LoadingSubtitle = "Modo Celular / Mobile",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false,
   -- Mantiene la ventana ajustada y manejable en pantallas pequeñas
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
})

-- Variables de control
local AutoWeight = false
local AutoPushups = false
local AutoHandstands = false
local AutoSitups = false
local AutoRebirth = false
local AutoBrawl = false
local AntiAFK = true

-- Pestaña: Auto Farm
local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

FarmTab:CreateToggle({
   Name = "Auto Weight (Pesas)",
   CurrentValue = false,
   Callback = function(Value)
      AutoWeight = Value
      task.spawn(function()
         while AutoWeight do
            task.wait(0.1)
            pcall(function()
               local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight") or game.Players.LocalPlayer.Character:FindFirstChild("Weight")
               if tool then
                  tool.Parent = game.Players.LocalPlayer.Character
                  tool:Activate()
               end
            end)
         end
      end)
   end,
})

FarmTab:CreateToggle({
   Name = "Auto Pushups (Lagartijas)",
   CurrentValue = false,
   Callback = function(Value)
      AutoPushups = Value
      task.spawn(function()
         while AutoPushups do
            task.wait(0.1)
            pcall(function()
               local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups") or game.Players.LocalPlayer.Character:FindFirstChild("Pushups")
               if tool then
                  tool.Parent = game.Players.LocalPlayer.Character
                  tool:Activate()
               end
            end)
         end
      end)
   end,
})

FarmTab:CreateToggle({
   Name = "Auto Handstands (Parada de manos)",
   CurrentValue = false,
   Callback = function(Value)
      AutoHandstands = Value
      task.spawn(function()
         while AutoHandstands do
            task.wait(0.1)
            pcall(function()
               local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstands") or game.Players.LocalPlayer.Character:FindFirstChild("Handstands")
               if tool then
                  tool.Parent = game.Players.LocalPlayer.Character
                  tool:Activate()
               end
            end)
         end
      end)
   end,
})

FarmTab:CreateToggle({
   Name = "Auto Situps (Abdominales)",
   CurrentValue = false,
   Callback = function(Value)
      AutoSitups = Value
      task.spawn(function()
         while AutoSitups do
            task.wait(0.1)
            pcall(function()
               local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps") or game.Players.LocalPlayer.Character:FindFirstChild("Situps")
               if tool then
                  tool.Parent = game.Players.LocalPlayer.Character
                  tool:Activate()
               end
            end)
         end
      end)
   end,
})

-- Pestaña: Rebirth
local RebirthTab = Window:CreateTab("Rebirth", 4483362458)

RebirthTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Callback = function(Value)
      AutoRebirth = Value
      task.spawn(function()
         while AutoRebirth do
            task.wait(1)
            pcall(function()
               game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
            end)
         end
      end)
   end,
})

-- Pestaña: Killer / Brawl
local KillerTab = Window:CreateTab("Killer", 4483362458)

KillerTab:CreateToggle({
   Name = "Auto Join Brawl",
   CurrentValue = false,
   Callback = function(Value)
      AutoBrawl = Value
      task.spawn(function()
         while AutoBrawl do
            task.wait(2)
            pcall(function()
               game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
            end)
         end
      end)
   end,
})

-- Pestaña: Ajustes & Seguridad
local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateToggle({
   Name = "Anti-AFK (Evita desconexión)",
   CurrentValue = true,
   Callback = function(Value)
      AntiAFK = Value
   end,
})

-- Lógica Anti-AFK para Móvil
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
   if AntiAFK then
      VirtualUser:CaptureController()
      VirtualUser:ClickButton2(Vector2.new())
   end
end)

-- Lógica Anti-Ban
local rawmetatable = getrawmetatable(game)
local oldNamecall = rawmetatable.__namecall
setreadonly(rawmetatable, false)

rawmetatable.__namecall = newcclosure(function(self, ...)
   local method = getnamecallmethod()
   if method == "FireServer" and tostring(self):find("Ban") then
      return nil
   end
   return oldNamecall(self, ...)
end)
setreadonly(rawmetatable, true)
