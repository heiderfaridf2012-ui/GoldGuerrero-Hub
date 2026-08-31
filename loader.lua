--[[
    GOLD GUERRERO HUB
    Muscle Legends - Rayfield Version
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "⚡ Gold Guerrero Hub | Muscle Legends",
   LoadingTitle = "Gold Guerrero Hub",
   LoadingSubtitle = "Cargando...",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false,
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Variables
local autoStrength = false
local autoRebirth = false
local fastPunch = false
local autoHatch = false
local lockPosition = false
local autoKill = false
local killAura = false
local autoSize = false
local selectedCrystal = "Blue Crystal"
local targetRebirth = 0
local savedCFrame = nil

-- Anti AFK
task.spawn(function()
    local VirtualUser = game:GetService("VirtualUser")
    player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

local function equipTool(name)
    local char = player.Character
    if not char then return end
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == name then
            tool.Parent = char
            return
        end
    end
end

local function getRebirths()
    local success, result = pcall(function()
        return player.leaderstats and player.leaderstats:FindFirstChild("Rebirths") and player.leaderstats.Rebirths.Value or 0
    end)
    return success and result or 0
end

-- Loops
task.spawn(function()
    while true do
        if autoStrength then
            pcall(function()
                equipTool("Weight")
                equipTool("Heavy Weight")
                if player:FindFirstChild("muscleEvent") then
                    player.muscleEvent:FireServer("rep")
                end
            end)
        end
        task.wait(0.08)
    end
end)

task.spawn(function()
    while true do
        if autoRebirth then
            pcall(function()
                local current = getRebirths()
                if targetRebirth == 0 or current < targetRebirth then
                    local remote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("rebirthRemote")
                    if remote then remote:InvokeServer("rebirthRequest") end
                end
            end)
        end
        task.wait(0.4)
    end
end)

task.spawn(function()
    while true do
        if fastPunch then
            pcall(function()
                if player:FindFirstChild("muscleEvent") then
                    player.muscleEvent:FireServer("rep")
                end
            end)
        end
        task.wait(0.04)
    end
end)

task.spawn(function()
    while true do
        if autoHatch then
            pcall(function()
                local remote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("openCrystalRemote")
                if remote then remote:InvokeServer("openCrystal", selectedCrystal) end
            end)
        end
        task.wait(0.7)
    end
end)

task.spawn(function()
    while true do
        if lockPosition and savedCFrame and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = savedCFrame
        end
        task.wait(0.1)
    end
end)

task.spawn(function()
    while true do
        if autoSize then
            pcall(function()
                local remote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("changeSpeedSizeRemote")
                if remote then
                    remote:InvokeServer("changeSize", 1)
                end
            end)
        end
        task.wait(1)
    end
end)

task.spawn(function()
    while true do
        if killAura or autoKill then
            pcall(function()
                local myChar = player.Character
                if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
                
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr \~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                        local dist = (myChar.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 25 then
                            if player:FindFirstChild("muscleEvent") then
                                player.muscleEvent:FireServer("rep")
                            end
                            if autoKill and dist > 8 then
                                myChar.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                            end
                        end
                    end
                end
            end)
        end
        task.wait(0.15)
    end
end)

-- ==================== TABS ====================

local MainTab = Window:CreateTab("💪 Main", 4483362458)

MainTab:CreateToggle({
   Name = "Auto Strength",
   CurrentValue = false,
   Flag = "AutoStrength",
   Callback = function(Value)
      autoStrength = Value
   end,
})

MainTab:CreateToggle({
   Name = "Fast Punch",
   CurrentValue = false,
   Flag = "FastPunch",
   Callback = function(Value)
      fastPunch = Value
   end,
})

MainTab:CreateToggle({
   Name = "Lock Position",
   CurrentValue = false,
   Flag = "LockPosition",
   Callback = function(Value)
      lockPosition = Value
      if Value and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         savedCFrame = player.Character.HumanoidRootPart.CFrame
      end
   end,
})

MainTab:CreateToggle({
   Name = "Auto Size 1",
   CurrentValue = false,
   Flag = "AutoSize",
   Callback = function(Value)
      autoSize = Value
   end,
})

local RebirthTab = Window:CreateTab("🔄 Rebirth", 4483362458)

RebirthTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "AutoRebirth",
   Callback = function(Value)
      autoRebirth = Value
   end,
})

RebirthTab:CreateDropdown({
   Name = "Target Rebirth",
   Options = {"Ilimitado", "100", "500", "1000", "5000", "10000", "50000"},
   CurrentOption = {"Ilimitado"},
   Flag = "TargetRebirth",
   Callback = function(Option)
      if Option[1] == "Ilimitado" then
         targetRebirth = 0
      else
         targetRebirth = tonumber(Option[1])
      end
   end,
})

local KillerTab = Window:CreateTab("⚔️ Killer", 4483362458)

KillerTab:CreateToggle({
   Name = "Auto Kill (TP + Punch)",
   CurrentValue = false,
   Flag = "AutoKill",
   Callback = function(Value)
      autoKill = Value
   end,
})

KillerTab:CreateToggle({
   Name = "Kill Aura (25 studs)",
   CurrentValue = false,
   Flag = "KillAura",
   Callback = function(Value)
      killAura = Value
   end,
})

local CrystalTab = Window:CreateTab("💎 Crystal", 4483362458)

CrystalTab:CreateToggle({
   Name = "Auto Hatch Pets",
   CurrentValue = false,
   Flag = "AutoHatch",
   Callback = function(Value)
      autoHatch = Value
   end,
})

CrystalTab:CreateDropdown({
   Name = "Seleccionar Crystal",
   Options = {
      "Blue Crystal",
      "Green Crystal",
      "Frost Crystal",
      "Mythical Crystal",
      "Inferno Crystal",
      "Legends Crystal",
      "Muscle Elite Crystal",
      "Galaxy Oracle Crystal"
   },
   CurrentOption = {"Blue Crystal"},
   Flag = "SelectedCrystal",
   Callback = function(Option)
      selectedCrystal = Option[1]
   end,
})

local MiscTab = Window:CreateTab("🛠️ Misc", 4483362458)

MiscTab:CreateButton({
   Name = "Cerrar Hub",
   Callback = function()
      Rayfield:Destroy()
   end,
})

Rayfield:Notify({
   Title = "Gold Guerrero Hub",
   Content = "Cargado correctamente ✅",
   Duration = 5,
})

print("✅ Gold Guerrero Hub (Rayfield) cargado")
