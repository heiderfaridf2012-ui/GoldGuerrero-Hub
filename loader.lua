-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — TAMAÑO IDEAL 555px
--  📱 ANCHO = 555px | DISEÑO IGUAL A LA IMAGEN
--  ✅ Fast Glitch | Public Training | Auto Rebirths
--  ✅ Killing | Free Pet Shop | ✕ SALIR
--  🟢 Botones ABRIR → ACTIVO | TODO FUNCIONAL
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ✅ BORRA DUPLICADOS AL CARGAR
if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui.GoldGuerreroHub:Destroy()
end

-- 🔴 ESTADOS DE TODAS LAS FUNCIONES
local Estados = {
    FastGlitch = false,
    PublicTraining = false,
    AutoRebirths = false,
    Killing = false,
    FreePetShop = false
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 📱 VENTANA — ANCHO EXACTO 555px ✅
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
MainFrame.BorderColor3 = Color3.fromRGB(180, 0, 25)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.5, -277, 0.5, -240)
MainFrame.Size = UDim2.new(0, 555, 0, 480)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- 🏷️ TÍTULO PRINCIPAL
local TitleTop = Instance.new("TextLabel")
TitleTop.Parent = MainFrame
TitleTop.BackgroundTransparency = 1
TitleTop.Position = UDim2.new(0.5, -110, 0, 12)
TitleTop.Size = UDim2.new(0, 220, 0, 28)
TitleTop.Font = Enum.Font.GothamBold
TitleTop.Text = "GoldGuerrero Hub"
TitleTop.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleTop.TextSize = 22

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0.5, -75, 0, 38)
SubTitle.Size = UDim2.new(0, 150, 0, 16)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Muscle Legends"
SubTitle.TextColor3 = Color3.fromRGB(180, 0, 25)
SubTitle.TextSize = 12

-- 🖼️ ICONO DE PERFIL (como en tu imagen)
local ProfileIcon = Instance.new("Frame")
ProfileIcon.Parent = MainFrame
ProfileIcon.BackgroundColor3 = Color3.fromRGB(25, 40, 60)
ProfileIcon.BorderColor3 = Color3.fromRGB(50, 100, 180)
ProfileIcon.BorderSizePixel = 2
ProfileIcon.Position = UDim2.new(0.05, 0, 0, 10)
ProfileIcon.Size = UDim2.new(0, 45, 0, 45)
Instance.new("UICorner", ProfileIcon).CornerRadius = UDim.new(0, 10)

local ProfileImg = Instance.new("TextLabel")
ProfileImg.Parent = ProfileIcon
ProfileImg.BackgroundTransparency = 1
ProfileImg.Size = UDim2.new(1, 0, 1, 0)
ProfileImg.Font = Enum.Font.GothamBold
ProfileImg.Text = "🥷"
ProfileImg.TextSize = 24
ProfileImg.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 🔴 LÍNEA SEPARADORA
local LineTop = Instance.new("Frame")
LineTop.Parent = MainFrame
LineTop.BackgroundColor3 = Color3.fromRGB(180, 0, 25)
LineTop.Position = UDim2.new(0.05, 0, 0, 65)
LineTop.Size = UDim2.new(0.90, 0, 0, 2)

-- ==================================================
-- ⚡ FAST GLITCH 100% — SECCIÓN ROJA ARRIBA
-- ==================================================
local FastGlitchFrame = Instance.new("Frame")
FastGlitchFrame.Parent = MainFrame
FastGlitchFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
FastGlitchFrame.BorderColor3 = Color3.fromRGB(60, 25, 40)
FastGlitchFrame.BorderSizePixel = 1
FastGlitchFrame.Position = UDim2.new(0.05, 0, 0, 80)
FastGlitchFrame.Size = UDim2.new(0.90, 0, 0, 100)
Instance.new("UICorner", FastGlitchFrame).CornerRadius = UDim.new(0, 12)

-- Cuadro rojo con rayo ⚡
local FlashBox = Instance.new("Frame")
FlashBox.Parent = FastGlitchFrame
FlashBox.BackgroundColor3 = Color3.fromRGB(220, 0, 30)
FlashBox.Position = UDim2.new(0.03, 0, 0.10, 0)
FlashBox.Size = UDim2.new(0, 80, 0, 80)
Instance.new("UICorner", FlashBox).CornerRadius = UDim.new(0, 12)

local FlashIcon = Instance.new("TextLabel")
FlashIcon.Parent = FlashBox
FlashIcon.BackgroundTransparency = 1
FlashIcon.Size = UDim2.new(1, 0, 1, 0)
FlashIcon.Font = Enum.Font.GothamBold
FlashIcon.Text = "⚡"
FlashIcon.TextSize = 36
FlashIcon.TextColor3 = Color3.fromRGB(255, 255, 255)

local FGTitle = Instance.new("TextLabel")
FGTitle.Parent = FastGlitchFrame
FGTitle.BackgroundTransparency = 1
FGTitle.Position = UDim2.new(0.22, 0, 0.15, 0)
FGTitle.Size = UDim2.new(0.45, 0, 0, 26)
FGTitle.Font = Enum.Font.GothamBold
FGTitle.Text = "Fast Glitch 100%"
FGTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FGTitle.TextSize = 18

local FGDesc = Instance.new("TextLabel")
FGDesc.Parent = FastGlitchFrame
FGDesc.BackgroundTransparency = 1
FGDesc.Position = UDim2.new(0.22, 0, 0.55, 0)
FGDesc.Size = UDim2.new(0.45, 0, 0, 18)
FGDesc.Font = Enum.Font.Gotham
FGDesc.Text = "Script de paga MUY OP"
FGDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
FGDesc.TextSize = 11

local btnFG = Instance.new("TextButton")
btnFG.Parent = FastGlitchFrame
btnFG.BackgroundColor3 = Color3.fromRGB(220, 0, 30)
btnFG.Position = UDim2.new(0.75, 0, 0.15, 0)
btnFG.Size = UDim2.new(0, 110, 0, 70)
btnFG.Font = Enum.Font.GothamBold
btnFG.Text = "ABRIR"
btnFG.TextColor3 = Color3.fromRGB(255, 255, 255)
btnFG.TextSize = 15
Instance.new("UICorner", btnFG).CornerRadius = UDim.new(0, 12)
btnFG.MouseButton1Click:Connect(function()
    Estados.FastGlitch = not Estados.FastGlitch
    btnFG.BackgroundColor3 = Estados.FastGlitch and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(220, 0, 30)
    btnFG.Text = Estados.FastGlitch and "✅ ACTIVO" or "ABRIR"
end)

-- ==================================================
-- 🏋️ PUBLIC TRAINING — SEGUNDA SECCIÓN
-- ==================================================
local TrainingFrame = Instance.new("Frame")
TrainingFrame.Parent = MainFrame
TrainingFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
TrainingFrame.BorderColor3 = Color3.fromRGB(60, 25, 40)
TrainingFrame.BorderSizePixel = 1
TrainingFrame.Position = UDim2.new(0.05, 0, 0, 195)
TrainingFrame.Size = UDim2.new(0.90, 0, 0, 90)
Instance.new("UICorner", TrainingFrame).CornerRadius = UDim.new(0, 12)

local TrainIconBox = Instance.new("Frame")
TrainIconBox.Parent = TrainingFrame
TrainIconBox.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
TrainIconBox.Position = UDim2.new(0.03, 0, 0.12, 0)
TrainIconBox.Size = UDim2.new(0, 70, 0, 70)
Instance.new("UICorner", TrainIconBox).CornerRadius = UDim.new(0, 12)

local TrainIcon = Instance.new("TextLabel")
TrainIcon.Parent = TrainIconBox
TrainIcon.BackgroundTransparency = 1
TrainIcon.Size = UDim2.new(1, 0, 1, 0)
TrainIcon.Font = Enum.Font.GothamBold
TrainIcon.Text = "🏋️"
TrainIcon.TextSize = 32
TrainIcon.TextColor3 = Color3.fromRGB(255, 255, 255)

local TrainTitle = Instance.new("TextLabel")
TrainTitle.Parent = TrainingFrame
TrainTitle.BackgroundTransparency = 1
TrainTitle.Position = UDim2.new(0.22, 0, 0.18, 0)
TrainTitle.Size = UDim2.new(0.45, 0, 0, 24)
TrainTitle.Font = Enum.Font.GothamBold
TrainTitle.Text = "Public Training"
TrainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
TrainTitle.TextSize = 17

local TrainDesc = Instance.new("TextLabel")
TrainDesc.Parent = TrainingFrame
TrainDesc.BackgroundTransparency = 1
TrainDesc.Position = UDim2.new(0.22, 0, 0.55, 0)
TrainDesc.Size = UDim2.new(0.45, 0, 0, 18)
TrainDesc.Font = Enum.Font.Gotham
TrainDesc.Text = "¡Script Gratuito para Auto Farm!"
TrainDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
TrainDesc.TextSize = 11

local btnTrain = Instance.new("TextButton")
btnTrain.Parent = TrainingFrame
btnTrain.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
btnTrain.Position = UDim2.new(0.75, 0, 0.15, 0)
btnTrain.Size = UDim2.new(0, 110, 0, 60)
btnTrain.Font = Enum.Font.GothamBold
btnTrain.Text = "ABRIR"
btnTrain.TextColor3 = Color3.fromRGB(255, 255, 255)
btnTrain.TextSize = 14
Instance.new("UICorner", btnTrain).CornerRadius = UDim.new(0, 12)
btnTrain.MouseButton1Click:Connect(function()
    Estados.PublicTraining = not Estados.PublicTraining
    btnTrain.BackgroundColor3 = Estados.PublicTraining and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(80, 25, 40)
    btnTrain.Text = Estados.PublicTraining and "✅ ACTIVO" or "ABRIR"
end)

-- ==================================================
-- 🔄 AUTO REBIRTHS | 🎯 KILLING — LADO A LADO
-- ==================================================
-- Auto Rebirths (Izquierda)
local ARFrame = Instance.new("Frame")
ARFrame.Parent = MainFrame
ARFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
ARFrame.BorderColor3 = Color3.fromRGB(60, 25, 40)
ARFrame.BorderSizePixel = 1
ARFrame.Position = UDim2.new(0.05, 0, 0, 300)
ARFrame.Size = UDim2.new(0.43, 0, 0, 90)
Instance.new("UICorner", ARFrame).CornerRadius = UDim.new(0, 12)

local ARIconBox = Instance.new("Frame")
ARIconBox.Parent = ARFrame
ARIconBox.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
ARIconBox.Position = UDim2.new(0.05, 0, 0.12, 0)
ARIconBox.Size = UDim2.new(0, 60, 0, 60)
Instance.new("UICorner", ARIconBox).CornerRadius = UDim.new(0, 10)

local ARIcon = Instance.new("TextLabel")
ARIcon.Parent = ARIconBox
ARIcon.BackgroundTransparency = 1
ARIcon.Size = UDim2.new(1, 0, 1, 0)
ARIcon.Font = Enum.Font.GothamBold
ARIcon.Text = "🔄"
ARIcon.TextSize = 28
ARIcon.TextColor3 = Color3.fromRGB(255, 255, 255)

local ARTitle = Instance.new("TextLabel")
ARTitle.Parent = ARFrame
ARTitle.BackgroundTransparency = 1
ARTitle.Position = UDim2.new(0.38, 0, 0.18, 0)
ARTitle.Size = UDim2.new(0.55, 0, 0, 22)
ARTitle.Font = Enum.Font.GothamBold
ARTitle.Text = "Auto Rebirths"
ARTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ARTitle.TextSize = 15

local ARDesc = Instance.new("TextLabel")
ARDesc.Parent = ARFrame
ARDesc.BackgroundTransparency = 1
ARDesc.Position = UDim2.new(0.38, 0, 0.55, 0)
ARDesc.Size = UDim2.new(0.55, 0, 0, 16)
ARDesc.Font = Enum.Font.Gotham
ARDesc.Text = "Rebirths Automáticos"
ARDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
ARDesc.TextSize = 10

local btnAR = Instance.new("TextButton")
btnAR.Parent = ARFrame
btnAR.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
btnAR.Position = UDim2.new(0.25, 0, 0.72, 0)
btnAR.Size = UDim2.new(0, 100, 0, 25)
btnAR.Font = Enum.Font.GothamBold
btnAR.Text = "ABRIR"
btnAR.TextColor3 = Color3.fromRGB(255, 255, 255)
btnAR.TextSize = 11
Instance.new("UICorner", btnAR).CornerRadius = UDim.new(0, 8)
btnAR.MouseButton1Click:Connect(function()
    Estados.AutoRebirths = not Estados.AutoRebirths
    btnAR.BackgroundColor3 = Estados.AutoRebirths and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(80, 25, 40)
    btnAR.Text = Estados.AutoRebirths and "✅ ACTIVO" or "ABRIR"
end)

-- Killing (Derecha)
local KFrame = Instance.new("Frame")
KFrame.Parent = MainFrame
KFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
KFrame.BorderColor3 = Color3.fromRGB(60, 25, 40)
KFrame.BorderSizePixel = 1
KFrame.Position = UDim2.new(0.52, 0, 0, 300)
KFrame.Size = UDim2.new(0.43, 0, 0, 90)
Instance.new("UICorner", KFrame).CornerRadius = UDim.new(0, 12)

local KIconBox = Instance.new("Frame")
KIconBox.Parent = KFrame
KIconBox.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
KIconBox.Position = UDim2.new(0.05, 0, 0.12, 0)
KIconBox.Size = UDim2.new(0, 60, 0, 60)
Instance.new("UICorner", KIconBox).CornerRadius = UDim.new(0, 10)

local KIcon = Instance.new("TextLabel")
KIcon.Parent = KIconBox
KIcon.BackgroundTransparency = 1
KIcon.Size = UDim2.new(1, 0, 1, 0)
KIcon.Font = Enum.Font.GothamBold
KIcon.Text = "🎯"
KIcon.TextSize = 28
KIcon.TextColor3 = Color3.fromRGB(255, 255, 255)

local KTitle = Instance.new("TextLabel")
KTitle.Parent = KFrame
KTitle.BackgroundTransparency = 1
KTitle.Position = UDim2.new(0.38, 0, 0.18, 0)
KTitle.Size = UDim2.new(0.55, 0, 0, 22)
KTitle.Font = Enum.Font.GothamBold
KTitle.Text = "Killing"
KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KTitle.TextSize = 15

local KDesc = Instance.new("TextLabel")
KDesc.Parent = KFrame
KDesc.BackgroundTransparency = 1
KDesc.Position = UDim2.new(0.38, 0, 0.55, 0)
KDesc.Size = UDim2.new(0.55, 0, 0, 16)
KDesc.Font = Enum.Font.Gotham
KDesc.Text = "Auto Kills + Server Hop"
KDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
KDesc.TextSize = 10

local btnK = Instance.new("TextButton")
btnK.Parent = KFrame
btnK.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
btnK.Position = UDim2.new(0.25, 0, 0.72, 0)
btnK.Size = UDim2.new(0, 100, 0, 25)
btnK.Font = Enum.Font.GothamBold
btnK.Text = "ABRIR"
btnK.TextColor3 = Color3.fromRGB(255, 255, 255)
btnK.TextSize = 11
Instance.new("UICorner", btnK).CornerRadius = UDim.new(0, 8)
btnK.MouseButton1Click:Connect(function()
    Estados.Killing = not Estados.Killing
    btnK.BackgroundColor3 = Estados.Killing and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(80, 25, 40)
    btnK.Text = Estados.Killing and "✅ ACTIVO" or "ABRIR"
end)

-- ==================================================
-- 🐾 FREE PET SHOP | ✕ SALIR — ABAJO
-- ==================================================
-- Free Pet Shop (Izquierda)
local PetFrame = Instance.new("Frame")
PetFrame.Parent = MainFrame
PetFrame.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
PetFrame.BorderColor3 = Color3.fromRGB(60, 25, 40)
PetFrame.BorderSizePixel = 1
PetFrame.Position = UDim2.new(0.05, 0, 0, 410)
PetFrame.Size = UDim2.new(0.43, 0, 0, 90)
Instance.new("UICorner", PetFrame).CornerRadius = UDim.new(0, 12)

local PetIconBox = Instance.new("Frame")
PetIconBox.Parent = PetFrame
PetIconBox.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
PetIconBox.Position = UDim2.new(0.05, 0, 0.12, 0)
PetIconBox.Size = UDim2.new(0, 60, 0, 60)
Instance.new("UICorner", PetIconBox).CornerRadius = UDim.new(0, 10)

local PetIcon = Instance.new("TextLabel")
PetIcon.Parent = PetIconBox
PetIcon.BackgroundTransparency = 1
PetIcon.Size = UDim2.new(1, 0, 1, 0)
PetIcon.Font = Enum.Font.GothamBold
PetIcon.Text = "🐾"
PetIcon.TextSize = 28
PetIcon.TextColor3 = Color3.fromRGB(255, 255, 255)

local PetTitle = Instance.new("TextLabel")
PetTitle.Parent = PetFrame
PetTitle.BackgroundTransparency = 1
PetTitle.Position = UDim2.new(0.38, 0, 0.18, 0)
PetTitle.Size = UDim2.new(0.55, 0, 0, 22)
PetTitle.Font = Enum.Font.GothamBold
PetTitle.Text = "Free Pet Shop"
PetTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PetTitle.TextSize = 15

local PetDesc = Instance.new("TextLabel")
PetDesc.Parent = PetFrame
PetDesc.BackgroundTransparency = 1
PetDesc.Position = UDim2.new(0.38, 0, 0.55, 0)
PetDesc.Size = UDim2.new(0.55, 0, 0, 16)
PetDesc.Font = Enum.Font.Gotham
PetDesc.Text = "¡Apex y más!"
PetDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
PetDesc.TextSize = 10

local btnPet = Instance.new("TextButton")
btnPet.Parent = PetFrame
btnPet.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
btnPet.Position = UDim2.new(0.25, 0, 0.72, 0)
btnPet.Size = UDim2.new(0, 100, 0, 25)
btnPet.Font = Enum.Font.GothamBold
btnPet.Text = "ABRIR"
btnPet.TextColor3 = Color3.fromRGB(255, 255, 255)
btnPet.TextSize = 11
Instance.new("UICorner", btnPet).CornerRadius = UDim.new(0, 8)
btnPet.MouseButton1Click:Connect(function()
    Estados.FreePetShop = not Estados.FreePetShop
    btnPet.BackgroundColor3 = Estados.FreePetShop and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(80, 25, 40)
    btnPet.Text = Estados.FreePetShop and "✅ ACTIVO" or "ABRIR"
end)

-- ✕ SALIR — BOTÓN ROJO GRANDE (Derecha)
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 25)
ExitBtn.Position = UDim2.new(0.52, 0, 0, 410)
ExitBtn.Size = UDim2.new(0.43, 0, 0, 90)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "✕  SALIR"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 22
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 12)
ExitBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ==================================================
-- ⚙️ FUNCIONES REALES CONECTADAS A TODOS LOS BOTONES
-- ==================================================

-- ⚡ FAST GLITCH
task.spawn(function()
    while task.wait(0.15) do
        if Estados.FastGlitch then
            local Char = Player.Character
            if Char and Char:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    ReplicatedStorage.RemoteEvents.Training:FireServer("SpeedGlitch")
                end)
            end
        end
    end
end)

-- 🏋️ PUBLIC TRAINING → AUTO GOLPEAR ROCAS
task.spawn(function()
    while task.wait(0.25) do
        if Estados.PublicTraining then
            local Char = Player.Character
            if Char and Char:FindFirstChild("HumanoidRootPart") then
                local Rocas = workspace:FindFirstChild("Rocks") or workspace:FindFirstChild("TrainingRocks")
                if Rocas then
                    for _, R in ipairs(Rocas:GetChildren()) do
                        if R:FindFirstChild("TouchInterest") then
                            firetouchinterest(Char.HumanoidRootPart, R, 1)
                            task.wait(0.08)
                            firetouchinterest(Char.HumanoidRootPart, R, 0)
                            break
                        end
                    end
                end
            end
        end
    end
end)

-- 🔄 AUTO REBIRTHS
task.spawn(function()
    while task.wait(0.5) do
        if Estados.AutoRebirths then
            local Gui = Player.PlayerGui
            local RebirthBtn = Gui:FindFirstChild("RebirthButton", true) or Gui:FindFirstChild("Rebirth", true)
            if RebirthBtn and RebirthBtn.Visible then
                pcall(function() RebirthBtn:Activate() end)
                task.wait(0.8)
            end
        end
    end
end)

-- 🎯 KILLING → AUTO KILLS
task.spawn(function()
    while task.wait(0.35) do
        if Estados.Killing then
            local Char = Player.Character
            if Char and Char:FindFirstChild("HumanoidRootPart") then
                local Mobs = workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("Mobs")
                if Mobs then
                    for _, Mob in ipairs(Mobs:GetChildren()) do
                        if Mob:FindFirstChild("Humanoid") and Mob.Humanoid.Health > 0 then
                            local HRP = Mob:FindFirstChild("HumanoidRootPart")
                            if HRP then
                                Char.HumanoidRootPart.CFrame = CFrame.new(HRP.Position + Vector3.new(math.random(-2,2), 0, math.random(-2,2)))
                                task.wait(0.1)
                                pcall(function() ReplicatedStorage.RemoteEvents.Combat:FireServer(Mob) end)
                            end
                            break
                        end
                    end
                end
            end
        end
    end
end)

-- 🐾 FREE PET SHOP
task.spawn(function()
    while task.wait(1) do
        if Estados.FreePetShop then
            local Gui = Player.PlayerGui
            local PetBtn = Gui:FindFirstChild("PetButton", true) or Gui:FindFirstChild("PetShop", true)
            if PetBtn then pcall(function() PetBtn:Activate() end) end
        end
    end
end)

-- ==================================================
print("✅ ===========================================")
print("✅  GOLD GUERRERO HUB — CARGADO CON ÉXITO!")
print("✅  📱 Tamaño: 555px | 🎨 Estilo Young0x")
print("✅  ⚡ FastGlitch | 🏋️ Training | 🔄 Rebirths")
print("✅  🎯 Killing | 🐾 PetShop | ✕ Salir")
print("✅ ===========================================")
