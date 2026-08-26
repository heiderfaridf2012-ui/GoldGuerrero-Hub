-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — ESTILO YOUNG0X ✅
--  🎨 IDÉNTICO A LA IMAGEN | BORDE ROJO | COLUMNAS
--  ⚡ Fast Glitch | Public Training | Auto Rebirths | Killing | Free Pet Shop
--  ❌ SALIR — Se abre directo | Sin botones extra
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Player = Players.LocalPlayer

-- Limpiar duplicados
if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui.GoldGuerreroHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ==============================================
-- 🔳 VENTANA PRINCIPAL — BORDE ROJO IGUAL A YOUNG0X
-- ==============================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BorderColor3 = Color3.fromRGB(200, 20, 40)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.5, -330, 0.5, -240)
MainFrame.Size = UDim2.new(0, 660, 0, 480)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- 🏷️ TÍTULO ARRIBA
local TitleTop = Instance.new("TextLabel")
TitleTop.Parent = MainFrame
TitleTop.BackgroundTransparency = 1
TitleTop.Position = UDim2.new(0.5, -120, 0, 12)
TitleTop.Size = UDim2.new(0, 240, 0, 30)
TitleTop.Font = Enum.Font.GothamBold
TitleTop.Text = "Gold Guerrero Hub"
TitleTop.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleTop.TextSize = 22

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0.5, -90, 0, 38)
SubTitle.Size = UDim2.new(0, 180, 0, 20)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Muscle Legends"
SubTitle.TextColor3 = Color3.fromRGB(220, 40, 60)
SubTitle.TextSize = 14

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(200, 20, 40)
Line.Position = UDim2.new(0.03, 0, 0, 65)
Line.Size = UDim2.new(0.94, 0, 0, 2)

-- 📦 ESTADOS
local States = {
    FastGlitch = false,
    PublicTraining = false,
    AutoRebirths = false,
    Killing = false,
    FreePetShop = false
}

-- 📦 FUNCIÓN CREAR BOTÓN ABRIR
local function MakeOpenBtn(parent, x, y, w, h)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(35, 25, 35)
    Btn.BorderColor3 = Color3.fromRGB(100, 30, 50)
    Btn.BorderSizePixel = 1
    Btn.Position = UDim2.new(x, 0, y, 0)
    Btn.Size = UDim2.new(w, 0, h, 0)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = "ABRIR"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 13
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 10)
    return Btn
end

-- ⚡ FAST GLITCH 100% — CUADRO ROJO GRANDE
local FastGlitch = Instance.new("Frame")
FastGlitch.Parent = MainFrame
FastGlitch.BackgroundColor3 = Color3.fromRGB(160, 20, 40)
FastGlitch.Position = UDim2.new(0.03, 0, 0, 80)
FastGlitch.Size = UDim2.new(0.94, 0, 0, 90)
Instance.new("UICorner", FastGlitch).CornerRadius = UDim.new(0, 14)

local FlashIcon = Instance.new("TextLabel")
FlashIcon.Parent = FastGlitch
FlashIcon.BackgroundTransparency = 1
FlashIcon.Position = UDim2.new(0.03, 0, 0.12, 0)
FlashIcon.Size = UDim2.new(0, 70, 0, 70)
FlashIcon.Font = Enum.Font.GothamBold
FlashIcon.Text = "⚡"
FlashIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
FlashIcon.TextSize = 40

local FGTitle = Instance.new("TextLabel")
FGTitle.Parent = FastGlitch
FGTitle.BackgroundTransparency = 1
FGTitle.Position = UDim2.new(0.15, 0, 0.15, 0)
FGTitle.Size = UDim2.new(0.55, 0, 0, 30)
FGTitle.Font = Enum.Font.GothamBold
FGTitle.Text = "Fast Glitch 100%"
FGTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FGTitle.TextSize = 20

local FGDesc = Instance.new("TextLabel")
FGDesc.Parent = FastGlitch
FGDesc.BackgroundTransparency = 1
FGDesc.Position = UDim2.new(0.15, 0, 0.55, 0)
FGDesc.Size = UDim2.new(0.55, 0, 0, 22)
FGDesc.Font = Enum.Font.Gotham
FGDesc.Text = "Script de pago MUY OP"
FGDesc.TextColor3 = Color3.fromRGB(255, 200, 200)
FGDesc.TextSize = 13

local FGBtn = Instance.new("TextButton")
FGBtn.Parent = FastGlitch
FGBtn.BackgroundColor3 = Color3.fromRGB(130, 15, 30)
FGBtn.Position = UDim2.new(0.82, -90, 0.15, 0)
FGBtn.Size = UDim2.new(0, 80, 0, 60)
FGBtn.Font = Enum.Font.GothamBold
FGBtn.Text = "ABRIR"
FGBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FGBtn.TextSize = 15
Instance.new("UICorner", FGBtn).CornerRadius = UDim.new(0, 12)
FGBtn.MouseButton1Click:Connect(function()
    States.FastGlitch = not States.FastGlitch
    FGBtn.BackgroundColor3 = States.FastGlitch and Color3.fromRGB(30, 160, 80) or Color3.fromRGB(130, 15, 30)
    FGBtn.Text = States.FastGlitch and "✓ ACTIVO" or "ABRIR"
end)

-- 🏋️ PUBLIC TRAINING
local PublicTrain = Instance.new("Frame")
PublicTrain.Parent = MainFrame
PublicTrain.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
PublicTrain.BorderColor3 = Color3.fromRGB(60, 40, 60)
PublicTrain.BorderSizePixel = 1
PublicTrain.Position = UDim2.new(0.03, 0, 0, 180)
PublicTrain.Size = UDim2.new(0.94, 0, 0, 75)
Instance.new("UICorner", PublicTrain).CornerRadius = UDim.new(0, 12)

local PTIcon = Instance.new("TextLabel")
PTIcon.Parent = PublicTrain
PTIcon.BackgroundTransparency = 1
PTIcon.Position = UDim2.new(0.03, 0, 0.12, 0)
PTIcon.Size = UDim2.new(0, 50, 0, 50)
PTIcon.Font = Enum.Font.GothamBold
PTIcon.Text = "🏋️"
PTIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
PTIcon.TextSize = 28

local PTTitle = Instance.new("TextLabel")
PTTitle.Parent = PublicTrain
PTTitle.BackgroundTransparency = 1
PTTitle.Position = UDim2.new(0.15, 0, 0.15, 0)
PTTitle.Size = UDim2.new(0.50, 0, 0, 25)
PTTitle.Font = Enum.Font.GothamBold
PTTitle.Text = "Public Training"
PTTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PTTitle.TextSize = 16

local PTDesc = Instance.new("TextLabel")
PTDesc.Parent = PublicTrain
PTDesc.BackgroundTransparency = 1
PTDesc.Position = UDim2.new(0.15, 0, 0.55, 0)
PTDesc.Size = UDim2.new(0.50, 0, 0, 20)
PTDesc.Font = Enum.Font.Gotham
PTDesc.Text = "Script Gratuito para Auto Farm!"
PTDesc.TextColor3 = Color3.fromRGB(160, 160, 180)
PTDesc.TextSize = 12

local PTBtn = MakeOpenBtn(PublicTrain, 0.82, 0.15, 80, 55)
PTBtn.MouseButton1Click:Connect(function()
    States.PublicTraining = not States.PublicTraining
    PTBtn.BackgroundColor3 = States.PublicTraining and Color3.fromRGB(30, 160, 80) or Color3.fromRGB(35, 25, 35)
    PTBtn.Text = States.PublicTraining and "✓ ACTIVO" or "ABRIR"
end)

-- 🔄 AUTO REBIRTHS (COLUMNA IZQUIERDA)
local AutoRebirths = Instance.new("Frame")
AutoRebirths.Parent = MainFrame
AutoRebirths.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
AutoRebirths.BorderColor3 = Color3.fromRGB(60, 40, 60)
AutoRebirths.BorderSizePixel = 1
AutoRebirths.Position = UDim2.new(0.03, 0, 0, 270)
AutoRebirths.Size = UDim2.new(0.45, 0, 0, 80)
Instance.new("UICorner", AutoRebirths).CornerRadius = UDim.new(0, 12)

local ARIcon = Instance.new("TextLabel")
ARIcon.Parent = AutoRebirths
ARIcon.BackgroundTransparency = 1
ARIcon.Position = UDim2.new(0.05, 0, 0.12, 0)
ARIcon.Size = UDim2.new(0, 45, 0, 45)
ARIcon.Font = Enum.Font.GothamBold
ARIcon.Text = "🔄"
ARIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
ARIcon.TextSize = 26

local ARTitle = Instance.new("TextLabel")
ARTitle.Parent = AutoRebirths
ARTitle.BackgroundTransparency = 1
ARTitle.Position = UDim2.new(0.30, 0, 0.12, 0)
ARTitle.Size = UDim2.new(0.55, 0, 0, 25)
ARTitle.Font = Enum.Font.GothamBold
ARTitle.Text = "Auto Rebirths"
ARTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ARTitle.TextSize = 15

local ARDesc = Instance.new("TextLabel")
ARDesc.Parent = AutoRebirths
ARDesc.BackgroundTransparency = 1
ARDesc.Position = UDim2.new(0.30, 0, 0.55, 0)
ARDesc.Size = UDim2.new(0.55, 0, 0, 20)
ARDesc.Font = Enum.Font.Gotham
ARDesc.Text = "Rebirths Automáticos"
ARDesc.TextColor3 = Color3.fromRGB(160, 160, 180)
ARDesc.TextSize = 11

local ARBtn = MakeOpenBtn(AutoRebirths, 0.75, 0.15, 60, 55)
ARBtn.MouseButton1Click:Connect(function()
    States.AutoRebirths = not States.AutoRebirths
    ARBtn.BackgroundColor3 = States.AutoRebirths and Color3.fromRGB(30, 160, 80) or Color3.fromRGB(35, 25, 35)
    ARBtn.Text = States.AutoRebirths and "✓" or "ABRIR"
end)

-- 🎯 KILLING (COLUMNA DERECHA)
local Killing = Instance.new("Frame")
Killing.Parent = MainFrame
Killing.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
Killing.BorderColor3 = Color3.fromRGB(60, 40, 60)
Killing.BorderSizePixel = 1
Killing.Position = UDim2.new(0.52, 0, 0, 270)
Killing.Size = UDim2.new(0.45, 0, 0, 80)
Instance.new("UICorner", Killing).CornerRadius = UDim.new(0, 12)

local KIcon = Instance.new("TextLabel")
KIcon.Parent = Killing
KIcon.BackgroundTransparency = 1
KIcon.Position = UDim2.new(0.05, 0, 0.12, 0)
KIcon.Size = UDim2.new(0, 45, 0, 45)
KIcon.Font = Enum.Font.GothamBold
KIcon.Text = "🎯"
KIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
KIcon.TextSize = 26

local KTitle = Instance.new("TextLabel")
KTitle.Parent = Killing
KTitle.BackgroundTransparency = 1
KTitle.Position = UDim2.new(0.30, 0, 0.12, 0)
KTitle.Size = UDim2.new(0.55, 0, 0, 25)
KTitle.Font = Enum.Font.GothamBold
KTitle.Text = "Killing"
KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KTitle.TextSize = 15

local KDesc = Instance.new("TextLabel")
KDesc.Parent = Killing
KDesc.BackgroundTransparency = 1
KDesc.Position = UDim2.new(0.30, 0, 0.55, 0)
KDesc.Size = UDim2.new(0.55, 0, 0, 20)
KDesc.Font = Enum.Font.Gotham
KDesc.Text = "Auto Kills + Server Hop"
KDesc.TextColor3 = Color3.fromRGB(160, 160, 180)
KDesc.TextSize = 11

local KBtn = MakeOpenBtn(Killing, 0.75, 0.15, 60, 55)
KBtn.MouseButton1Click:Connect(function()
    States.Killing = not States.Killing
    KBtn.BackgroundColor3 = States.Killing and Color3.fromRGB(30, 160, 80) or Color3.fromRGB(35, 25, 35)
    KBtn.Text = States.Killing and "✓" or "ABRIR"
end)

-- 🐾 FREE PET SHOP
local FreePetShop = Instance.new("Frame")
FreePetShop.Parent = MainFrame
FreePetShop.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
FreePetShop.BorderColor3 = Color3.fromRGB(60, 40, 60)
FreePetShop.BorderSizePixel = 1
FreePetShop.Position = UDim2.new(0.03, 0, 0, 360)
FreePetShop.Size = UDim2.new(0.45, 0, 0, 75)
Instance.new("UICorner", FreePetShop).CornerRadius = UDim.new(0, 12)

local PSIcon = Instance.new("TextLabel")
PSIcon.Parent = FreePetShop
PSIcon.BackgroundTransparency = 1
PSIcon.Position = UDim2.new(0.05, 0, 0.12, 0)
PSIcon.Size = UDim2.new(0, 45, 0, 45)
PSIcon.Font = Enum.Font.GothamBold
PSIcon.Text = "🐾"
PSIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
PSIcon.TextSize = 26

local PSTitle = Instance.new("TextLabel")
PSTitle.Parent = FreePetShop
PSTitle.BackgroundTransparency = 1
PSTitle.Position = UDim2.new(0.30, 0, 0.15, 0)
PSTitle.Size = UDim2.new(0.55, 0, 0, 25)
PSTitle.Font = Enum.Font.GothamBold
PSTitle.Text = "Free Pet Shop"
PSTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PSTitle.TextSize = 15

local PSDesc = Instance.new("TextLabel")
PSDesc.Parent = FreePetShop
PSDesc.BackgroundTransparency = 1
PSDesc.Position = UDim2.new(0.30, 0, 0.58, 0)
PSDesc.Size = UDim2.new(0.55, 0, 0, 20)
PSDesc.Font = Enum.Font.Gotham
PSDesc.Text = "¡Apex y más!"
PSDesc.TextColor3 = Color3.fromRGB(160, 160, 180)
PSDesc.TextSize = 11

local PSBtn = MakeOpenBtn(FreePetShop, 0.75, 0.15, 60, 55)
PSBtn.MouseButton1Click:Connect(function()
    States.FreePetShop = not States.FreePetShop
    PSBtn.BackgroundColor3 = States.FreePetShop and Color3.fromRGB(30, 160, 80) or Color3.fromRGB(35, 25, 35)
    PSBtn.Text = States.FreePetShop and "✓" or "ABRIR"
end)

-- ❌ BOTÓN SALIR — ROJO GRANDE
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 20, 40)
ExitBtn.Position = UDim2.new(0.52, 0, 0, 360)
ExitBtn.Size = UDim2.new(0.45, 0, 0, 75)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "✕ SALIR"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 18
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 12)
ExitBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- 🔄 BUCLE DE FUNCIONES
task.spawn(function()
    while task.wait(0.3) do
        if not ScreenGui:IsDescendantOf(game) then break end
        local Char = Player.Character
        if not Char then continue end

        -- Auto Rebirths
        if States.AutoRebirths then
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if remotes and remotes:FindFirstChild("Rebirth") then
                remotes.Rebirth:FireServer()
                task.wait(2)
            end
        end
    end
end)

print("==================================================")
print("✅  GOLD GUERRERO HUB — CARGADO COMPLETAMENTE ✅")
print("🎨 ESTILO YOUNG0X — IDÉNTICO A LA IMAGEN")
print("⚡ Fast Glitch | 🏋️ Public Training | 🔄 Auto Rebirths")
print("🎯 Killing | 🐾 Free Pet Shop | ❌ SALIR")
print("==================================================")
