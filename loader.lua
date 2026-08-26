-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — VERSIÓN FINAL
--  ✅ Estilo Young0x | ✅ Funciones conectadas
--  ✅ Pestañas + Stats en vivo | ✅ Móvil optimizado
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- ✅ BORRA DUPLICADOS
if CoreGui:FindFirstChild("GoldGuerrero") then
    CoreGui.GoldGuerrero:Destroy()
end

-- 🔴 ESTADOS
local Estados = {
    AutoWeight = false,
    AutoPushups = false,
    AutoRebirth = false
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerrero"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 📱 VENTANA
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
MainFrame.BorderColor3 = Color3.fromRGB(40, 100, 180)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.02, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
MainFrame.BackgroundTransparency = 0.1
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- ⚡ TÍTULO
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -100, 0, 10)
Title.Size = UDim2.new(0, 200, 0, 28)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gold Guerrero"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 20

-- 📂 PESTAÑAS
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 12, 0, 50)
TabContainer.Size = UDim2.new(1, -24, 0, 40)

local Tabs = {
    {Name = "Entrenar", Active = true},
    {Name = "Rocks", Active = false},
    {Name = "Misc", Active = false},
}

local TabButtons = {}
local CurrentTab = "Entrenar"

for i, TabData in ipairs(Tabs) do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabContainer
    TabBtn.BackgroundColor3 = TabData.Active and Color3.fromRGB(30, 80, 150) or Color3.fromRGB(35, 45, 60)
    TabBtn.BorderSizePixel = 1
    TabBtn.BorderColor3 = Color3.fromRGB(50, 90, 160)
    TabBtn.CornerRadius = UDim.new(0, 6)
    TabBtn.Position = UDim2.new(0, (i-1)*110, 0, 0)
    TabBtn.Size = UDim2.new(0, 100, 0, 35)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.Text = TabData.Name
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.TextSize = 14
    TabButtons[TabData.Name] = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        CurrentTab = TabData.Name
        for _, Btn in pairs(TabButtons) do
            Btn.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
        end
        TabBtn.BackgroundColor3 = Color3.fromRGB(30, 80, 150)
    end)
end

-- 📊 ESTADÍSTICAS EN VIVO
local StatsContainer = Instance.new("Frame")
StatsContainer.Parent = MainFrame
StatsContainer.BackgroundColor3 = Color3.fromRGB(25, 35, 50)
StatsContainer.BorderSizePixel = 1
StatsContainer.BorderColor3 = Color3.fromRGB(45, 85, 155)
StatsContainer.Position = UDim2.new(0, 12, 0, 100)
StatsContainer.Size = UDim2.new(1, -24, 0, 80)
Instance.new("UICorner", StatsContainer).CornerRadius = UDim.new(0, 10)

local StatsTitle = Instance.new("TextLabel")
StatsTitle.Parent = StatsContainer
StatsTitle.BackgroundTransparency = 1
StatsTitle.Position = UDim2.new(0.5, -120, 0, 5)
StatsTitle.Size = UDim2.new(0, 240, 0, 20)
StatsTitle.Font = Enum.Font.GothamBold
StatsTitle.Text = "⚙️ ENTRENAMIENTO BÁSICO"
StatsTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
StatsTitle.TextSize = 14

local Headers = {"FUERZA", "DURABILIDAD", "REBIRTHS"}
local ValueLabels = {}

for i, Name in ipairs(Headers) do
    local Hdr = Instance.new("TextLabel")
    Hdr.Parent = StatsContainer
    Hdr.BackgroundTransparency = 1
    Hdr.Position = UDim2.new(0.05 + (i-1)*0.31, 0, 0, 30)
    Hdr.Size = UDim2.new(0.28, 0, 0, 20)
    Hdr.Font = Enum.Font.GothamBold
    Hdr.Text = Name
    Hdr.TextColor3 = Color3.fromRGB(180, 220, 255)
    Hdr.TextSize = 12

    local Val = Instance.new("TextLabel")
    Val.Parent = StatsContainer
    Val.BackgroundTransparency = 1
    Val.Position = UDim2.new(0.05 + (i-1)*0.31, 0, 0, 50)
    Val.Size = UDim2.new(0.28, 0, 0, 22)
    Val.Font = Enum.Font.GothamBold
    Val.Text = "0"
    Val.TextColor3 = Color3.fromRGB(255, 255, 255)
    Val.TextSize = 13
    ValueLabels[Name] = Val
end

-- 🔘 INTERRUPTORES CON FUNCIÓN CONECTADA
local OptionsContainer = Instance.new("Frame")
OptionsContainer.Parent = MainFrame
OptionsContainer.BackgroundTransparency = 1
OptionsContainer.Position = UDim2.new(0, 12, 0, 190)
OptionsContainer.Size = UDim2.new(1, -24, 0, 110)

local Options = {
    {Name = "Auto Weight", Key = "AutoWeight"},
    {Name = "Auto Pushups", Key = "AutoPushups"},
    {Name = "Auto Rebirth", Key = "AutoRebirth"}
}

for i, Opt in ipairs(Options) do
    local OptionFrame = Instance.new("Frame")
    OptionFrame.Parent = OptionsContainer
    OptionFrame.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
    OptionFrame.BorderSizePixel = 1
    OptionFrame.BorderColor3 = Color3.fromRGB(50, 90, 160)
    OptionFrame.CornerRadius = UDim.new(0, 6)
    OptionFrame.Position = UDim2.new(0, 0, 0, (i-1)*35)
    OptionFrame.Size = UDim2.new(1, 0, 0, 30)

    local OptionLabel = Instance.new("TextLabel")
    OptionLabel.Parent = OptionFrame
    OptionLabel.BackgroundTransparency = 1
    OptionLabel.Position = UDim2.new(0, 10, 0, 0)
    OptionLabel.Size = UDim2.new(0.7, 0, 1, 0)
    OptionLabel.Font = Enum.Font.Gotham
    OptionLabel.Text = "⚡ " .. Opt.Name
    OptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    OptionLabel.TextSize = 14

    local Toggle = Instance.new("TextButton")
    Toggle.Parent = OptionFrame
    Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    Toggle.Position = UDim2.new(0.85, -15, 0.5, -10)
    Toggle.Size = UDim2.new(0, 30, 0, 20)
    Toggle.CornerRadius = UDim.new(0, 10)

    local Knob = Instance.new("Frame")
    Knob.Parent = Toggle
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.Position = UDim2.new(0, 2, 0.5, -8)
    Knob.Size = UDim2.new(0, 16, 0, 16)
    Knob.CornerRadius = UDim.new(0, 8)

    Toggle.MouseButton1Click:Connect(function()
        Estados[Opt.Key] = not Estados[Opt.Key]
        if Estados[Opt.Key] then
            Toggle.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
            Knob.Position = UDim2.new(1, -18, 0.5, -8)
        else
            Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            Knob.Position = UDim2.new(0, 2, 0.5, -8)
        end
        print("🔄 " .. Opt.Name .. ": " .. tostring(Estados[Opt.Key]))
    end)
end

-- ❌ CERRAR
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 60)
CloseBtn.BorderSizePixel = 1
CloseBtn.BorderColor3 = Color3.fromRGB(255, 80, 100)
CloseBtn.CornerRadius = UDim.new(0, 8)
CloseBtn.Position = UDim2.new(0.5, -70, 1, -45)
CloseBtn.Size = UDim2.new(0, 140, 0, 35)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕ CERRAR"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 15
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ==================================================
-- ⚙️ FUNCIONES REALES CONECTADAS A LOS BOTONES
-- ==================================================

-- 📊 ACTUALIZAR ESTADÍSTICAS
task.spawn(function()
    while task.wait(0.5) do
        local leaderstats = Player:FindFirstChild("leaderstats")
        if leaderstats then
            local Fuerza = leaderstats:FindFirstChild("Strength") or leaderstats:FindFirstChild("Fuerza")
            local Durabilidad = leaderstats:FindFirstChild("Durability") or leaderstats:FindFirstChild("Durabilidad")
            local Rebirths = leaderstats:FindFirstChild("Rebirths") or leaderstats:FindFirstChild("Renacimientos")

            if Fuerza then ValueLabels["FUERZA"].Text = tostring(Fuerza.Value) end
            if Durabilidad then ValueLabels["DURABILIDAD"].Text = tostring(Durabilidad.Value) end
            if Rebirths then ValueLabels["REBIRTHS"].Text = tostring(Rebirths.Value) end
        end
    end
end)

-- 🏋️ AUTO WEIGHT
task.spawn(function()
    while task.wait(0.3) do
        if Estados.AutoWeight and CurrentTab == "Entrenar" then
            local Char = Player.Character
            if Char and Char:FindFirstChild("HumanoidRootPart") then
                local Pesas = workspace:FindFirstChild("Weights") or workspace:FindFirstChild("Gym")
                if Pesas then
                    for _, Pesa in ipairs(Pesas:GetChildren()) do
                        if Pesa:FindFirstChild("TouchInterest") then
                            firetouchinterest(Char.HumanoidRootPart, Pesa, 1)
                            task.wait(0.05)
                            firetouchinterest(Char.HumanoidRootPart, Pesa, 0)
                            break
                        end
                    end
                end
            end
        end
    end
end)

-- 💪 AUTO PUSHUPS
task.spawn(function()
    while task.wait(0.4) do
        if Estados.AutoPushups and CurrentTab == "Entrenar" then
            local Char = Player.Character
            if Char and Char:FindFirstChild("Humanoid") then
                pcall(function()
                    ReplicatedStorage.RemoteEvents.Training:FireServer("Pushups")
                end)
            end
        end
    end
end)

-- 🔄 AUTO REBIRTH
task.spawn(function()
    while task.wait(0.8) do
        if Estados.AutoRebirth then
            local Gui = Player.PlayerGui
            local RebirthBtn = Gui:FindFirstChild("RebirthButton", true) or Gui:FindFirstChild("Rebirth", true)
            if RebirthBtn and RebirthBtn.Visible then
                pcall(function() RebirthBtn:Activate() end)
                task.wait(1)
            end
        end
    end
end)

print("✅ ===========================================")
print("✅  GOLD GUERRERO HUB — CARGADO CON ÉXITO!")
print("✅  📂 Pestañas | 📊 Stats en vivo | ⚡ Auto-Farm")
print("✅ ===========================================")
