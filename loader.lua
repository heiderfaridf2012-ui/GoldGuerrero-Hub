-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — DISEÑO EXACTO YOUNG0X
--  📱 ANCHO 560px (<600) | ✅ 2 COLUMNAS
--  ✅ Public Training • Auto Rebirths • Killing • Free Pet Shop
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui:FindFirstChild("GoldGuerreroHub"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🔳 VENTANA: ANCHO 560px | ALTO 440px
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
MainFrame.BorderColor3 = Color3.fromRGB(220, 30, 60)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -220)
MainFrame.Size = UDim2.new(0, 560, 0, 440)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

-- ⚡ TÍTULO
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -130, 0, 12)
Title.Size = UDim2.new(0, 260, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gold Guerrero Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.TextXAlignment = Enum.TextXAlignment.Center

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = MainFrame
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0.5, -70, 0, 40)
Subtitle.Size = UDim2.new(0, 140, 0, 14)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Muscle Legends"
Subtitle.TextColor3 = Color3.fromRGB(220, 60, 90)
Subtitle.TextSize = 12
Subtitle.TextXAlignment = Enum.TextXAlignment.Center

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(180, 25, 50)
Line.Position = UDim2.new(0.04, 0, 0, 65)
Line.Size = UDim2.new(0.92, 0, 0, 1)

-- 📦 FUNCIÓN PARA CREAR BOTÓN "ABRIR"
local function MakeOpenBtn(parent, isRed)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.BackgroundColor3 = isRed and Color3.fromRGB(220, 35, 65) or Color3.fromRGB(35, 25, 35)
    btn.Position = UDim2.new(0.78, 0, 0.20, 0)
    btn.Size = UDim2.new(0, 90, 0, 40)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    btn.Font = Enum.Font.GothamBold
    btn.Text = "ABRIR"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.AutoLocalize = false
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundColor3 = btn.BackgroundColor3 == (isRed and Color3.fromRGB(220, 35, 65) or Color3.fromRGB(35, 25, 35)) 
            and Color3.fromRGB(30, 180, 60) 
            or (isRed and Color3.fromRGB(220, 35, 65) or Color3.fromRGB(35, 25, 35))
        btn.Text = btn.Text == "ABRIR" and "✅ ACTIVO" or "ABRIR"
    end)
    return btn
end

-- 🟥 OPCIÓN 1 — Fast Glitch (arriba, ancho completo)
do
    local Frame = Instance.new("Frame")
    Frame.Parent = MainFrame
    Frame.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
    Frame.BorderColor3 = Color3.fromRGB(160, 25, 45)
    Frame.BorderSizePixel = 1
    Frame.Position = UDim2.new(0.04, 0, 0, 80)
    Frame.Size = UDim2.new(0.92, 0, 0, 85)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = Frame

    local Icon = Instance.new("Frame")
    Icon.Parent = Frame
    Icon.BackgroundColor3 = Color3.fromRGB(220, 35, 65)
    Icon.Position = UDim2.new(0.03, 0, 0.10, 0)
    Icon.Size = UDim2.new(0, 70, 0, 70)
    local icorner = Instance.new("UICorner")
    icorner.CornerRadius = UDim.new(0, 10)
    icorner.Parent = Icon
    local ilbl = Instance.new("TextLabel")
    ilbl.Parent = Icon
    ilbl.BackgroundTransparency = 1
    ilbl.Size = UDim2.new(1,0,1,0)
    ilbl.Font = Enum.Font.GothamBold
    ilbl.Text = "⚡"
    ilbl.TextColor3 = Color3.fromRGB(255,255,255)
    ilbl.TextSize = 30

    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.16, 0, 0.15, 0)
    Title.Size = UDim2.new(0.50, 0, 0, 28)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Fast Glitch 100%"
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Desc = Instance.new("TextLabel")
    Desc.Parent = Frame
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0.16, 0, 0.55, 0)
    Desc.Size = UDim2.new(0.50, 0, 0, 20)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = "Script de pago MUY OP"
    Desc.TextColor3 = Color3.fromRGB(150,150,150)
    Desc.TextSize = 11
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    MakeOpenBtn(Frame, true)
end

-- 🟦 OPCIÓN 2 — Public Training (ancho completo)
do
    local Frame = Instance.new("Frame")
    Frame.Parent = MainFrame
    Frame.BackgroundColor3 = Color3.fromRGB(25, 22, 30)
    Frame.BorderColor3 = Color3.fromRGB(55, 35, 45)
    Frame.BorderSizePixel = 1
    Frame.Position = UDim2.new(0.04, 0, 0, 175)
    Frame.Size = UDim2.new(0.92, 0, 0, 75)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = Frame

    local Icon = Instance.new("Frame")
    Icon.Parent = Frame
    Icon.BackgroundColor3 = Color3.fromRGB(45, 35, 45)
    Icon.Position = UDim2.new(0.03, 0, 0.10, 0)
    Icon.Size = UDim2.new(0, 55, 0, 55)
    local icorner = Instance.new("UICorner")
    icorner.CornerRadius = UDim.new(0, 10)
    icorner.Parent = Icon
    local ilbl = Instance.new("TextLabel")
    ilbl.Parent = Icon
    ilbl.BackgroundTransparency = 1
    ilbl.Size = UDim2.new(1,0,1,0)
    ilbl.Font = Enum.Font.GothamBold
    ilbl.Text = "💪"
    ilbl.TextColor3 = Color3.fromRGB(255,255,255)
    ilbl.TextSize = 24

    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.16, 0, 0.15, 0)
    Title.Size = UDim2.new(0.50, 0, 0, 24)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Public Training"
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.TextSize = 17
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Desc = Instance.new("TextLabel")
    Desc.Parent = Frame
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0.16, 0, 0.55, 0)
    Desc.Size = UDim2.new(0.50, 0, 0, 18)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = "Script Gratuito para Auto Farm!"
    Desc.TextColor3 = Color3.fromRGB(150,150,150)
    Desc.TextSize = 10
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    MakeOpenBtn(Frame, false)
end

-- 📊 FILA 3 — 2 COLUMNAS: Auto Rebirths (IZQ) + Killing (DER)
do
    -- Auto Rebirths — IZQUIERDA
    local FrameL = Instance.new("Frame")
    FrameL.Parent = MainFrame
    FrameL.BackgroundColor3 = Color3.fromRGB(25, 22, 30)
    FrameL.BorderColor3 = Color3.fromRGB(55, 35, 45)
    FrameL.BorderSizePixel = 1
    FrameL.Position = UDim2.new(0.04, 0, 0, 260)
    FrameL.Size = UDim2.new(0.44, 0, 0, 75)
    local cornerL = Instance.new("UICorner")
    cornerL.CornerRadius = UDim.new(0, 12)
    cornerL.Parent = FrameL

    local IconL = Instance.new("Frame")
    IconL.Parent = FrameL
    IconL.BackgroundColor3 = Color3.fromRGB(45, 35, 45)
    IconL.Position = UDim2.new(0.05, 0, 0.10, 0)
    IconL.Size = UDim2.new(0, 50, 0, 50)
    local icornerL = Instance.new("UICorner")
    icornerL.CornerRadius = UDim.new(0, 10)
    icornerL.Parent = IconL
    local ilblL = Instance.new("TextLabel")
    ilblL.Parent = IconL
    ilblL.BackgroundTransparency = 1
    ilblL.Size = UDim2.new(1,0,1,0)
    ilblL.Font = Enum.Font.GothamBold
    ilblL.Text = "🔄"
    ilblL.TextColor3 = Color3.fromRGB(255,255,255)
    ilblL.TextSize = 22

    local TitleL = Instance.new("TextLabel")
    TitleL.Parent = FrameL
    TitleL.BackgroundTransparency = 1
    TitleL.Position = UDim2.new(0.38, 0, 0.12, 0)
    TitleL.Size = UDim2.new(0.55, 0, 0, 22)
    TitleL.Font = Enum.Font.GothamBold
    TitleL.Text = "Auto Rebirths"
    TitleL.TextColor3 = Color3.fromRGB(255,255,255)
    TitleL.TextSize = 15
    TitleL.TextXAlignment = Enum.TextXAlignment.Left

    local DescL = Instance.new("TextLabel")
    DescL.Parent = FrameL
    DescL.BackgroundTransparency = 1
    DescL.Position = UDim2.new(0.38, 0, 0.52, 0)
    DescL.Size = UDim2.new(0.55, 0, 0, 16)
    DescL.Font = Enum.Font.Gotham
    DescL.Text = "Rebirths Automáticos"
    DescL.TextColor3 = Color3.fromRGB(150,150,150)
    DescL.TextSize = 9
    DescL.TextXAlignment = Enum.TextXAlignment.Left

    local BtnL = Instance.new("TextButton")
    BtnL.Parent = FrameL
    BtnL.BackgroundColor3 = Color3.fromRGB(35, 25, 35)
    BtnL.Position = UDim2.new(0.62, 0, 0.25, 0)
    BtnL.Size = UDim2.new(0, 80, 0, 40)
    local bcornerL = Instance.new("UICorner")
    bcornerL.CornerRadius = UDim.new(0, 8)
    bcornerL.Parent = BtnL
    BtnL.Font = Enum.Font.GothamBold
    BtnL.Text = "ABRIR"
    BtnL.TextColor3 = Color3.fromRGB(255,255,255)
    BtnL.TextSize = 12
    BtnL.AutoLocalize = false
    BtnL.MouseButton1Click:Connect(function()
        BtnL.BackgroundColor3 = BtnL.BackgroundColor3 == Color3.fromRGB(35,25,35) and Color3.fromRGB(30,180,60) or Color3.fromRGB(35,25,35)
        BtnL.Text = BtnL.Text == "ABRIR" and "✅" or "ABRIR"
    end)

    -- Killing — DERECHA
    local FrameR = Instance.new("Frame")
    FrameR.Parent = MainFrame
    FrameR.BackgroundColor3 = Color3.fromRGB(25, 22, 30)
    FrameR.BorderColor3 = Color3.fromRGB(55, 35, 45)
    FrameR.BorderSizePixel = 1
    FrameR.Position = UDim2.new(0.52, 0, 0, 260)
    FrameR.Size = UDim2.new(0.44, 0, 0, 75)
    local cornerR = Instance.new("UICorner")
    cornerR.CornerRadius = UDim.new(0, 12)
    cornerR.Parent = FrameR

    local IconR = Instance.new("Frame")
    IconR.Parent = FrameR
    IconR.BackgroundColor3 = Color3.fromRGB(45, 35, 45)
    IconR.Position = UDim2.new(0.05, 0, 0.10, 0)
    IconR.Size = UDim2.new(0, 50, 0, 50)
    local icornerR = Instance.new("UICorner")
    icornerR.CornerRadius = UDim.new(0, 10)
    icornerR.Parent = IconR
    local ilblR = Instance.new("TextLabel")
    ilblR.Parent = IconR
    ilblR.BackgroundTransparency = 1
    ilblR.Size = UDim2.new(1,0,1,0)
    ilblR.Font = Enum.Font.GothamBold
    ilblR.Text = "🎯"
    ilblR.TextColor3 = Color3.fromRGB(255,255,255)
    ilblR.TextSize = 22

    local TitleR = Instance.new("TextLabel")
    TitleR.Parent = FrameR
    TitleR.BackgroundTransparency = 1
    TitleR.Position = UDim2.new(0.38, 0, 0.12, 0)
    TitleR.Size = UDim2.new(0.55, 0, 0, 22)
    TitleR.Font = Enum.Font.GothamBold
    TitleR.Text = "Killing"
    TitleR.TextColor3 = Color3.fromRGB(255,255,255)
    TitleR.TextSize = 15
    TitleR.TextXAlignment = Enum.TextXAlignment.Left

    local DescR = Instance.new("TextLabel")
    DescR.Parent = FrameR
    DescR.BackgroundTransparency = 1
    DescR.Position = UDim2.new(0.38, 0, 0.52, 0)
    DescR.Size = UDim2.new(0.55, 0, 0, 16)
    DescR.Font = Enum.Font.Gotham
    DescR.Text = "Auto Kills + Server Hop"
    DescR.TextColor3 = Color3.fromRGB(150,150,150)
    DescR.TextSize = 9
    DescR.TextXAlignment = Enum.TextXAlignment.Left

    local BtnR = Instance.new("TextButton")
    BtnR.Parent = FrameR
    BtnR.BackgroundColor3 = Color3.fromRGB(35, 25, 35)
    BtnR.Position = UDim2.new(0.62, 0, 0.25, 0)
    BtnR.Size = UDim2.new(0, 80, 0, 40)
    local bcornerR = Instance.new("UICorner")
    bcornerR.CornerRadius = UDim.new(0, 8)
    bcornerR.Parent = BtnR
    BtnR.Font = Enum.Font.GothamBold
    BtnR.Text = "ABRIR"
    BtnR.TextColor3 = Color3.fromRGB(255,255,255)
    BtnR.TextSize = 12
    BtnR.AutoLocalize = false
    BtnR.MouseButton1Click:Connect(function()
        BtnR.BackgroundColor3 = BtnR.BackgroundColor3 == Color3.fromRGB(35,25,35) and Color3.fromRGB(30,180,60) or Color3.fromRGB(35,25,35)
        BtnR.Text = BtnR.Text == "ABRIR" and "✅" or "ABRIR"
    end)
end

-- 📊 FILA 4 — Free Pet Shop (IZQ) + SALIR (DER)
do
    -- Free Pet Shop — IZQUIERDA
    local FrameL = Instance.new("Frame")
    FrameL.Parent = MainFrame
    FrameL.BackgroundColor3 = Color3.fromRGB(25, 22, 30)
    FrameL.BorderColor3 = Color3.fromRGB(55, 35, 45)
    FrameL.BorderSizePixel = 1
    FrameL.Position = UDim2.new(0.04, 0, 0, 345)
    FrameL.Size = UDim2.new(0.44, 0, 0, 75)
    local cornerL = Instance.new("UICorner")
    cornerL.CornerRadius = UDim.new(0, 12)
    cornerL.Parent = FrameL

    local IconL = Instance.new("Frame")
    IconL.Parent = FrameL
    IconL.BackgroundColor3 = Color3.fromRGB(45, 35, 45)
    IconL.Position = UDim2.new(0.05, 0, 0.10, 0)
    IconL.Size = UDim2.new(0, 50, 0, 50)
    local icornerL = Instance.new("UICorner")
    icornerL.CornerRadius = UDim.new(0, 10)
    icornerL.Parent = IconL
    local ilblL = Instance.new("TextLabel")
    ilblL.Parent = IconL
    ilblL.BackgroundTransparency = 1
    ilblL.Size = UDim2.new(1,0,1,0)
    ilblL.Font = Enum.Font.GothamBold
    ilblL.Text = "🐾"
    ilblL.TextColor3 = Color3.fromRGB(255,255,255)
    ilblL.TextSize = 22

    local TitleL = Instance.new("TextLabel")
    TitleL.Parent = FrameL
    TitleL.BackgroundTransparency = 1
    TitleL.Position = UDim2.new(0.38, 0, 0.12, 0)
    TitleL.Size = UDim2.new(0.55, 0, 0, 22)
    TitleL.Font = Enum.Font.GothamBold
    TitleL.Text = "Free Pet Shop"
    TitleL.TextColor3 = Color3.fromRGB(255,255,255)
    TitleL.TextSize = 15
    TitleL.TextXAlignment = Enum.TextXAlignment.Left

    local DescL = Instance.new("TextLabel")
    DescL.Parent = FrameL
    DescL.BackgroundTransparency = 1
    DescL.Position = UDim2.new(0.38, 0, 0.52, 0)
    DescL.Size = UDim2.new(0.55, 0, 0, 16)
    DescL.Font = Enum.Font.Gotham
    DescL.Text = "¡Apex y más!"
    DescL.TextColor3 = Color3.fromRGB(150,150,150)
    DescL.TextSize = 9
    DescL.TextXAlignment = Enum.TextXAlignment.Left

    local BtnL = Instance.new("TextButton")
    BtnL.Parent = FrameL
    BtnL.BackgroundColor3 = Color3.fromRGB(35, 25, 35)
    BtnL.Position = UDim2.new(0.62, 0, 0.25, 0)
    BtnL.Size = UDim2.new(0, 80, 0, 40)
    local bcornerL = Instance.new("UICorner")
    bcornerL.CornerRadius = UDim.new(0, 8)
    bcornerL.Parent = BtnL
    BtnL.Font = Enum.Font.GothamBold
    BtnL.Text = "ABRIR"
    BtnL.TextColor3 = Color3.fromRGB(255,255,255)
    BtnL.TextSize = 12
    BtnL.AutoLocalize = false
    BtnL.MouseButton1Click:Connect(function()
        BtnL.BackgroundColor3 = BtnL.BackgroundColor3 == Color3.fromRGB(35,25,35) and Color3.fromRGB(30,180,60) or Color3.fromRGB(35,25,35)
        BtnL.Text = BtnL.Text == "ABRIR" and "✅" or "ABRIR"
    end)

    -- 🔴 BOTÓN SALIR GRANDE — DERECHA
    local ExitBtn = Instance.new("TextButton")
    ExitBtn.Parent = MainFrame
    ExitBtn.BackgroundColor3 = Color3.fromRGB(140, 20, 40)
    ExitBtn.BorderColor3 = Color3.fromRGB(180, 25, 50)
    ExitBtn.BorderSizePixel = 2
    ExitBtn.Position = UDim2.new(0.52, 0, 0, 345)
    ExitBtn.Size = UDim2.new(0.44, 0, 0, 75)
    local ExitCorner = Instance.new("UICorner")
    ExitCorner.CornerRadius = UDim.new(0, 12)
    ExitCorner.Parent = ExitBtn
    ExitBtn.Font = Enum.Font.GothamBold
    ExitBtn.Text = "❌  SALIR"
    ExitBtn.TextColor3 = Color3.fromRGB(255,255,255)
    ExitBtn.TextSize = 20
    ExitBtn.AutoLocalize = false
    ExitBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

print("✅ Gold Guerrero Hub — CARGADO! Diseño 2 columnas ✅")
