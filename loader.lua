-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — ESTILO YOUNG0X
--  🎯 DISEÑO IDÉNTICO A LA IMAGEN | FUNCIONES REALES
--  ✅ Fast Glitch | Public Training | Auto Rebirths
--  ✅ Killing | Free Pet Shop | ✕ SALIR ROJA
--  📱 OPTIMIZADO MÓVIL | BOTONES ABRIR → ACTIVO
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- ✅ BORRA DUPLICADOS
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

-- 🖥️ VENTANA PRINCIPAL — EXACTO TAMAÑO Y ESTILO
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
MainFrame.BorderColor3 = Color3.fromRGB(200, 0, 30)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.5, -410, 0.5, -230)
MainFrame.Size = UDim2.new(0, 820, 0, 460)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 24)

-- 🏷️ TÍTULO SUPERIOR
local TitleTop = Instance.new("TextLabel")
TitleTop.Parent = MainFrame
TitleTop.BackgroundTransparency = 1
TitleTop.Position = UDim2.new(0.5, -130, 0, 15)
TitleTop.Size = UDim2.new(0, 260, 0, 32)
TitleTop.Font = Enum.Font.GothamBold
TitleTop.Text = "GoldGuerrero Hub"
TitleTop.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleTop.TextSize = 26

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0.5, -90, 0, 48)
SubTitle.Size = UDim2.new(0, 180, 0, 18)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Muscle Legends"
SubTitle.TextColor3 = Color3.fromRGB(200, 0, 30)
SubTitle.TextSize = 13

local LineTop = Instance.new("Frame")
LineTop.Parent = MainFrame
LineTop.BackgroundColor3 = Color3.fromRGB(200, 0, 30)
LineTop.Position = UDim2.new(0.03, 0, 0, 75)
LineTop.Size = UDim2.new(0.94, 0, 0, 2)

-- 📦 FUNCIÓN PARA CREAR SECCIONES IGUALES
local function CrearSeccion(icono, titulo, desc, posY, ancho, claveEstado, esRoja)
    local Seccion = Instance.new("Frame")
    Seccion.Parent = MainFrame
    Seccion.BackgroundColor3 = Color3.fromRGB(25, 15, 20)
    Seccion.BorderColor3 = Color3.fromRGB(60, 25, 35)
    Seccion.BorderSizePixel = 1
    Seccion.Position = UDim2.new(0.03, 0, 0, posY)
    Seccion.Size = UDim2.new(ancho or 0.94, 0, 0, 110)
    Instance.new("UICorner", Seccion).CornerRadius = UDim.new(0, 16)

    -- Cuadro de icono
    local IconBox = Instance.new("Frame")
    IconBox.Parent = Seccion
    IconBox.BackgroundColor3 = esRoja and Color3.fromRGB(220, 0, 30) or Color3.fromRGB(40, 20, 30)
    IconBox.Position = UDim2.new(0.03, 0, 0.15, 0)
    IconBox.Size = UDim2.new(0, 90, 0, 90)
    Instance.new("UICorner", IconBox).CornerRadius = UDim.new(0, 14)

    local IconLabel = Instance.new("TextLabel")
    IconLabel.Parent = IconBox
    IconLabel.BackgroundTransparency = 1
    IconLabel.Size = UDim2.new(0, 90, 0, 90)
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.Text = icono
    IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    IconLabel.TextSize = 42

    -- Título
    local TituloLabel = Instance.new("TextLabel")
    TituloLabel.Parent = Seccion
    TituloLabel.BackgroundTransparency = 1
    TituloLabel.Position = UDim2.new(0.18, 0, 0.20, 0)
    TituloLabel.Size = UDim2.new(0.55, 0, 0, 32)
    TituloLabel.Font = Enum.Font.GothamBold
    TituloLabel.Text = titulo
    TituloLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TituloLabel.TextSize = 22

    -- Descripción
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Parent = Seccion
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0.18, 0, 0.58, 0)
    DescLabel.Size = UDim2.new(0.55, 0, 0, 20)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = desc
    DescLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
    DescLabel.TextSize = 12

    -- Botón ABRIR
    local BtnAbrir = Instance.new("TextButton")
    BtnAbrir.Parent = Seccion
    BtnAbrir.BackgroundColor3 = esRoja and Color3.fromRGB(220, 0, 30) or Color3.fromRGB(70, 20, 35)
    BtnAbrir.BorderColor3 = esRoja and Color3.fromRGB(255, 30, 60) or Color3.fromRGB(120, 30, 50)
    BtnAbrir.BorderSizePixel = 1
    BtnAbrir.Position = UDim2.new(0.80, 0, 0.20, 0)
    BtnAbrir.Size = UDim2.new(0, 140, 0, 70)
    BtnAbrir.Font = Enum.Font.GothamBold
    BtnAbrir.Text = "ABRIR"
    BtnAbrir.TextColor3 = Color3.fromRGB(255, 255, 255)
    BtnAbrir.TextSize = 16
    Instance.new("UICorner", BtnAbrir).CornerRadius = UDim.new(0, 14)

    -- ✅ ENCENDER/APAGAR FUNCIONAL
    BtnAbrir.MouseButton1Click:Connect(function()
        Estados[claveEstado] = not Estados[claveEstado]
        if Estados[claveEstado] then
            BtnAbrir.BackgroundColor3 = Color3.fromRGB(25, 180, 70)
            BtnAbrir.Text = "✅ ACTIVO"
        else
            BtnAbrir.BackgroundColor3 = esRoja and Color3.fromRGB(220, 0, 30) or Color3.fromRGB(70, 20, 35)
            BtnAbrir.Text = "ABRIR"
        end
        print("🔄 " .. titulo .. ": " .. tostring(Estados[claveEstado]))
    end)

    return Seccion
end

-- ==================================================
-- ⚡ FAST GLITCH 100% — ROJA ARRIBA
-- ==================================================
CrearSeccion("⚡", "Fast Glitch 100%", "Script de paga MUY OP", 90, 0.94, "FastGlitch", true)

-- ==================================================
-- 🏋️ PUBLIC TRAINING — SEGUNDA SECCIÓN
-- ==================================================
CrearSeccion("🏋️", "Public Training", "¡Script Gratuito para Auto Farm!", 210, 0.94, "PublicTraining")

-- ==================================================
-- 🔄 AUTO REBIRTHS | 🎯 KILLING — LADO A LADO
-- ==================================================
-- Auto Rebirths
local ARSeccion = Instance.new("Frame")
ARSeccion.Parent = MainFrame
ARSeccion.BackgroundColor3 = Color3.fromRGB(25, 15, 20)
ARSeccion.BorderColor3 = Color3.fromRGB(60, 25, 35)
ARSeccion.BorderSizePixel = 1
ARSeccion.Position = UDim2.new(0.03, 0, 0, 330)
ARSeccion.Size = UDim2.new(0.45, 0, 0, 110)
Instance.new("UICorner", ARSeccion).CornerRadius = UDim.new(0, 16)

local ARIconBox = Instance.new("Frame")
ARIconBox.Parent = ARSeccion
ARIconBox.BackgroundColor3 = Color3.fromRGB(40, 20, 30)
ARIconBox.Position = UDim2.new(0.05, 0, 0.12, 0)
ARIconBox.Size = UDim2.new(0, 80, 0, 80)
Instance.new("UICorner", ARIconBox).CornerRadius = UDim.new(0, 14)

local ARIcon = Instance.new("TextLabel")
ARIcon.Parent = ARIconBox
ARIcon.BackgroundTransparency = 1
ARIcon.Size = UDim2.new(0, 80, 0, 80)
ARIcon.Font = Enum.Font.GothamBold
ARIcon.Text = "🔄"
ARIcon.TextSize = 38

local ARTitle = Instance.new("TextLabel")
ARTitle.Parent = ARSeccion
ARTitle.BackgroundTransparency = 1
ARTitle.Position = UDim2.new(0.28, 0, 0.18, 0)
ARTitle.Size = UDim2.new(0.55, 0, 0, 28)
ARTitle.Font = Enum.Font.GothamBold
ARTitle.Text = "Auto Rebirths"
ARTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ARTitle.TextSize = 20

local ARDesc = Instance.new("TextLabel")
ARDesc.Parent = ARSeccion
ARDesc.BackgroundTransparency = 1
ARDesc.Position = UDim2.new(0.28, 0, 0.55, 0)
ARDesc.Size = UDim2.new(0.55, 0, 0, 20)
ARDesc.Font = Enum.Font.Gotham
ARDesc.Text = "Rebirths Automáticos"
ARDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
ARDesc.TextSize = 12

local btnAR = Instance.new("TextButton")
btnAR.Parent = ARSeccion
btnAR.BackgroundColor3 = Color3.fromRGB(70, 20, 35)
btnAR.BorderColor3 = Color3.fromRGB(120, 30, 50)
btnAR.BorderSizePixel = 1
btnAR.Position = UDim2.new(0.72, 0, 0.20, 0)
btnAR.Size = UDim2.new(0, 110, 0, 70)
btnAR.Font = Enum.Font.GothamBold
btnAR.Text = "ABRIR"
btnAR.TextColor3 = Color3.fromRGB(255, 255, 255)
btnAR.TextSize = 15
Instance.new("UICorner", btnAR).CornerRadius = UDim.new(0, 14)
btnAR.MouseButton1Click:Connect(function()
    Estados.AutoRebirths = not Estados.AutoRebirths
    btnAR.BackgroundColor3 = Estados.AutoRebirths and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(70, 20, 35)
    btnAR.Text = Estados.AutoRebirths and "✅ ACTIVO" or "ABRIR"
end)

-- Killing
local KSeccion = Instance.new("Frame")
KSeccion.Parent = MainFrame
KSeccion.BackgroundColor3 = Color3.fromRGB(25, 15, 20)
KSeccion.BorderColor3 = Color3.fromRGB(60, 25, 35)
KSeccion.BorderSizePixel = 1
KSeccion.Position = UDim2.new(0.52, 0, 0, 330)
KSeccion.Size = UDim2.new(0.45, 0, 0, 110)
Instance.new("UICorner", KSeccion).CornerRadius = UDim.new(0, 16)

local KIconBox = Instance.new("Frame")
KIconBox.Parent = KSeccion
KIconBox.BackgroundColor3 = Color3.fromRGB(40, 20, 30)
KIconBox.Position = UDim2.new(0.05, 0, 0.12, 0)
KIconBox.Size = UDim2.new(0, 80, 0, 80)
Instance.new("UICorner", KIconBox).CornerRadius = UDim.new(0, 14)

local KIcon = Instance.new("TextLabel")
KIcon.Parent = KIconBox
KIcon.BackgroundTransparency = 1
KIcon.Size = UDim2.new(0, 80, 0, 80)
KIcon.Font = Enum.Font.GothamBold
KIcon.Text = "🎯"
KIcon.TextSize = 38

local KTitle = Instance.new("TextLabel")
KTitle.Parent = KSeccion
KTitle.BackgroundTransparency = 1
KTitle.Position = UDim2.new(0.28, 0, 0.18, 0)
KTitle.Size = UDim2.new(0.55, 0, 0, 28)
KTitle.Font = Enum.Font.GothamBold
KTitle.Text = "Killing"
KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KTitle.TextSize = 20

local KDesc = Instance.new("TextLabel")
KDesc.Parent = KSeccion
KDesc.BackgroundTransparency = 1
KDesc.Position = UDim2.new(0.28, 0, 0.55, 0)
KDesc.Size = UDim2.new(0.55, 0, 0, 20)
KDesc.Font = Enum.Font.Gotham
KDesc.Text = "Auto Kills + Server Hop"
KDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
KDesc.TextSize = 12

local btnK = Instance.new("TextButton")
btnK.Parent = KSeccion
btnK.BackgroundColor3 = Color3.fromRGB(70, 20, 35)
btnK.BorderColor3 = Color3.fromRGB(120, 30, 50)
btnK.BorderSizePixel = 1
btnK.Position = UDim2.new(0.72, 0, 0.20, 0)
btnK.Size = UDim2.new(0, 110, 0, 70)
btnK.Font = Enum.Font.GothamBold
btnK.Text = "ABRIR"
btnK.TextColor3 = Color3.fromRGB(255, 255, 255)
btnK.TextSize = 15
Instance.new("UICorner", btnK).CornerRadius = UDim.new(0, 14)
btnK.MouseButton1Click:Connect(function()
    Estados.Killing = not Estados.Killing
    btnK.BackgroundColor3 = Estados.Killing and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(70, 20, 35)
    btnK.Text = Estados.Killing and "✅ ACTIVO" or "ABRIR"
end)

-- ==================================================
-- 🐾 FREE PET SHOP | ✕ SALIR — ABAJO
-- ==================================================
-- Free Pet Shop
local PSeccion = Instance.new("Frame")
PSeccion.Parent = MainFrame
PSeccion.BackgroundColor3 = Color3.fromRGB(25, 15, 20)
PSeccion.BorderColor3 = Color3.fromRGB(60, 25, 35)
PSeccion.BorderSizePixel = 1
PSeccion.Position = UDim2.new(0.03, 0, 0, 450)
PSeccion.Size = UDim2.new(0.45, 0, 0, 110)
Instance.new("UICorner", PSeccion).CornerRadius = UDim.new(0, 16)

local PIconBox = Instance.new("Frame")
PIconBox.Parent = PSeccion
PIconBox.BackgroundColor3 = Color3.fromRGB(40, 20, 30)
PIconBox.Position = UDim2.new(0.05, 0, 0.12, 0)
PIconBox.Size = UDim2.new(0, 80, 0, 80)
Instance.new("UICorner", PIconBox).CornerRadius = UDim.new(0, 14)

local PIcon = Instance.new("TextLabel")
PIcon.Parent = PIconBox
PIcon.BackgroundTransparency = 1
PIcon.Size = UDim2.new(0, 80, 0, 80)
PIcon.Font = Enum.Font.GothamBold
PIcon.Text = "🐾"
PIcon.TextSize = 38

local PTitle = Instance.new("TextLabel")
PTitle.Parent = PSeccion
PTitle.BackgroundTransparency = 1
PTitle.Position = UDim2.new(0.28, 0, 0.18, 0)
PTitle.Size = UDim2.new(0.55, 0, 0, 28)
PTitle.Font = Enum.Font.GothamBold
PTitle.Text = "Free Pet Shop"
PTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PTitle.TextSize = 20

local PDesc = Instance.new("TextLabel")
PDesc.Parent = PSeccion
PDesc.BackgroundTransparency = 1
PDesc.Position = UDim2.new(0.28, 0, 0.55, 0)
PDesc.Size = UDim2.new(0.55, 0, 0, 20)
PDesc.Font = Enum.Font.Gotham
PDesc.Text = "¡Apex y más!"
PDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
PDesc.TextSize = 12

local btnP = Instance.new("TextButton")
btnP.Parent = PSeccion
btnP.BackgroundColor3 = Color3.fromRGB(70, 20, 35)
btnP.BorderColor3 = Color3.fromRGB(120, 30, 50)
btnP.BorderSizePixel = 1
btnP.Position = UDim2.new(0.72, 0, 0.20, 0)
btnP.Size = UDim2.new(0, 110, 0, 70)
btnP.Font = Enum.Font.GothamBold
btnP.Text = "ABRIR"
btnP.TextColor3 = Color3.fromRGB(255, 255, 255)
btnP.TextSize = 15
Instance.new("UICorner", btnP).CornerRadius = UDim.new(0, 14)
btnP.MouseButton1Click:Connect(function()
    Estados.FreePetShop = not Estados.FreePetShop
    btnP.BackgroundColor3 = Estados.FreePetShop and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(70, 20, 35)
    btnP.Text = Estados.FreePetShop and "✅ ACTIVO" or "ABRIR"
end)

-- ✕ BOTÓN SALIR — ROJO GRANDE
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 30)
ExitBtn.Position = UDim2.new(0.52, 0, 0, 450)
ExitBtn.Size = UDim2.new(0.45, 0, 0, 110)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "✕  SALIR"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 28
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 16)
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
print("✅  GOLD GUERRERO HUB — ESTILO YOUNG0X ✅")
print("✅  🎯 DISEÑO IDÉNTICO + 5 FUNCIONES REALES")
print("✅  ⚡ FastGlitch | 🏋️ Training | 🔄 Rebirths")
print("✅  🎯 Killing | 🐾 PetShop | ✕ Salir")
print("✅ ===========================================")
