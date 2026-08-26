-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — ESTILO YOUNG0X
--  🎨 DISEÑO IDÉNTICO | ✅ TODO VISIBLE
--  ✅ Public Training • Auto Rebirths • Killing • Free Pet Shop
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
MainFrame.Position = UDim2.new(0.5, -360, 0.5, -240)
MainFrame.Size = UDim2.new(0, 720, 0, 480)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
MainFrame.BackgroundTransparency = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 18)
UICorner.Parent = MainFrame

-- ⚡ TÍTULO
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -170, 0, 15)
Title.Size = UDim2.new(0, 340, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gold Guerrero Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.TextXAlignment = Enum.TextXAlignment.Center

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = MainFrame
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0.5, -90, 0, 50)
Subtitle.Size = UDim2.new(0, 180, 0, 18)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Muscle Legends"
Subtitle.TextColor3 = Color3.fromRGB(220, 60, 90)
Subtitle.TextSize = 14
Subtitle.TextXAlignment = Enum.TextXAlignment.Center

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(180, 25, 50)
Line.Position = UDim2.new(0.05, 0, 0, 85)
Line.Size = UDim2.new(0.90, 0, 0, 2)

-- 📦 FUNCIÓN PARA OPCIONES
local function CreateOption(yPos, iconEmoji, title, desc, isRed)
    local bgColor = isRed and Color3.fromRGB(25, 20, 30) or Color3.fromRGB(25, 22, 30)
    local borderColor = isRed and Color3.fromRGB(160, 25, 45) or Color3.fromRGB(55, 35, 45)
    local btnColor = isRed and Color3.fromRGB(220, 35, 65) or Color3.fromRGB(45, 35, 40)
    local iconBg = isRed and Color3.fromRGB(220, 35, 65) or Color3.fromRGB(50, 40, 55)

    local OptionFrame = Instance.new("Frame")
    OptionFrame.Parent = MainFrame
    OptionFrame.BackgroundColor3 = bgColor
    OptionFrame.BorderColor3 = borderColor
    OptionFrame.BorderSizePixel = 1
    OptionFrame.Position = UDim2.new(0.05, 0, 0, yPos)
    OptionFrame.Size = UDim2.new(0.90, 0, 0, 85)
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = OptionFrame

    -- 🟥 ICONO
    local IconBox = Instance.new("Frame")
    IconBox.Parent = OptionFrame
    IconBox.BackgroundColor3 = iconBg
    IconBox.Position = UDim2.new(0.02, 0, 0.10, 0)
    IconBox.Size = UDim2.new(0, 70, 0, 70)
    
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
    TitleLabel.Size = UDim2.new(0.55, 0, 0, 30)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Parent = OptionFrame
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0.14, 0, 0.55, 0)
    DescLabel.Size = UDim2.new(0.55, 0, 0, 22)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = desc
    DescLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DescLabel.TextSize = 12
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- 🔘 BOTÓN ABRIR
    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Parent = OptionFrame
    OpenBtn.BackgroundColor3 = btnColor
    OpenBtn.Position = UDim2.new(0.80, 0, 0.18, 0)
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

-- 🟥 OPCIÓN PRINCIPAL ARRIBA
CreateOption(100, "⚡", "Fast Glitch 100%", "Script de pago MUY OP", true)

-- ⬜ TUS 4 FUNCIONES
CreateOption(205, "💪", "Public Training", "Script Gratuito para Auto Farm!", false)
CreateOption(300, "🔄", "Auto Rebirths", "Rebirths Automáticos", false)
CreateOption(395, "🎯", "Killing", "Auto Kills + Server Hop", false)
CreateOption(490, "🐾", "Free Pet Shop", "¡Apex y más!", false)

-- 🔴 BOTÓN SALIR
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 25, 45)
ExitBtn.BorderColor3 = Color3.fromRGB(200, 35, 55)
ExitBtn.BorderSizePixel = 2
ExitBtn.Position = UDim2.new(0.52, 0, 0.80, 0)
ExitBtn.Size = UDim2.new(0.43, 0, 0, 80)

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

print("✅ Gold Guerrero Hub — CARGADO! Estilo Young0x ✅")
