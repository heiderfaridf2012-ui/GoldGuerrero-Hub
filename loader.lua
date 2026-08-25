-- ==================================================
--        🔶 GOLD GUERRERO — HUB FINAL
--  ✅ Menú encima del juego | ✅ NO borra nada
--  ✅ Estilo igual al de Young0x | ✅ Móvil optimizado
--  ✅ Pestañas + Stats + Interruptores | ✅ Arrastrable
-- ==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerrero"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 📱 VENTANA — SE VE ENCIMA DEL JUEGO
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
    TabBtn.AutoLocalize = false
    TabButtons[TabData.Name] = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        for _, Btn in pairs(TabButtons) do
            Btn.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
        end
        TabBtn.BackgroundColor3 = Color3.fromRGB(30, 80, 150)
    end)
end

-- 📊 ESTADÍSTICAS
local StatsContainer = Instance.new("Frame")
StatsContainer.Parent = MainFrame
StatsContainer.BackgroundColor3 = Color3.fromRGB(25, 35, 50)
StatsContainer.BorderSizePixel = 1
StatsContainer.BorderColor3 = Color3.fromRGB(45, 85, 155)
StatsContainer.Position = UDim2.new(0, 12, 0, 100)
StatsContainer.Size = UDim2.new(1, -24, 0, 80)

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
end

-- 🔘 INTERRUPTORES
local OptionsContainer = Instance.new("Frame")
OptionsContainer.Parent = MainFrame
OptionsContainer.BackgroundTransparency = 1
OptionsContainer.Position = UDim2.new(0, 12, 0, 190)
OptionsContainer.Size = UDim2.new(1, -24, 0, 110)

local Options = {
    {Name = "Auto Weight", State = false},
    {Name = "Auto Pushups", State = false},
    {Name = "Auto Rebirth", State = false},
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
    Toggle.BackgroundColor3 = Opt.State and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(50, 50, 70)
    Toggle.Position = UDim2.new(0.85, -15, 0.5, -10)
    Toggle.Size = UDim2.new(0, 30, 0, 20)
    Toggle.CornerRadius = UDim.new(0, 10)
    Toggle.AutoLocalize = false

    local Knob = Instance.new("Frame")
    Knob.Parent = Toggle
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.Position = Opt.State and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    Knob.Size = UDim2.new(0, 16, 0, 16)
    Knob.CornerRadius = UDim.new(0, 8)

    Toggle.MouseButton1Click:Connect(function()
        Opt.State = not Opt.State
        if Opt.State then
            Toggle.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
            Knob.Position = UDim2.new(1, -18, 0.5, -8)
        else
            Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            Knob.Position = UDim2.new(0, 2, 0.5, -8)
        end
    end)
end

-- ❌ CERRAR MENÚ
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
CloseBtn.AutoLocalize = false
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ Gold Guerrero — Cargado con éxito!")
