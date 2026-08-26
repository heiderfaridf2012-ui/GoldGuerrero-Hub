-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — ESTILO YOUNG0X
--  🎨 DISEÑO IDÉNTICO | ✅ TODO VISIBLE | ✅ FÁCIL USO
-- ==================================================

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui:FindFirstChild("GoldGuerreroHub"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🔳 VENTANA PRINCIPAL — BORDES REDONDEADOS
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
MainFrame.BorderColor3 = Color3.fromRGB(220, 30, 60)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.5, -380, 0.5, -260)
MainFrame.Size = UDim2.new(0, 760, 0, 520)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
MainFrame.BackgroundTransparency = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 18)
UICorner.Parent = MainFrame

-- ⚡ BARRA DE TÍTULO
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundTransparency = 1
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.Size = UDim2.new(1, 0, 0, 80)

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -180, 0, 15)
Title.Size = UDim2.new(0, 360, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gold Guerrero Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.TextXAlignment = Enum.TextXAlignment.Center

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = TitleBar
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0.5, -100, 0, 48)
Subtitle.Size = UDim2.new(0, 200, 0, 18)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Muscle Legends"
Subtitle.TextColor3 = Color3.fromRGB(220, 60, 90)
Subtitle.TextSize = 14
Subtitle.TextXAlignment = Enum.TextXAlignment.Center

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(180, 25, 50)
Line.Position = UDim2.new(0.05, 0, 0, 80)
Line.Size = UDim2.new(0.90, 0, 0, 2)

-- 📦 FUNCIÓN PARA CREAR OPCIONES
local function CreateOption(yPos, iconColor, iconEmoji, title, desc, isRed)
    local OptionFrame = Instance.new("Frame")
    OptionFrame.Parent = MainFrame
    OptionFrame.BackgroundColor3 = Color3.fromRGB(25, 22, 30)
    OptionFrame.BorderColor3 = isRed and Color3.fromRGB(160, 25, 45) or Color3.fromRGB(60, 35, 45)
    OptionFrame.BorderSizePixel = 1
    OptionFrame.Position = UDim2.new(0.05, 0, 0, yPos)
    OptionFrame.Size = UDim2.new(0.90, 0, 0, 85)
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = OptionFrame

    -- 🟥 ICONO
    local IconBox = Instance.new("Frame")
    IconBox.Parent = OptionFrame
    IconBox.BackgroundColor3 = iconColor
    IconBox.Position = UDim2.new(0.02, 0, 0.15, 0)
    IconBox.Size = UDim2.new(0, 65, 0, 65)
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = IconBox

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Parent = IconBox
    IconLabel.BackgroundTransparency = 1
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Text = iconEmoji
    IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    IconLabel.TextSize = 32

    -- 📝 TEXTO
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = OptionFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.14, 0, 0.15, 0)
    TitleLabel.Size = UDim2.new(0.55, 0, 0, 32)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 22
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Parent = OptionFrame
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0.14, 0, 0.55, 0)
    DescLabel.Size = UDim2.new(0.55, 0, 0, 24)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = desc
    DescLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    DescLabel.TextSize = 12
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- 🔘 BOTÓN ABRIR
    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Parent = OptionFrame
    OpenBtn.BackgroundColor3 = isRed and Color3.fromRGB(210, 35, 65) or Color3.fromRGB(45, 35, 40)
    OpenBtn.Position = UDim2.new(0.80, 0, 0.20, 0)
    OpenBtn.Size = UDim2.new(0, 110, 0, 50)
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 10)
    BtnCorner.Parent = OpenBtn

    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.Text = "ABRIR"
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.TextSize = 15
    OpenBtn.AutoLocalize = false
end

-- 🟥 OPCIÓN PRINCIPAL ROJA (arriba)
do
    local OptionFrame = Instance.new("Frame")
    OptionFrame.Parent = MainFrame
    OptionFrame.BackgroundColor3 = Color3.fromRGB(25, 22, 30)
    OptionFrame.BorderColor3 = Color3.fromRGB(160, 25, 45)
    OptionFrame.BorderSizePixel = 1
    OptionFrame.Position = UDim2.new(0.05, 0, 0, 95)
    OptionFrame.Size = UDim2.new(0.90, 0, 0, 95)
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = OptionFrame

    local IconBox = Instance.new("Frame")
    IconBox.Parent = OptionFrame
    IconBox.BackgroundColor3 = Color3.fromRGB(220, 35, 65)
    IconBox.Position = UDim2.new(0.02, 0, 0.10, 0)
    IconBox.Size = UDim2.new(0, 75, 0, 75)
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = IconBox

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Parent = IconBox
    IconLabel.BackgroundTransparency = 1
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Text = "⚡"
    IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    IconLabel.TextSize = 34

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = OptionFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.14, 0, 0.15, 0)
    TitleLabel.Size = UDim2.new(0.55, 0, 0, 32)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "Fast Glitch 100%"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 22

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Parent = OptionFrame
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0.14, 0, 0.55, 0)
    DescLabel.Size = UDim2.new(0.55, 0, 0, 24)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = "Script de pago MUY OP"
    DescLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    DescLabel.TextSize = 12

    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Parent = OptionFrame
    OpenBtn.BackgroundColor3 = Color3.fromRGB(220, 35, 65)
    OpenBtn.Position = UDim2.new(0.80, 0, 0.20, 0)
    OpenBtn.Size = UDim2.new(0, 110, 0, 55)
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 10)
    BtnCorner.Parent = OpenBtn

    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.Text = "ABRIR"
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.TextSize = 15
    OpenBtn.AutoLocalize = false
end

-- ⬜ OPCIONES PRINCIPALES — TUS FUNCIONES
CreateOption(205, Color3.fromRGB(45, 35, 40), "💪", "Public Training", "Script Gratuito para Auto Farm!", false)
CreateOption(300, Color3.fromRGB(45, 35, 40), "🔄", "Auto Rebirths", "Rebirths Automáticos", false)
CreateOption(395, Color3.fromRGB(45, 35, 40), "🎯", "Killing", "Auto Kills + Server Hop", false)
CreateOption(490, Color3.fromRGB(45, 35, 40), "🐾", "Free Pet Shop", "¡Apex y más!", false)

-- 🔴 BOTÓN SALIR GRANDE ABAJO
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 25, 45)
ExitBtn.BorderColor3 = Color3.fromRGB(200, 35, 55)
ExitBtn.BorderSizePixel = 2
ExitBtn.Position = UDim2.new(0.52, 0, 0.80, 0)
ExitBtn.Size = UDim2.new(0.43, 0, 0, 85)

local ExitCorner = Instance.new("UICorner")
ExitCorner.CornerRadius = UDim.new(0, 12)
ExitCorner.Parent = ExitBtn

ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "❌  SALIR"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 22
ExitBtn.AutoLocalize = false

ExitBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ Gold Guerrero Hub — CARGADO! Estilo Young0x aplicado ✅")
