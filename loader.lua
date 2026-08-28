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
local selectedCrystal = "Blue Crystal"
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
        task.wait(0.8)
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
MainFrame.Position = UDim2.new(0.5, -145, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
Title.Text = "💪 Muscle Hub + Pets"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local function createToggle(name, yPos, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.85, 0, 0, 34)
    Button.Position = UDim2.new(0.075, 0, 0, yPos)
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    Button.Text = name .. ": OFF"
    Button.TextColor3 = Color3.fromRGB(200, 200, 200)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 13
    Button.Parent = MainFrame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Button
    
    local enabled = false
    Button.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            Button.Text = name .. ": ON"
            Button.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            Button.Text = name .. ": OFF"
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
            Button.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        callback(enabled)
    end)
    
    return Button
end

createToggle("Auto Strength", 50, function(state) autoStrength = state end)
createToggle("Auto Rebirth", 90, function(state) autoRebirth = state end)
createToggle("Fast Punch", 130, function(state) fastPunch = state end)
createToggle("Lock Position", 170, function(state)
    lockPosition = state
    if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        savedCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)
createToggle("Auto Hatch Pets", 210, function(state) autoHatch = state end)

local crystalLabel = Instance.new("TextLabel")
crystalLabel.Size = UDim2.new(0.85, 0, 0, 22)
crystalLabel.Position = UDim2.new(0.075, 0, 0, 255)
crystalLabel.BackgroundTransparency = 1
crystalLabel.Text = "Crystal actual: Blue Crystal"
crystalLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
crystalLabel.Font = Enum.Font.Gotham
crystalLabel.TextSize = 12
crystalLabel.Parent = MainFrame

local crystals = {"Blue Crystal", "Green Crystal", "Frost Crystal", "Mythical Crystal", "Inferno Crystal", "Legends Crystal"}
local y = 280
for i, crystalName in ipairs(crystals) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.4, 0, 0, 26)
    btn.Position = UDim2.new(i % 2 == 1 and 0.075 or 0.525, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    btn.Text = crystalName:gsub(" Crystal", "")
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 11
    btn.Parent = MainFrame
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        selectedCrystal = crystalName
        crystalLabel.Text = "Crystal actual: " .. crystalName
    end)
    
    if i % 2 == 0 then y = y + 32 end
end

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0.85, 0, 0, 34)
CloseBtn.Position = UDim2.new(0.075, 0, 0, 375)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
CloseBtn.Text = "Cerrar Hub"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ Muscle Hub + Auto Hatch cargado")
