local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "GoldGuerrero Hub | Muscle Legends",
   LoadingTitle = "GoldGuerrero Hub",
   LoadingSubtitle = "by Heider Flores v1.4 Auto Pesas",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer
getgenv().AutoPesas = false
getgenv().AutoRebirth = false

local function SafeTP(cf)
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local tween = TweenService:Create(char.HumanoidRootPart, TweenInfo.new(1.2, Enum.EasingStyle.Linear), {CFrame = cf + Vector3.new(0,3,0)})
    tween:Play()
end

local TrainTab = Window:CreateTab("🏋️ Auto Pesas", 4483362458)
TrainTab:CreateToggle({ Name = "Auto Levantar Pesas [NO BAN]", CurrentValue = false, Flag = "AP", Callback = function(v)
    getgenv().AutoPesas = v
    task.spawn(function()
        while getgenv().AutoPesas do
            pcall(function()
                local char = LP.Character
                local hum = char and char:FindFirstChild("Humanoid")
                if not hum then return end
                
                -- 1. Busca una pesa en tu mochila o equipada
                local tool = char:FindFirstChildOfClass("Tool") or LP.Backpack:FindFirstChildOfClass("Tool")
                -- Si encuentra una pesa con "Weight", "Lift", "Dumbbell" en el nombre la equipa
                if not tool then
                    for _, t in pairs(LP.Backpack:GetChildren()) do
                        if t:IsA("Tool") and (string.find(t.Name:lower(), "weight") or string.find(t.Name:lower(), "lift") or string.find(t.Name:lower(), "dumbbell")) then
                            tool = t
                            break
                        end
                    end
                end
                
                if tool then
                    if tool.Parent ~= char then
                        hum:EquipTool(tool)
                        task.wait(0.3)
                    end
                    -- 2. La levanta automáticamente
                    tool:Activate()
                end
            end)
            task.wait(0.5) -- velocidad de levantamiento
        end
    end)
end })
TrainTab:CreateLabel("1. Ve al gym y toca una pesa")
TrainTab:CreateLabel("2. Luego activa el toggle")

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
TpTab:CreateButton({ Name = "Jungle Gym (Pesas 10K)", Callback = function() SafeTP(CFrame.new(-2546, 8, -716)) end })
TpTab:CreateButton({ Name = "Beach Gym", Callback = function() SafeTP(CFrame.new(-1486, 8, -3912)) end })
TpTab:CreateButton({ Name = "Frost Gym", Callback = function() SafeTP(CFrame.new(-4776, 21, -2158)) end })

local AfkTab = Window:CreateTab("💤 Anti-AFK", 4483362458)
AfkTab:CreateToggle({ Name = "Anti-AFK", CurrentValue = true, Flag = "AFK", Callback = function(v)
    if v then for _,c in pairs(getconnections(LP.Idled)) do c:Disable() end end
end })

local ConfigTab = Window:CreateTab("⚙️ Config", 4483362458)
ConfigTab:CreateButton({ Name = "Destruir Hub", Callback = function() Rayfield:Destroy() end })
ConfigTab:CreateLabel("GoldGuerrero v1.4 - Auto Pesas")
