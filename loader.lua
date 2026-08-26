-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — COMPACTO & PERFECTO ✅
--  🎨 IGUAL A YOUNG0X | CHIQUITO, LIMPIO, BIEN ALINEADO
--  🏋️ Public Training | 🔄 Auto Rebirths | 🎯 Killing
--  🐾 Free Pet Shop | ❌ ✕ SALIR — TODO COMPACTO
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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

-- 🔳 VENTANA — COMPACTA Y BIEN PROPORCIONADA
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
MainFrame.BorderColor3 = Color3.fromRGB(200, 25, 45)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -195)
MainFrame.Size = UDim2.new(0, 600, 0, 390)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- 🏷️ TÍTULO
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -100, 0, 10)
Title.Size = UDim2.new(0, 200, 0, 28)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gold Guerrero Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0.5, -80, 0, 35)
SubTitle.Size = UDim2.new(0, 160, 0, 18)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Muscle Legends"
SubTitle.TextColor3 = Color3.fromRGB(220, 40, 60)
SubTitle.TextSize = 13

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(200, 25, 45)
Line.Position = UDim2.new(0.03, 0, 0, 55)
Line.Size = UDim2.new(0.94, 0, 0, 2)

-- 📦 ESTADOS
local States = {
    PublicTraining = false,
    AutoRebirths = false,
    Killing = false,
    FreePetShop = false
}

-- 📦 FUNCIÓN BOTÓN ABRIR
local function BtnAbrir(parent, x, y, w, h, stateKey)
    local Btn = Instance.new("TextButton")
    Btn.Parent = parent
    Btn.BackgroundColor3 = Color3.fromRGB(45, 25, 35)
    Btn.BorderColor3 = Color3.fromRGB(90, 40, 60)
    Btn.BorderSizePixel = 1
    Btn.Position = UDim2.new(x, 0, y, 0)
    Btn.Size = UDim2.new(w, 0, h, 0)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = "ABRIR"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 12
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 10)
    
    Btn.MouseButton1Click:Connect(function()
        States[stateKey] = not States[stateKey]
        Btn.BackgroundColor3 = States[stateKey] and Color3.fromRGB(30, 150, 80) or Color3.fromRGB(45, 25, 35)
        Btn.Text = States[stateKey] and "✓" or "ABRIR"
    end)
    return Btn
end

-- 🏋️ PUBLIC TRAINING — ARRIBA
local PublicTrain = Instance.new("Frame")
PublicTrain.Parent = MainFrame
PublicTrain.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
PublicTrain.BorderColor3 = Color3.fromRGB(70, 40, 60)
PublicTrain.BorderSizePixel = 1
PublicTrain.Position = UDim2.new(0.03, 0, 0, 65)
PublicTrain.Size = UDim2.new(0.94, 0, 0, 70)
Instance.new("UICorner", PublicTrain).CornerRadius = UDim.new(0, 12)

local PTIcon = Instance.new("TextLabel")
PTIcon.Parent = PublicTrain
PTIcon.BackgroundTransparency = 1
PTIcon.Position = UDim2.new(0.03, 0, 0.12, 0)
PTIcon.Size = UDim2.new(0, 40, 0, 40)
PTIcon.Font = Enum.Font.GothamBold
PTIcon.Text = "🏋️"
PTIcon.TextSize = 26

local PTTitle = Instance.new("TextLabel")
PTTitle.Parent = PublicTrain
PTTitle.BackgroundTransparency = 1
PTTitle.Position = UDim2.new(0.15, 0, 0.15, 0)
PTTitle.Size = UDim2.new(0.50, 0, 0, 22)
PTTitle.Font = Enum.Font.GothamBold
PTTitle.Text = "Public Training"
PTTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PTTitle.TextSize = 15

local PTDesc = Instance.new("TextLabel")
PTDesc.Parent = PublicTrain
PTDesc.BackgroundTransparency = 1
PTDesc.Position = UDim2.new(0.15, 0, 0.55, 0)
PTDesc.Size = UDim2.new(0.50, 0, 0, 16)
PTDesc.Font = Enum.Font.Gotham
PTDesc.Text = "Script Gratuito para Auto Farm!"
PTDesc.TextColor3 = Color3.fromRGB(170, 170, 190)
PTDesc.TextSize = 11

BtnAbrir(PublicTrain, 0.80, 0.15, 80, 45, "PublicTraining")

-- 🔄 AUTO REBIRTHS (IZQUIERDA)
local AutoRebirths = Instance.new("Frame")
AutoRebirths.Parent = MainFrame
AutoRebirths.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
AutoRebirths.BorderColor3 = Color3.fromRGB(70, 40, 60)
AutoRebirths.BorderSizePixel = 1
AutoRebirths.Position = UDim2.new(0.03, 0, 0, 145)
AutoRebirths.Size = UDim2.new(0.45, 0, 0, 75)
Instance.new("UICorner", AutoRebirths).CornerRadius = UDim.new(0, 12)

local ARIcon = Instance.new("TextLabel")
ARIcon.Parent = AutoRebirths
ARIcon.BackgroundTransparency = 1
ARIcon.Position = UDim2.new(0.05, 0, 0.12, 0)
ARIcon.Size = UDim2.new(0, 38, 0, 38)
ARIcon.Font = Enum.Font.GothamBold
ARIcon.Text = "🔄"
ARIcon.TextSize = 24

local ARTitle = Instance.new("TextLabel")
ARTitle.Parent = AutoRebirths
ARTitle.BackgroundTransparency = 1
ARTitle.Position = UDim2.new(0.30, 0, 0.15, 0)
ARTitle.Size = UDim2.new(0.55, 0, 0, 22)
ARTitle.Font = Enum.Font.GothamBold
ARTitle.Text = "Auto Rebirths"
ARTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ARTitle.TextSize = 14

local ARDesc = Instance.new("TextLabel")
ARDesc.Parent = AutoRebirths
ARDesc.BackgroundTransparency = 1
ARDesc.Position = UDim2.new(0.30, 0, 0.55, 0)
ARDesc.Size = UDim2.new(0.55, 0, 0, 16)
ARDesc.Font = Enum.Font.Gotham
ARDesc.Text = "Rebirths Automáticos"
ARDesc.TextColor3 = Color3.fromRGB(170, 170, 190)
ARDesc.TextSize = 10

BtnAbrir(AutoRebirths, 0.72, 0.15, 65, 45, "AutoRebirths")

-- 🎯 KILLING (DERECHA)
local Killing = Instance.new("Frame")
Killing.Parent = MainFrame
Killing.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
Killing.BorderColor3 = Color3.fromRGB(70, 40, 60)
Killing.BorderSizePixel = 1
Killing.Position = UDim2.new(0.52, 0, 0, 145)
Killing.Size = UDim2.new(0.45, 0, 0, 75)
Instance.new("UICorner", Killing).CornerRadius = UDim.new(0, 12)

local KIcon = Instance.new("TextLabel")
KIcon.Parent = Killing
KIcon.BackgroundTransparency = 1
KIcon.Position = UDim2.new(0.05, 0, 0.12, 0)
KIcon.Size = UDim2.new(0, 38, 0, 38)
KIcon.Font = Enum.Font.GothamBold
KIcon.Text = "🎯"
KIcon.TextSize = 24

local KTitle = Instance.new("TextLabel")
KTitle.Parent = Killing
KTitle.BackgroundTransparency = 1
KTitle.Position = UDim2.new(0.30, 0, 0.15, 0)
KTitle.Size = UDim2.new(0.55, 0, 0, 22)
KTitle.Font = Enum.Font.GothamBold
KTitle.Text = "Killing"
KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KTitle.TextSize = 14

local KDesc = Instance.new("TextLabel")
KDesc.Parent = Killing
KDesc.BackgroundTransparency = 1
KDesc.Position = UDim2.new(0.30, 0, 0.55, 0)
KDesc.Size = UDim2.new(0.55, 0, 0, 16)
KDesc.Font = Enum.Font.Gotham
KDesc.Text = "Auto Kills + Server Hop"
KDesc.TextColor3 = Color3.fromRGB(170, 170, 190)
KDesc.TextSize = 10

BtnAbrir(Killing, 0.72, 0.15, 65, 45, "Killing")

-- 🐾 FREE PET SHOP
local FreePetShop = Instance.new("Frame")
FreePetShop.Parent = MainFrame
FreePetShop.BackgroundColor3 = Color3.fromRGB(30, 20, 35)
FreePetShop.BorderColor3 = Color3.fromRGB(70, 40, 60)
FreePetShop.BorderSizePixel = 1
FreePetShop.Position = UDim2.new(0.03, 0, 0, 230)
FreePetShop.Size = UDim2.new(0.45, 0, 0, 70)
Instance.new("UICorner", FreePetShop).CornerRadius = UDim.new(0, 12)

local PSIcon = Instance.new("TextLabel")
PSIcon.Parent = FreePetShop
PSIcon.BackgroundTransparency = 1
PSIcon.Position = UDim2.new(0.05, 0, 0.12, 0)
PSIcon.Size = UDim2.new(0, 38, 0, 38)
PSIcon.Font = Enum.Font.GothamBold
PSIcon.Text = "🐾"
PSIcon.TextSize = 24

local PSTitle = Instance.new("TextLabel")
PSTitle.Parent = FreePetShop
PSTitle.BackgroundTransparency = 1
PSTitle.Position = UDim2.new(0.30, 0, 0.15, 0)
PSTitle.Size = UDim2.new(0.55, 0, 0, 22)
PSTitle.Font = Enum.Font.GothamBold
PSTitle.Text = "Free Pet Shop"
PSTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PSTitle.TextSize = 14

local PSDesc = Instance.new("TextLabel")
PSDesc.Parent = FreePetShop
PSDesc.BackgroundTransparency = 1
PSDesc.Position = UDim2.new(0.30, 0, 0.55, 0)
PSDesc.Size = UDim2.new(0.55, 0, 0, 16)
PSDesc.Font = Enum.Font.Gotham
PSDesc.Text = "¡Apex y más!"
PSDesc.TextColor3 = Color3.fromRGB(170, 170, 190)
PSDesc.TextSize = 10

BtnAbrir(FreePetShop, 0.72, 0.15, 65, 45, "FreePetShop")

-- ❌ BOTÓN SALIR — ✕ ROJA IGUAL A YOUNG0X ✅
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 20, 40)
ExitBtn.Position = UDim2.new(0.52, 0, 0, 230)
ExitBtn.Size = UDim2.new(0.45, 0, 0, 70)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "✕  SALIR"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 18
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 12)
ExitBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- 🔄 BUCLE DE FUNCIONES
task.spawn(function()
    while task.wait(0.5) do
        if not ScreenGui:IsDescendantOf(game) then break end
        local Char = Player.Character
        if not Char then continue end

        -- Auto Rebirths
        if States.AutoRebirths then
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if remotes and remotes:FindFirstChild("Rebirth") then
                remotes.Rebirth:FireServer()
                task.wait(3)
            end
        end
    end
end)

print("✅ Gold Guerrero Hub — CARGADO ✅")
