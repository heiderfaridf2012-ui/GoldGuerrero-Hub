local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "GoldGuerrero Hub | Muscle Legends",
   LoadingTitle = "GoldGuerrero Hub",
   LoadingSubtitle = "by Heider Flores v1.6 FINAL",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
getgenv().AutoPesas = false
getgenv().AutoRebirth = false
local function SafeTP(cf)
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if not hrp then return end
    if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end
    hrp.Anchored = true
    task.wait(0.1)
    char:PivotTo(cf + Vector3.new(0,5,0))
    task.wait(0.1)
    hrp.Anchored = false
    if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end
end
local PesasTab = Window:CreateTab("🏋️ Auto Pesas", 4483362458)
PesasTab:CreateToggle({ Name = "Auto Levantar Pesas [NO BAN]", CurrentValue = false, Flag = "AP", Callback = function(v)
    getgenv().AutoPesas = v
    task.spawn(function()
        while getgenv().AutoPesas do
            pcall(function()
                local char = LP.Character
                local tool = char:FindFirstChildOfClass("Tool") or LP.Backpack:FindFirstChildOfClass("Tool")
                if tool then
                    if tool.Parent ~= char then LP.Character.Humanoid:EquipTool(tool) task.wait(0.2) end
                    tool:Activate()
                end
            end)
            task.wait(0.5)
        end
    end)
end })
PesasTab:CreateLabel("1. Ve al gym y toca una pesa")
PesasTab:CreateLabel("2. Luego activa el toggle")
local RebirthTab = Window:CreateTab("🔄 Auto Rebirth", 4483362458)
RebirthTab:CreateToggle({ Name = "Auto Rebirth", CurrentValue = false, Flag = "AR", Callback = function(v)
    getgenv().AutoRebirth = v
    task.spawn(function()
        while getgenv().AutoRebirth do
            pcall(function() game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest") end)
            task.wait(3)
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
AfkTab:CreateToggle({ Name = "Anti-AFK ON", CurrentValue = true, Flag = "AFK", Callback = function(v)
    if v then for _,c in pairs(getconnections(LP.Idled)) do c:Disable() end end
end })
local ConfigTab = Window:CreateTab("⚙️ Config", 4483362458)
ConfigTab:CreateButton({ Name = "Destruir Hub", Callback = function() Rayfield:Destroy() end })
ConfigTab:CreateLabel("GoldGuerrero v1.6 FINAL - by Heider")
