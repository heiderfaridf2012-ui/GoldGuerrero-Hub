local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "GoldGuerrero Hub | Muscle Legends",
   LoadingTitle = "GoldGuerrero Hub",
   LoadingSubtitle = "by Heider Flores v1.2 SAFE",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer
getgenv().AutoTrain = false
getgenv().AutoRebirth = false

local function SafeTP(cf)
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local tween = TweenService:Create(char.HumanoidRootPart, TweenInfo.new(1.2, Enum.EasingStyle.Linear), {CFrame = cf + Vector3.new(0,3,0)})
    tween:Play()
end

local TrainTab = Window:CreateTab("🏋️ Auto Train", 4483362458)
TrainTab:CreateToggle({ Name = "Auto Train", CurrentValue = false, Flag = "AT", Callback = function(v)
    getgenv().AutoTrain = v
    task.spawn(function()
        while getgenv().AutoTrain do
            pcall(function() game:GetService("ReplicatedStorage").rEvents.trainEvent:FireServer("train") end)
            task.wait(0.35)
        end
    end)
end })

local RebirthTab = Window:CreateTab("🔄 Auto Rebirth", 4483362458)
RebirthTab:CreateToggle({ Name = "Auto Rebirth", CurrentValue = false, Flag = "AR", Callback = function(v)
    getgenv().AutoRebirth = v
    task.spawn(function()
        while getgenv().AutoRebirth do
            pcall(function() game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest") end)
            task.wait(2.5)
        end
    end)
end })

local TpTab = Window:CreateTab("📍 Teleports", 4483362458)
TpTab:CreateButton({ Name = "Spawn", Callback = function() SafeTP(CFrame.new(7, 8, 113)) end })
TpTab:CreateButton({ Name = "Jungle Gym", Callback = function() SafeTP(CFrame.new(-2546, 8, -716)) end })
TpTab:CreateButton({ Name = "Beach Gym", Callback = function() SafeTP(CFrame.new(-1486, 8, -3912)) end })
TpTab:CreateButton({ Name = "Frost Gym", Callback = function() SafeTP(CFrame.new(-4776, 21, -2158)) end })
TpTab:CreateButton({ Name = "Mythical Gym", Callback = function() SafeTP(CFrame.new(2177, 21, -3366)) end })

local AfkTab = Window:CreateTab("💤 Anti-AFK", 4483362458)
AfkTab:CreateToggle({ Name = "Anti-AFK (Actívalo)", CurrentValue = true, Flag = "AFK", Callback = function(v)
    if v then for _,c in pairs(getconnections(LP.Idled)) do c:Disable() end end
end })

local ConfigTab = Window:CreateTab("⚙️ Config", 4483362458)
ConfigTab:CreateButton({ Name = "Destruir Hub", Callback = function() Rayfield:Destroy() end })
ConfigTab:CreateLabel("GoldGuerrero v1.2 SAFE - Sin ban")
