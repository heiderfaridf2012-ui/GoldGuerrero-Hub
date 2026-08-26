-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — ANCHO EXACTO ✅
--  📐 IGUAL DE ANCHO QUE YOUNG0X — NO MUY GRANDE
--  ❌ SIN Fast Glitch | ✕ X ROJA BONITA EN SALIR
--  🎨 BOTONES ABRIR ESTILO ORIGINAL | TODO ALINEADO
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- ✅ BORRA DUPLICADOS
if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui.GoldGuerreroHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🔳 VENTANA — ANCHO EXACTO DE LA IMAGEN ✅ (no muy ancho, justo)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BorderColor3 = Color3.fromRGB(200, 20, 40)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.5, -340, 0.5, -205)
MainFrame.Size = UDim2.new(0, 680, 0, 410)  -- ✅ ANCHO JUSTO, IGUAL A LA IMAGEN
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 18)

-- 🏷️ TÍTULO — EXACTAMENTE IGUAL ✅
local TitleTop = Instance.new("TextLabel")
TitleTop.Parent = MainFrame
TitleTop.BackgroundTransparency = 1
TitleTop.Position = UDim2.new(0.5, -115, 0, 10)
TitleTop.Size = UDim2.new(0, 230, 0, 32)
TitleTop.Font = Enum.Font.GothamBold
TitleTop.Text = "Gold Guerrero Hub"
TitleTop.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleTop.TextSize = 22

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0.5, -90, 0, 42)
SubTitle.Size = UDim2.new(0, 180, 0, 16)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Muscle Legends"
SubTitle.TextColor3 = Color3.fromRGB(220, 40, 60)
SubTitle.TextSize = 12

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(200, 20, 40)
Line.Position = UDim2.new(0.025, 0, 0, 65)
Line.Size = UDim2.new(0.95, 0, 0, 2)

-- 📦 FUNCIÓN BOTÓN ABRIR — ESTILO ORIGINAL, CHIQUITO ✅
local function BtnAbrir(parent, x, y, w, h)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(35, 25, 40)
    Btn.BorderColor3 = Color3.fromRGB(80, 40, 60)
    Btn.BorderSizePixel = 1
    Btn.Position = UDim2.new(x, 0, y, 0)
    Btn.Size = UDim2.new(w, 0, h, 0)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = "ABRIR"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 11
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 10)
    return Btn
end

-- 🏋️ PUBLIC TRAINING — ARRIBA, SIN Fast Glitch ✅
local PublicTrain = Instance.new("Frame")
PublicTrain.Parent = MainFrame
PublicTrain.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
PublicTrain.BorderColor3 = Color3.fromRGB(60, 40, 70)
PublicTrain.BorderSizePixel = 1
PublicTrain.Position = UDim2.new(0.025, 0, 0, 80)
PublicTrain.Size = UDim2.new(0.95, 0, 0, 85)
Instance.new("UICorner", PublicTrain).CornerRadius = UDim.new(0, 14)

local PTIcon = Instance.new("TextLabel")
PTIcon.Parent = PublicTrain
PTIcon.BackgroundTransparency = 1
PTIcon.Position = UDim2.new(0.04, 0, 0.15, 0)
PTIcon.Size = UDim2.new(0, 50, 0, 50)
PTIcon.Font = Enum.Font.GothamBold
PTIcon.Text = "🏋️"
PTIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
PTIcon.TextSize = 30

local PTTitle = Instance.new("TextLabel")
PTTitle.Parent = PublicTrain
PTTitle.BackgroundTransparency = 1
PTTitle.Position = UDim2.new(0.18, 0, 0.20, 0)
PTTitle.Size = UDim2.new(0.50, 0, 0, 26)
PTTitle.Font = Enum.Font.GothamBold
PTTitle.Text = "Public Training"
PTTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PTTitle.TextSize = 17

local PTDesc = Instance.new("TextLabel")
PTDesc.Parent = PublicTrain
PTDesc.BackgroundTransparency = 1
PTDesc.Position = UDim2.new(0.18, 0, 0.55, 0)
PTDesc.Size = UDim2.new(0.50, 0, 0, 18)
PTDesc.Font = Enum.Font.Gotham
PTDesc.Text = "Script Gratuito para Auto Farm!"
PTDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
PTDesc.TextSize = 11

BtnAbrir(PublicTrain, 0.78, 0.20, 110, 45)

-- 🔄 AUTO REBIRTHS — IZQUIERDA ✅
local AutoRebirths = Instance.new("Frame")
AutoRebirths.Parent = MainFrame
AutoRebirths.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
AutoRebirths.BorderColor3 = Color3.fromRGB(60, 40, 70)
AutoRebirths.BorderSizePixel = 1
AutoRebirths.Position = UDim2.new(0.025, 0, 0, 180)
AutoRebirths.Size = UDim2.new(0.46, 0, 0, 80)
Instance.new("UICorner", AutoRebirths).CornerRadius = UDim.new(0, 14)

local ARIcon = Instance.new("TextLabel")
ARIcon.Parent = AutoRebirths
ARIcon.BackgroundTransparency = 1
ARIcon.Position = UDim2.new(0.06, 0, 0.15, 0)
ARIcon.Size = UDim2.new(0, 45, 0, 45)
ARIcon.Font = Enum.Font.GothamBold
ARIcon.Text = "🔄"
ARIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
ARIcon.TextSize = 26

local ARTitle = Instance.new("TextLabel")
ARTitle.Parent = AutoRebirths
ARTitle.BackgroundTransparency = 1
ARTitle.Position = UDim2.new(0.25, 0, 0.18, 0)
ARTitle.Size = UDim2.new(0.55, 0, 0, 24)
ARTitle.Font = Enum.Font.GothamBold
ARTitle.Text = "Auto Rebirths"
ARTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ARTitle.TextSize = 15

local ARDesc = Instance.new("TextLabel")
ARDesc.Parent = AutoRebirths
ARDesc.BackgroundTransparency = 1
ARDesc.Position = UDim2.new(0.25, 0, 0.52, 0)
ARDesc.Size = UDim2.new(0.55, 0, 0, 18)
ARDesc.Font = Enum.Font.Gotham
ARDesc.Text = "Rebirths Automáticos"
ARDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
ARDesc.TextSize = 10

BtnAbrir(AutoRebirths, 0.70, 0.18, 85, 45)

-- 🎯 KILLING — DERECHA ✅
local Killing = Instance.new("Frame")
Killing.Parent = MainFrame
Killing.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
Killing.BorderColor3 = Color3.fromRGB(60, 40, 70)
Killing.BorderSizePixel = 1
Killing.Position = UDim2.new(0.515, 0, 0, 180)
Killing.Size = UDim2.new(0.46, 0, 0, 80)
Instance.new("UICorner", Killing).CornerRadius = UDim.new(0, 14)

local KIcon = Instance.new("TextLabel")
KIcon.Parent = Killing
KIcon.BackgroundTransparency = 1
KIcon.Position = UDim2.new(0.06, 0, 0.15, 0)
KIcon.Size = UDim2.new(0, 45, 0, 45)
KIcon.Font = Enum.Font.GothamBold
KIcon.Text = "🎯"
KIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
KIcon.TextSize = 26

local KTitle = Instance.new("TextLabel")
KTitle.Parent = Killing
KTitle.BackgroundTransparency = 1
KTitle.Position = UDim2.new(0.25, 0, 0.18, 0)
KTitle.Size = UDim2.new(0.55, 0, 0, 24)
KTitle.Font = Enum.Font.GothamBold
KTitle.Text = "Killing"
KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KTitle.TextSize = 15

local KDesc = Instance.new("TextLabel")
KDesc.Parent = Killing
KDesc.BackgroundTransparency = 1
KDesc.Position = UDim2.new(0.25, 0, 0.52, 0)
KDesc.Size = UDim2.new(0.55, 0, 0, 18)
KDesc.Font = Enum.Font.Gotham
KDesc.Text = "Auto Kills + Server Hop"
KDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
KDesc.TextSize = 10

BtnAbrir(Killing, 0.70, 0.18, 85, 45)

-- 🐾 FREE PET SHOP — ABAJO IZQUIERDA ✅
local FreePetShop = Instance.new("Frame")
FreePetShop.Parent = MainFrame
FreePetShop.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
FreePetShop.BorderColor3 = Color3.fromRGB(60, 40, 70)
FreePetShop.BorderSizePixel = 1
FreePetShop.Position = UDim2.new(0.025, 0, 0, 275)
FreePetShop.Size = UDim2.new(0.46, 0, 0, 80)
Instance.new("UICorner", FreePetShop).CornerRadius = UDim.new(0, 14)

local PSIcon = Instance.new("TextLabel")
PSIcon.Parent = FreePetShop
PSIcon.BackgroundTransparency = 1
PSIcon.Position = UDim2.new(0.06, 0, 0.15, 0)
PSIcon.Size = UDim2.new(0, 45, 0, 45)
PSIcon.Font = Enum.Font.GothamBold
PSIcon.Text = "🐾"
PSIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
PSIcon.TextSize = 26

local PSTitle = Instance.new("TextLabel")
PSTitle.Parent = FreePetShop
PSTitle.BackgroundTransparency = 1
PSTitle.Position = UDim2.new(0.25, 0, 0.18, 0)
PSTitle.Size = UDim2.new(0.55, 0, 0, 24)
PSTitle.Font = Enum.Font.GothamBold
PSTitle.Text = "Free Pet Shop"
PSTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PSTitle.TextSize = 15

local PSDesc = Instance.new("TextLabel")
PSDesc.Parent = FreePetShop
PSDesc.BackgroundTransparency = 1
PSDesc.Position = UDim2.new(0.25, 0, 0.52, 0)
PSDesc.Size = UDim2.new(0.55, 0, 0, 18)
PSDesc.Font = Enum.Font.Gotham
PSDesc.Text = "¡Apex y más!"
PSDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
PSDesc.TextSize = 10

BtnAbrir(FreePetShop, 0.70, 0.18, 85, 45)

-- ❌ BOTÓN SALIR — ✕ X ROJA BONITA, EXACTAMENTE IGUAL ✅
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(140, 15, 35)
ExitBtn.Position = UDim2.new(0.515, 0, 0, 275)
ExitBtn.Size = UDim2.new(0.46, 0, 0, 80)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "✕  SALIR"  -- ✕ X ROJA, SIN CUADRADO FEO ✅
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 20
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 14)
ExitBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

print("==================================================")
print("✅  GOLD GUERRERO HUB — ANCHO EXACTO ✅")
print("📐 IGUAL DE ANCHO QUE YOUNG0X | ✕ X ROJA BONITA")
print("🏋️ Public Training arriba | TODO ALINEADO")
print("==================================================")
