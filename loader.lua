local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Heider Hub | Muscle Legends",
   LoadingTitle = "Heider Hub",
   LoadingSubtitle = "by Heider Flores",
   ConfigurationSaving = { Enabled = true, FolderName = "HeiderHub", FileName = "MuscleLegends" },
   KeySystem = false
})
getgenv().Config = { WalkSpeed = 16, JumpPower = 50 }
local function TP(cf) local c = game.Players.LocalPlayer.Character if c and c:FindFirstChild("HumanoidRootPart") then c.HumanoidRootPart.CFrame = cf + Vector3.new(0,3,0) end end

local TrainTab = Window:CreateTab("🏋️ Auto Train", 4483362458)
TrainTab:CreateToggle({ Name = "Auto Train", CurrentValue = false, Flag = "AutoTrain", Callback = function(v) print(v) end })

local RebirthTab = Window:CreateTab("🔄 Auto Rebirth", 4483362458)
RebirthTab:CreateToggle({ Name = "Auto Rebirth", CurrentValue = false, Flag = "AutoRebirth", Callback = function(v) print(v) end })

local RockTab = Window:CreateTab("🪨 Auto Farm Rocas", 4483362458)
RockTab:CreateToggle({ Name = "Auto Farm Rocas", CurrentValue = false, Flag = "AutoRock", Callback = function(v) print(v) end })

local TpTab = Window:CreateTab("📍 Teleports", 4483362458)
TpTab:CreateButton({ Name = "Spawn", Callback = function() TP(CFrame.new(7, 8, 113)) end })
TpTab:CreateButton({ Name = "Jungle Gym", Callback = function() TP(CFrame.new(-2546, 8, -716)) end })
TpTab:CreateButton({ Name = "Beach Gym", Callback = function() TP(CFrame.new(-1486, 8, -3912)) end })
TpTab:CreateButton({ Name = "Frost Gym", Callback = function() TP(CFrame.new(-4776, 21, -2158)) end })
TpTab:CreateButton({ Name = "Mythical Gym", Callback = function() TP(CFrame.new(2177, 21, -3366)) end })

local WsTab = Window:CreateTab("🚶 WalkSpeed", 4483362458)
WsTab:CreateSlider({ Name = "WalkSpeed", Range = {16, 200}, Increment = 1, CurrentValue = 16, Flag = "WalkSpeed", Callback = function(v) Config.WalkSpeed = v if game.Players.LocalPlayer.Character then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end end })

local JpTab = Window:CreateTab("🦘 JumpPower", 4483362458)
JpTab:CreateSlider({ Name = "JumpPower", Range = {50, 500}, Increment = 10, CurrentValue = 50, Flag = "JumpPower", Callback = function(v) Config.JumpPower = v if game.Players.LocalPlayer.Character then game.Players.LocalPlayer.Character.Humanoid.JumpPower = v end end })

local AfkTab = Window:CreateTab("💤 Anti-AFK", 4483362458)
AfkTab:CreateToggle({ Name = "Anti-AFK", CurrentValue = true, Flag = "AntiAFK", Callback = function(v) if v then for _,c in pairs(getconnections(game.Players.LocalPlayer.Idled)) do c:Disable() end end end })

local ConfigTab = Window:CreateTab("⚙️ Configuración", 4483362458)
ConfigTab:CreateButton({ Name = "Destruir Hub", Callback = function() Rayfield:Destroy() end })
ConfigTab:CreateLabel("Heider Hub v1.0 - by Heider Flores")
