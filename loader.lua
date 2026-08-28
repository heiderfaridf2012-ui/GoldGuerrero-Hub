--[[
    GoldGuerrero Hub - Muscle Legends
    Diseño moderno + Auto Farm + Pets + Rebirth
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

-- Variables
local autoStrength = false
local autoRebirth = false
local fastPunch = false
local autoHatch = false
local lockPosition = false
local selectedCrystal = "Blue Crystal"
local savedCFrame = nil

-- Anti AFK
task.spawn(function()
    local VirtualUser = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

local function equipTool(name)
    local char = LocalPlayer.Character
    if not char then return end
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == name then
            tool.Parent = char
            return
        end
    end
end

-- Loops
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
        task.wait(0.08)
    end
end)

task.spawn(function()
    while true do
        if autoRebirth then
            pcall(function()
                local remote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("rebirthRemote")
                if remote then remote:InvokeServer("rebirthRequest") end
            end)
        end
        task.wait(0.4)
    end
end)

task.spawn(function()
    while true do
        if fastPunch then
            pcall(function()
                if LocalPlayer:FindFirstChild("muscleEvent") then
                    LocalPlayer.muscleEvent:FireServer("rep")
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
        if lockPosition and savedCFrame and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = savedCFrame
        end
        task.wait(0.1)
    end
end)

-- ==================== GUI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 480, 0, 340)
Main.Position = UDim2.new(0.5, -240, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(18, 22, 32)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Main

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 42)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 32, 48)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "GoldGuerrero Hub  |  Muscle Legends"
Title.TextColor3 = Color3.fromRGB(100, 180, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Position = UDim2.new(1, -38, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = Close

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Left Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 130, 1, -50)
TabFrame.Position = UDim2.new(0, 8, 0, 48)
TabFrame.BackgroundColor3 = Color3.fromRGB(22, 28, 40)
TabFrame.BorderSizePixel = 0
TabFrame.Parent = Main

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 8)
TabCorner.Parent = TabFrame

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -150, 1, -55)
Content.Position = UDim2.new(0, 145, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = Main

-- Helper functions
local function createToggle(parent, text, y, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 36)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
    btn.Text = text .. "  |  OFF"
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    btn.Parent = parent
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        if on then
            btn.Text = text .. "  |  ON"
            btn.BackgroundColor3 = Color3.fromRGB(30, 140, 80)
            btn.TextColor3 = Color3.new(1,1,1)
        else
            btn.Text = text .. "  |  OFF"
            btn.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        callback(on)
    end)
    return btn
end

-- Tabs content
local pages = {}

-- Main Page
local mainPage = Instance.new("Frame")
mainPage.Size = UDim2.new(1, 0, 1, 0)
mainPage.BackgroundTransparency = 1
mainPage.Visible = true
mainPage.Parent = Content
pages["Main"] = mainPage

createToggle(mainPage, "Auto Strength", 10, function(v) autoStrength = v end)
createToggle(mainPage, "Fast Punch", 55, function(v) fastPunch = v end)
createToggle(mainPage, "Lock Position", 100, function(v)
    lockPosition = v
    if v and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        savedCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

-- Rebirth Page
local rebirthPage = Instance.new("Frame")
rebirthPage.Size = UDim2.new(1, 0, 1, 0)
rebirthPage.BackgroundTransparency = 1
rebirthPage.Visible = false
rebirthPage.Parent = Content
pages["Rebirth"] = rebirthPage

createToggle(rebirthPage, "Auto Rebirth", 10, function(v) autoRebirth = v end)

-- Pets Page
local petsPage = Instance.new("Frame")
petsPage.Size = UDim2.new(1, 0, 1, 0)
petsPage.BackgroundTransparency = 1
petsPage.Visible = false
petsPage.Parent = Content
pages["Pets"] = petsPage

createToggle(petsPage, "Auto Hatch Pets", 10, function(v) autoHatch = v end)

local crystalLabel = Instance.new("TextLabel")
crystalLabel.Size = UDim2.new(1, -10, 0, 25)
crystalLabel.Position = UDim2.new(0, 5, 0, 55)
crystalLabel.BackgroundTransparency = 1
crystalLabel.Text = "Crystal: Blue Crystal"
crystalLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
crystalLabel.Font = Enum.Font.Gotham
crystalLabel.TextSize = 13
crystalLabel.TextXAlignment = Enum.TextXAlignment.Left
crystalLabel.Parent = petsPage

local crystals = {"Blue Crystal", "Green Crystal", "Frost Crystal", "Mythical Crystal", "Inferno Crystal", "Legends Crystal"}
local cy = 90
for i, name in ipairs(crystals) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.48, 0, 0, 30)
    b.Position = UDim2.new(i % 2 == 1 and 0.02 or 0.52, 0, 0, cy)
    b.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
    b.Text = name:gsub(" Crystal", "")
    b.TextColor3 = Color3.fromRGB(220, 220, 220)
    b.Font = Enum.Font.Gotham
    b.TextSize = 12
    b.Parent = petsPage
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 6)
    bc.Parent = b
    
    b.MouseButton1Click:Connect(function()
        selectedCrystal = name
        crystalLabel.Text = "Crystal: " .. name
    end)
    
    if i % 2 == 0 then cy = cy + 38 end
end

-- Tab buttons
local tabs = {"Main", "Rebirth", "Pets"}
local currentTab = "Main"

for i, tabName in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, -12, 0, 36)
    tabBtn.Position = UDim2.new(0, 6, 0, 10 + (i-1)*45)
    tabBtn.BackgroundColor3 = tabName == "Main" and Color3.fromRGB(40, 100, 180) or Color3.fromRGB(30, 38, 55)
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.new(1,1,1)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 14
    tabBtn.Parent = TabFrame
    
    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 7)
    tc.Parent = tabBtn
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        pages[tabName].Visible = true
        
        for _, child in pairs(TabFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(30, 38, 55)
            end
        end
        tabBtn.BackgroundColor3 = Color3.fromRGB(40, 100, 180)
        currentTab = tabName
    end)
end

print("✅ GoldGuerrero Hub cargado correctamente")
