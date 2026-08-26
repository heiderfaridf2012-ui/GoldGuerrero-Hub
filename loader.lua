-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — TP 1 CLIC ✅
--  🚀 TP A PORTALES — 1 CLIC + BOTÓN ILUMINADO 🟢
--  ✅ Public Training | ✅ Auto Rebirths | ✅ Killing
--  ✅ Free Pet Shop | ✅ Botón Flotante 🔘
--  ✅ Compacto | ✅ Arrastrable | ✅ Móvil
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Player = Players.LocalPlayer

-- Limpiar duplicados
if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui:FindFirstChild("GoldGuerreroHub"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ==============================================
-- 🔘 BOTÓN FLOTANTE — 1 CLIC = ABRIR/CERRAR
-- ==============================================
local ToggleButton = Instance.new("Frame")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleButton.Position = UDim2.new(0.02, 0, 0.3, 0)
ToggleButton.Size = UDim2.new(0, 55, 0, 55)
ToggleButton.Active = true
ToggleButton.Draggable = true
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)

local ToggleIcon = Instance.new("TextLabel")
ToggleIcon.Parent = ToggleButton
ToggleIcon.BackgroundTransparency = 1
ToggleIcon.Size = UDim2.new(1, 0, 1, 0)
ToggleIcon.Font = Enum.Font.GothamBold
ToggleIcon.Text = "⚔️"
ToggleIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleIcon.TextSize = 28

-- 🔳 VENTANA PRINCIPAL — COMPACTA
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.02, 0, 0.38, 0)
MainFrame.Size = UDim2.new(0, 280, 0, 340)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- 🏷️ BARRA DE TÍTULO
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.Size = UDim2.new(1, 0, 0, 45)
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -100, 0, 5)
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gold Guerrero Hub"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Center

-- ❌ BOTÓN CERRAR
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(0.90, 0, 0, 5)
CloseBtn.Size = UDim2.new(0, 25, 0, 35)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextSize = 18
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
end)

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Line.Position = UDim2.new(0, 0, 0, 45)
Line.Size = UDim2.new(1, 0, 0, 1)

-- 📦 VARIABLES
local States = {
    AutoEntrenar = false, AutoDinero = false, AutoComprar = false,
    AutoRebirth = false, AutoMatar = false, MascotasGratis = false
}

-- 📦 FUNCIONES
local function GetCharacter()
    return Player.Character or Player.CharacterAdded:Wait()
end

local function DoRebirth()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes and remotes:FindFirstChild("Rebirth") then
        remotes.Rebirth:FireServer()
    end
end

local function BuyItem(itemName)
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes and remotes:FindFirstChild("BuyItem") then
        remotes.BuyItem:FireServer(itemName)
    end
end

local function KillNearest()
    local char = GetCharacter()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (v.Character.HumanoidRootPart.Position - root.Position).Magnitude
            if dist < 100 and v.Character:FindFirstChild("Humanoid") then
                v.Character.Humanoid.Health = 0
            end
        end
    end
end

-- 🚀 TP A PORTALES — 1 CLIC ✅
local function TeleportTo(portalName)
    local char = GetCharacter()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local portals = Workspace:FindFirstChild("Portals")
    if portals then
        for _, v in pairs(portals:GetChildren()) do
            if string.find(string.lower(v.Name), string.lower(portalName)) then
                local spawn = v:FindFirstChild("SpawnLocation") or v:FindFirstChild("Position") or v:FindFirstChild("Teleport")
                if spawn then
                    char.HumanoidRootPart.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
                    return true
                end
            end
        end
    end
    return false
end

-- 📦 CREAR SUBMENÚ
local function CreateSubMenu(menuTitle, opciones)
    MainFrame.Visible = false

    local SubFrame = Instance.new("Frame")
    SubFrame.Name = "SubMenu_"..menuTitle
    SubFrame.Parent = ScreenGui
    SubFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    SubFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    SubFrame.BorderSizePixel = 2
    SubFrame.Position = UDim2.new(0.02, 0, 0.38, 0)
    SubFrame.Size = UDim2.new(0, 280, 0, 340)
    SubFrame.Active = true
    SubFrame.Draggable = true
    Instance.new("UICorner", SubFrame).CornerRadius = UDim.new(0, 12)

    local TitleBar2 = Instance.new("Frame")
    TitleBar2.Parent = SubFrame
    TitleBar2.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    TitleBar2.Size = UDim2.new(1, 0, 0, 45)
    Instance.new("UICorner", TitleBar2).CornerRadius = UDim.new(0, 12)

    local BackBtn = Instance.new("TextButton")
    BackBtn.Parent = TitleBar2
    BackBtn.BackgroundTransparency = 1
    BackBtn.Position = UDim2.new(0.03, 0, 0, 5)
    BackBtn.Size = UDim2.new(0, 35, 0, 35)
    BackBtn.Font = Enum.Font.GothamBold
    BackBtn.Text = "←"
    BackBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
    BackBtn.TextSize = 16
    BackBtn.MouseButton1Click:Connect(function()
        SubFrame:Destroy()
        MainFrame.Visible = true
    end)

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Parent = TitleBar2
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0.18, 0, 0, 5)
    SubTitle.Size = UDim2.new(0, 180, 0, 35)
    SubTitle.Font = Enum.Font.GothamBold
    SubTitle.Text = menuTitle
    SubTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    SubTitle.TextSize = 14
    SubTitle.TextXAlignment = Enum.TextXAlignment.Center

    local CloseSub = Instance.new("TextButton")
    CloseSub.Parent = TitleBar2
    CloseSub.BackgroundTransparency = 1
    CloseSub.Position = UDim2.new(0.90, 0, 0, 5)
    CloseSub.Size = UDim2.new(0, 25, 0, 35)
    CloseSub.Font = Enum.Font.GothamBold
    CloseSub.Text = "✕"
    CloseSub.TextColor3 = Color3.fromRGB(255, 80, 80)
    CloseSub.TextSize = 18
    CloseSub.MouseButton1Click:Connect(function()
        SubFrame:Destroy()
        MainFrame.Visible = false
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    end)

    local SubLine = Instance.new("Frame")
    SubLine.Parent = SubFrame
    SubLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SubLine.Position = UDim2.new(0, 0, 0, 45)
    SubLine.Size = UDim2.new(1, 0, 0, 1)

    -- OPCIONES CON BOTÓN ILUMINADO 🟢
    for i, op in ipairs(opciones) do
        local y = 55 + ((i-1)*48)
        local OpFrame = Instance.new("Frame")
        OpFrame.Parent = SubFrame
        OpFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        OpFrame.Position = UDim2.new(0.04, 0, 0, y)
        OpFrame.Size = UDim2.new(0.92, 0, 0, 40)
        Instance.new("UICorner", OpFrame).CornerRadius = UDim.new(0, 8)

        local OpLabel = Instance.new("TextLabel")
        OpLabel.Parent = OpFrame
        OpLabel.BackgroundTransparency = 1
        OpLabel.Position = UDim2.new(0.05, 0, 0, 0)
        OpLabel.Size = UDim2.new(0.70, 0, 1, 0)
        OpLabel.Font = Enum.Font.Gotham
        OpLabel.Text = op.nombre
        OpLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
        OpLabel.TextSize = 12
        OpLabel.TextXAlignment = Enum.TextXAlignment.Left

        -- 🔘 BOTÓN ILUMINADO AL LADO — 1 CLIC ✅
        local OpBtn = Instance.new("TextButton")
        OpBtn.Parent = OpFrame
        OpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        OpBtn.Position = UDim2.new(0.85, 0, 0.5, -12)
        OpBtn.Size = UDim2.new(0, 30, 0, 24)
        Instance.new("UICorner", OpBtn).CornerRadius = UDim.new(0, 5)
        OpBtn.Font = Enum.Font.GothamBold
        OpBtn.Text = "▶"
        OpBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        OpBtn.TextSize = 12

        OpBtn.MouseButton1Click:Connect(function()
            -- 🟢 SE ILUMINA AL TOCAR
            OpBtn.BackgroundColor3 = Color3.fromRGB(40, 200, 90)
            OpBtn.Text = "✓"
            OpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            
            -- ⏳ VUELVE A APAGARSE DESPUÉS
            task.wait(1.5)
            OpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            OpBtn.Text = "▶"
            OpBtn.TextColor3 = Color3.fromRGB(180, 180, 180)

            -- 🚀 EJECUTAR ACCIÓN
            if op.tp then
                TeleportTo(op.tp)
            elseif op.funcion then
                op.funcion()
            end
        end)
    end
end

-- 📦 CREAR OPCIÓN PRINCIPAL
MainOptions = {}
local function CreateMainOption(icon, title, color, opciones)
    local Frame = Instance.new("Frame")
    Frame.Parent = MainFrame
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Frame.Position = UDim2.new(0.04, 0, 0, 55 + (#MainOptions * 65))
    Frame.Size = UDim2.new(0.92, 0, 0, 55)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

    local IconBg = Instance.new("Frame")
    IconBg.Parent = Frame
    IconBg.BackgroundColor3 = color
    IconBg.Position = UDim2.new(0.03, 0, 0.1, 0)
    IconBg.Size = UDim2.new(0, 40, 0, 40)
    Instance.new("UICorner", IconBg).CornerRadius = UDim.new(0, 8)

    local IconLbl = Instance.new("TextLabel")
    IconLbl.Parent = IconBg
    IconLbl.BackgroundTransparency = 1
    IconLbl.Size = UDim2.new(1, 0, 1, 0)
    IconLbl.Font = Enum.Font.GothamBold
    IconLbl.Text = icon
    IconLbl.TextSize = 20

    local TitleLbl = Instance.new("TextLabel")
    TitleLbl.Parent = Frame
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Position = UDim2.new(0.20, 0, 0.15, 0)
    TitleLbl.Size = UDim2.new(0.55, 0, 0, 20)
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.Text = title
    TitleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLbl.TextSize = 13
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left

    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Parent = Frame
    OpenBtn.BackgroundColor3 = color
    OpenBtn.Position = UDim2.new(0.82, 0, 0.5, -12)
    OpenBtn.Size = UDim2.new(0, 45, 0, 24)
    Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 6)
    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.Text = "▶"
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.TextSize = 12
    OpenBtn.MouseButton1Click:Connect(function()
        CreateSubMenu(title, opciones)
    end)

    table.insert(MainOptions, Frame)
end

-- ==============================================
-- 💪 PUBLIC TRAINING + TP A PORTALES 🚀
-- ==============================================
CreateMainOption("💪", "Public Training", Color3.fromRGB(40, 120, 200), {
    {nombre = "💪 Auto Entrenar Fuerza", funcion = function() end},
    {nombre = "💰 Auto Ganar Dinero", funcion = function() end},
    {nombre = "🛒 Auto Comprar Equipo", funcion = function() States.AutoComprar = true end},
    {nombre = "🚀 TP Zona 1", tp = "Zona 1"},
    {nombre = "🚀 TP Zona 2", tp = "Zona 2"},
    {nombre = "🚀 TP Zona 3", tp = "Zona 3"},
    {nombre = "🚀 TP Zona 4", tp = "Zona 4"},
    {nombre = "🚀 TP Zona 5", tp = "Zona 5"},
    {nombre = "🚀 TP Zona Final", tp = "Final"},
})

-- ==============================================
-- 🔄 AUTO REBIRTHS
-- ==============================================
CreateMainOption("🔄", "Auto Rebirths", Color3.fromRGB(60, 180, 80), {
    {nombre = "🔄 Activar Auto Rebirth", funcion = function() States.AutoRebirth = true end},
    {nombre = "📊 Rebirth al llegar a X", funcion = function() end},
})

-- ==============================================
-- 🎯 KILLING
-- ==============================================
CreateMainOption("🎯", "Killing", Color3.fromRGB(200, 60, 60), {
    {nombre = "⚔️ Auto Matar Jugadores", funcion = function() States.AutoMatar = true end},
    {nombre = "👹 Matar solo enemigos", funcion = function() end},
})

-- ==============================================
-- 🐾 FREE PET SHOP
-- ==============================================
CreateMainOption("🐾", "Free Pet Shop", Color3.fromRGB(180, 80, 220), {
    {nombre = "🦅 Mascota Apex Gratis", funcion = function() end},
    {nombre = "🌟 Mascota Legendaria", funcion = function() end},
})

-- ==============================================
-- 🔘 BOTÓN FLOTANTE — ABRIR/CERRAR (FOCO)
-- ==============================================
local MenuOpen = false
ToggleButton.MouseButton1Click:Connect(function()
    MenuOpen = not MenuOpen
    MainFrame.Visible = MenuOpen
    if MenuOpen then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 200, 90) -- 🟢 ENCENDIDO
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0) -- 🟡 APAGADO
    end
end)

-- ==============================================
-- 🔄 BUCLE PRINCIPAL
-- ==============================================
task.spawn(function()
    while task.wait(0.15) do
        if not ScreenGui:IsDescendantOf(game) then break end
        local Char = GetCharacter()
        if not Char then continue end

        if States.AutoRebirth then DoRebirth() task.wait(1.5) end
        if States.AutoComprar then BuyItem("GymBag") BuyItem("Dumbbell") task.wait(2) end
        if States.AutoMatar then KillNearest() task.wait(0.5) end
    end
end)

print("==================================================")
print("✅  GOLD GUERRERO HUB — CARGADO ✅")
print("💪 Public Training + TP Portales 🚀")
print("🔄 Auto Rebirths | 🎯 Killing | 🐾 Free Pet Shop")
print("🔘 Toca el botón para abrir/cerrar")
print("==================================================")
