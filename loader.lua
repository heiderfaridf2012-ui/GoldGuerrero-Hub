-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — MÓVIL PERFECTO ✅
--  📱 PANTALLA COMPLETA VERTICAL | SIN LOGO ROBLOX
--  ❌ ✕ X BONITA SALIR | BOTONES ABRIR CHIQUITOS
--  🏋️ Public Training = EL MÁS GRANDE | TODO IGUALITO
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

-- 🔳 VENTANA — PANTALLA COMPLETA MÓVIL VERTICAL
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BorderColor3 = Color3.fromRGB(200, 20, 40)
MainFrame.BorderSizePixel = 0  -- Sin borde para pantalla completa
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.Size = UDim2.new(1, 0, 1, 0)  -- OCUPA TODA LA PANTALLA ✅
MainFrame.Active = true
MainFrame.Draggable = false  -- Fijo para móvil
MainFrame.Visible = true

-- 🏷️ TÍTULO — ARRIBA CENTRADO
local TitleTop = Instance.new("TextLabel")
TitleTop.Parent = MainFrame
TitleTop.BackgroundTransparency = 1
TitleTop.Position = UDim2.new(0.5, -120, 0.03, 0)
TitleTop.Size = UDim2.new(0, 240, 0, 35)
TitleTop.Font = Enum.Font.GothamBold
TitleTop.Text = "Gold Guerrero Hub"
TitleTop.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleTop.TextSize = 24

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0.5, -95, 0.08, 0)
SubTitle.Size = UDim2.new(0, 190, 0, 20)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Muscle Legends"
SubTitle.TextColor3 = Color3.fromRGB(220, 40, 60)
SubTitle.TextSize = 14

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(200, 20, 40)
Line.Position = UDim2.new(0.05, 0, 0.13, 0)
Line.Size = UDim2.new(0.90, 0, 0, 2)

-- 📦 FUNCIÓN BOTÓN ABRIR — CHIQUITO, COMPACTO ✅
local function BtnAbrir(parent, x, y, w, h)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(40, 25, 45)
    Btn.BorderColor3 = Color3.fromRGB(100, 40, 70)
    Btn.BorderSizePixel = 1
    Btn.Position = UDim2.new(x, 0, y, 0)
    Btn.Size = UDim2.new(w, 0, h, 0)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = "ABRIR"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 11
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
    return Btn
end

-- 🏋️ PUBLIC TRAINING — EL MÁS GRANDE ✅ ARRIBA
local PublicTrain = Instance.new("Frame")
PublicTrain.Parent = MainFrame
PublicTrain.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
PublicTrain.BorderColor3 = Color3.fromRGB(60, 40, 70)
PublicTrain.BorderSizePixel = 1
PublicTrain.Position = UDim2.new(0.05, 0, 0.16, 0)
PublicTrain.Size = UDim2.new(0.90, 0, 0, 110)  -- EL MÁS GRANDE ✅
Instance.new("UICorner", PublicTrain).CornerRadius = UDim.new(0, 14)

local PTIcon = Instance.new("TextLabel")
PTIcon.Parent = PublicTrain
PTIcon.BackgroundTransparency = 1
PTIcon.Position = UDim2.new(0.05, 0, 0.15, 0)
PTIcon.Size = UDim2.new(0, 60, 0, 60)
PTIcon.Font = Enum.Font.GothamBold
PTIcon.Text = "🏋️"
PTIcon.TextSize = 34

local PTTitle = Instance.new("TextLabel")
PTTitle.Parent = PublicTrain
PTTitle.BackgroundTransparency = 1
PTTitle.Position = UDim2.new(0.20, 0, 0.20, 0)
PTTitle.Size = UDim2.new(0.50, 0, 0, 30)
PTTitle.Font = Enum.Font.GothamBold
PTTitle.Text = "Public Training"
PTTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PTTitle.TextSize = 19

local PTDesc = Instance.new("TextLabel")
PTDesc.Parent = PublicTrain
PTDesc.BackgroundTransparency = 1
PTDesc.Position = UDim2.new(0.20, 0, 0.55, 0)
PTDesc.Size = UDim2.new(0.50, 0, 0, 22)
PTDesc.Font = Enum.Font.Gotham
PTDesc.Text = "Script Gratuito para Auto Farm!"
PTDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
PTDesc.TextSize = 12

BtnAbrir(PublicTrain, 0.78, 0.20, 100, 50)  -- CHIQUITO ✅

-- 🔄 AUTO REBIRTHS — IZQUIERDA, CHIQUITO ✅
local AutoRebirths = Instance.new("Frame")
AutoRebirths.Parent = MainFrame
AutoRebirths.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
AutoRebirths.BorderColor3 = Color3.fromRGB(60, 40, 70)
AutoRebirths.BorderSizePixel = 1
AutoRebirths.Position = UDim2.new(0.05, 0, 0.35, 0)
AutoRebirths.Size = UDim2.new(0.42, 0, 0, 95)
Instance.new("UICorner", AutoRebirths).CornerRadius = UDim.new(0, 14)

local ARIcon = Instance.new("TextLabel")
ARIcon.Parent = AutoRebirths
ARIcon.BackgroundTransparency = 1
ARIcon.Position = UDim2.new(0.08, 0, 0.15, 0)
ARIcon.Size = UDim2.new(0, 50, 0, 50)
ARIcon.Font = Enum.Font.GothamBold
ARIcon.Text = "🔄"
ARIcon.TextSize = 30

local ARTitle = Instance.new("TextLabel")
ARTitle.Parent = AutoRebirths
ARTitle.BackgroundTransparency = 1
ARTitle.Position = UDim2.new(0.28, 0, 0.18, 0)
ARTitle.Size = UDim2.new(0.60, 0, 0, 26)
ARTitle.Font = Enum.Font.GothamBold
ARTitle.Text = "Auto Rebirths"
ARTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ARTitle.TextSize = 15

local ARDesc = Instance.new("TextLabel")
ARDesc.Parent = AutoRebirths
ARDesc.BackgroundTransparency = 1
ARDesc.Position = UDim2.new(0.28, 0, 0.55, 0)
ARDesc.Size = UDim2.new(0.60, 0, 0, 20)
ARDesc.Font = Enum.Font.Gotham
ARDesc.Text = "Rebirths Automáticos"
ARDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
ARDesc.TextSize = 11

BtnAbrir(AutoRebirths, 0.70, 0.20, 80, 50)  -- CHIQUITO ✅

-- 🎯 KILLING — DERECHA, CHIQUITO ✅
local Killing = Instance.new("Frame")
Killing.Parent = MainFrame
Killing.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
Killing.BorderColor3 = Color3.fromRGB(60, 40, 70)
Killing.BorderSizePixel = 1
Killing.Position = UDim2.new(0.53, 0, 0.35, 0)
Killing.Size = UDim2.new(0.42, 0, 0, 95)
Instance.new("UICorner", Killing).CornerRadius = UDim.new(0, 14)

local KIcon = Instance.new("TextLabel")
KIcon.Parent = Killing
KIcon.BackgroundTransparency = 1
KIcon.Position = UDim2.new(0.08, 0, 0.15, 0)
KIcon.Size = UDim2.new(0, 50, 0, 50)
KIcon.Font = Enum.Font.GothamBold
KIcon.Text = "🎯"
KIcon.TextSize = 30

local KTitle = Instance.new("TextLabel")
KTitle.Parent = Killing
KTitle.BackgroundTransparency = 1
KTitle.Position = UDim2.new(0.28, 0, 0.18, 0)
KTitle.Size = UDim2.new(0.60, 0, 0, 26)
KTitle.Font = Enum.Font.GothamBold
KTitle.Text = "Killing"
KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KTitle.TextSize = 15

local KDesc = Instance.new("TextLabel")
KDesc.Parent = Killing
KDesc.BackgroundTransparency = 1
KDesc.Position = UDim2.new(0.28, 0, 0.55, 0)
KDesc.Size = UDim2.new(0.60, 0, 0, 20)
KDesc.Font = Enum.Font.Gotham
KDesc.Text = "Auto Kills + Server Hop"
KDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
KDesc.TextSize = 11

BtnAbrir(Killing, 0.70, 0.20, 80, 50)  -- CHIQUITO ✅

-- 🐾 FREE PET SHOP — ABAJO IZQUIERDA, CHIQUITO ✅
local FreePetShop = Instance.new("Frame")
FreePetShop.Parent = MainFrame
FreePetShop.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
FreePetShop.BorderColor3 = Color3.fromRGB(60, 40, 70)
FreePetShop.BorderSizePixel = 1
FreePetShop.Position = UDim2.new(0.05, 0, 0.55, 0)
FreePetShop.Size = UDim2.new(0.42, 0, 0, 95)
Instance.new("UICorner", FreePetShop).CornerRadius = UDim.new(0, 14)

local PSIcon = Instance.new("TextLabel")
PSIcon.Parent = FreePetShop
PSIcon.BackgroundTransparency = 1
PSIcon.Position = UDim2.new(0.08, 0, 0.15, 0)
PSIcon.Size = UDim2.new(0, 50, 0, 50)
PSIcon.Font = Enum.Font.GothamBold
PSIcon.Text = "🐾"
PSIcon.TextSize = 30

local PSTitle = Instance.new("TextLabel")
PSTitle.Parent = FreePetShop
PSTitle.BackgroundTransparency = 1
PSTitle.Position = UDim2.new(0.28, 0, 0.18, 0)
PSTitle.Size = UDim2.new(0.60, 0, 0, 26)
PSTitle.Font = Enum.Font.GothamBold
PSTitle.Text = "Free Pet Shop"
PSTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PSTitle.TextSize = 15

local PSDesc = Instance.new("TextLabel")
PSDesc.Parent = FreePetShop
PSDesc.BackgroundTransparency = 1
PSDesc.Position = UDim2.new(0.28, 0, 0.55, 0)
PSDesc.Size = UDim2.new(0.60, 0, 0, 20)
PSDesc.Font = Enum.Font.Gotham
PSDesc.Text = "¡Apex y más!"
PSDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
PSDesc.TextSize = 11

BtnAbrir(FreePetShop, 0.70, 0.20, 80, 50)  -- CHIQUITO ✅

-- ❌ BOTÓN SALIR — ✕ X BONITA, SIN CUADRADO FEO ✅
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 15, 35)
ExitBtn.Position = UDim2.new(0.53, 0, 0.55, 0)
ExitBtn.Size = UDim2.new(0.42, 0, 0, 95)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "✕  SALIR"  -- ✕ X BONITA, SIN CUADRADO ✅
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 22
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 14)
ExitBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

print("==================================================")
print("✅  GOLD GUERRERO HUB — MÓVIL LISTO ✅")
print("📱 PANTALLA COMPLETA | ✕ X BONITA | BOTONES CHIQUITOS")
print("🏋️ Public Training = GRANDE | RESTO = CHIQUITOS")
print("==================================================")
