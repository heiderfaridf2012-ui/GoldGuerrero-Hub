--[[
    GOLD GUERRERO HUB
    Muscle Legends - Versión Funcional
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

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

-- ==================== UI ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 650, 0, 420)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 45)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "⚡ GOLD GUERRERO HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(0, 150, 1, -60)
Tabs.Position = UDim2.new(0, 10, 0, 55)
Tabs.BackgroundColor3 = Color3.fromRGB(27, 27, 33)
Tabs.BorderSizePixel = 0
Tabs.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 8)
TabCorner.Parent = Tabs

local TabList = Instance.new("UIListLayout")
TabList.Padding = UDim.new(0, 5)
TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabList.Parent = Tabs

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -175, 1, -60)
Content.Position = UDim2.new(0, 165, 0, 55)
Content.BackgroundColor3 = Color3.fromRGB(27, 27, 33)
Content.BorderSizePixel = 0
Content.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = Content

local Pages = {}

local function createPage(name)
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.new(1, -20, 1, -20)
    page.Position = UDim2.new(0, 10, 0, 10)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = Content
    Pages[name] = page
    return page
end

local function createTab(name, icon)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    button.Text = icon .. "  " .. name
    button.TextColor3 = Color3.fromRGB(230, 230, 230)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.Parent = Tabs

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 7)
    corner.Parent = button

    button.MouseButton1Click:Connect(function()
        for _, page in pairs(Pages) do
            page.Visible = false
        end
        Pages[name].Visible = true
    end)
end

local function createToggle(page, text, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 42)
    button.Position = UDim2.new(0, 10, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    button.Text = text .. "  [OFF]"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.Parent = page

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 7)
    corner.Parent = button

    local on = false
    button.MouseButton1Click:Connect(function()
        on = not on
        if on then
            button.Text = text .. "  [ON]"
            button.BackgroundColor3 = Color3.fromRGB(30, 130, 70)
        else
            button.Text = text .. "  [OFF]"
            button.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
        end
        callback(on)
    end)
end

local function pageTitle(page, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 40)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 20
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = page
end

-- Crear páginas
local Home = createPage("Home")
local Main = createPage("Main")
local Rebirths = createPage("Rebirths")
local Killer = createPage("Killer")
local Crystal = createPage("Crystal")
local Status = createPage("Status")
local Misc = createPage("Misc")

createTab("Home", "🏠")
createTab("Main", "💪")
createTab("Rebirths", "🔄")
createTab("Killer", "⚔️")
createTab("Crystal", "💎")
createTab("Status", "📊")
createTab("Misc", "🛠️")

Home.Visible = true

pageTitle(Home, "🏠 Home")
pageTitle(Main, "💪 Main - Strength")
pageTitle(Rebirths, "🔄 Rebirths")
pageTitle(Killer, "⚔️ Killer")
pageTitle(Crystal, "💎 Crystal")
pageTitle(Status, "📊 Status")
pageTitle(Misc, "🛠️ Miscellaneous")

-- Home
local homeInfo = Instance.new("TextLabel")
homeInfo.Size = UDim2.new(1, -20, 0, 100)
homeInfo.Position = UDim2.new(0, 10, 0, 50)
homeInfo.BackgroundTransparency = 1
homeInfo.Text = "Bienvenido a Gold Guerrero Hub\n\nSelecciona una pestaña para usar las funciones.\n\nAuto Strength y Auto Hatch ya están listos."
homeInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
homeInfo.TextSize = 15
homeInfo.Font = Enum.Font.Gotham
homeInfo.TextXAlignment = Enum.TextXAlignment.Left
homeInfo.TextYAlignment = Enum.TextYAlignment.Top
homeInfo.Parent = Home

-- Main
createToggle(Main, "💪 Auto Strength", 55, function(v) autoStrength = v end)
createToggle(Main, "👊 Fast Punch", 105, function(v) fastPunch = v end)
createToggle(Main, "📍 Lock Position", 155, function(v)
    lockPosition = v
    if v and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        savedCFrame = player.Character.HumanoidRootPart.CFrame
    end
end)

-- Rebirths
createToggle(Rebirths, "🔄 Auto Rebirth", 55, function(v) autoRebirth = v end)

-- Crystal
createToggle(Crystal, "💎 Auto Hatch Pets", 55, function(v) autoHatch = v end)

local crystalLabel = Instance.new("TextLabel")
crystalLabel.Size = UDim2.new(1, -20, 0, 25)
crystalLabel.Position = UDim2.new(0, 10, 0, 110)
crystalLabel.BackgroundTransparency = 1
crystalLabel.Text = "Crystal actual: Blue Crystal"
crystalLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
crystalLabel.TextSize = 14
crystalLabel.Font = Enum.Font.Gotham
crystalLabel.TextXAlignment = Enum.TextXAlignment.Left
crystalLabel.Parent = Crystal

local crystals = {"Blue Crystal", "Green Crystal", "Frost Crystal", "Mythical Crystal", "Inferno Crystal", "Legends Crystal"}
local cy = 145
for i, name in ipairs(crystals) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.48, -5, 0, 32)
    b.Position = UDim2.new(i % 2 == 1 and 0.02 or 0.52, 0, 0, cy)
    b.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    b.Text = name:gsub(" Crystal", "")
    b.TextColor3 = Color3.fromRGB(220, 220, 220)
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    b.Parent = Crystal

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 6)
    bc.Parent = b

    b.MouseButton1Click:Connect(function()
        selectedCrystal = name
        crystalLabel.Text = "Crystal actual: " .. name
    end)

    if i % 2 == 0 then cy = cy + 40 end
end

-- Misc
createToggle(Misc, "🚀 Reduce Lag (próximamente)", 55, function() end)
createToggle(Misc, "✨ Disable Effects (próximamente)", 105, function() end)

print("✅ Gold Guerrero Hub cargado correctamente")
