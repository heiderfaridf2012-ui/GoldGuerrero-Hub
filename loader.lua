--[[
    Muscle Legends Simple Hub
    Estilo limpio - Auto Farm + Auto Rebirth + Auto Hatch
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Variables
local autoStrength = false
local autoRebirth = false
local fastPunch = false
local autoHatch = false
local selectedCrystal = "Blue Crystal" -- Cambia esto si quieres otro por defecto
local lockPosition = false
local savedCFrame = nil
local antiAFK = true

-- Anti AFK
if antiAFK then
    local VirtualUser = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

-- Función para equipar herramienta
local function equipTool(toolName)
    local backpack = LocalPlayer.Backpack
    local char = LocalPlayer.Character
    if not char then return end
    
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == toolName then
            tool.Parent = char
            return true
        end
    end
    return false
end

-- Auto Strength
task.spawn(function()
    while true do
        if autoStrength then
            pcall(function()
                equipTool("Weight")
                equipTool("Heavy Weight")
                if LocalPlayer:FindFirstChild("muscleEvent") then
                    LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)
        end
        task.wait(0.1)
    end
end)

-- Auto Rebirth
task.spawn(function()
    while true do
        if autoRebirth then
            pcall(function()
                local rEvents = ReplicatedStorage:FindFirstChild("rEvents")
                if rEvents and rEvents:FindFirstChild("rebirthRemote") then
                    rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                end
            end)
        end
        task.wait(0.5)
    end
end)

-- Fast Punch
task.spawn(function()
    while true do
        if fastPunch then
            pcall(function()
                if LocalPlayer:FindFirstChild("muscleEvent") then
                    LocalPlayer.muscleEvent:FireServer("rep")
                end
            end)
        end
        task.wait(0.05)
    end
end)

-- Auto Hatch (Pets)
task.spawn(function()
    while true do
        if autoHatch then
            pcall(function()
                local rEvents = ReplicatedStorage:FindFirstChild("rEvents")
                if rEvents and rEvents:FindFirstChild("openCrystalRemote") then
                    rEvents.openCrystalRemote:InvokeServer("openCrystal", selectedCrystal)
                end
            end)
        end
        task.wait(0.8) -- Un poco más lento para no gastar gems demasiado rápido
    end
end)

-- Lock Position
task.spawn(function()
    while true do
        if lockPosition and savedCFrame and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = savedCFrame
        end
        task.wait(0.1)
    end
end)

-- ==================== GUI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MuscleHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 290, 0, 420)
MainFrame.Position =
