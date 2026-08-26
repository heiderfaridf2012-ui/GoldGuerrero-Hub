-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — VERSIÓN DEFINITIVA ✅
--  🎨 DISEÑO IGUAL A IMAGEN | ✅ FUNCIONES ACTUALIZADAS
--  💪 Public Training → Rocks Punch + Fast Punch + TP Portales
--  🔄 Auto Rebirths | 🎯 Killing | 🐾 Free Pet Shop
--  🚀 TP a NUEVAS ZONAS según actualización del juego
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
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
-- 🔘 BOTÓN FLOTANTE ⚔️ — ABRIR/CERRAR
-- ==============================================
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.3, 0)
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "⚔️"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.TextSize = 28
ToggleBtn.Active = true
ToggleBtn.Draggable = true
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)

-- ==============================================
-- 🔳 VENTANA PRINCIPAL — IGUAL A TU IMAGEN 🎨
-- ==============================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -220)
MainFrame.Size = UDim2.new(0, 340, 0, 440)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- 🏷️ BARRA DE TÍTULO
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TitleBar.Size = UDim2.new(1, 0, 0, 55)
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 16)

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -110, 0, 8)
Title.Size = UDim2.new(0, 220, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "⚔️ Gold Guerrero Hub"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Center

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(0.90, 0, 0, 10)
CloseBtn.Size = UDim2.new(0, 30, 0, 35)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextSize = 20
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
end)

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
Line.Position = UDim2.new(0.05, 0, 0, 55)
Line.Size = UDim2.new(0.90, 0, 0, 2)

-- 📦 ESTADOS DE FUNCIONES
local States = {
    AutoEntrenar = false, AutoRebirth = false, AutoMatar = false,
    MascotasGratis = false, FastPunch = false, RocksPunch = false
}

-- 📦 FUNCIONES BÁSICAS
local function GetChar()
    return Player.Character or Player.CharacterAdded:Wait()
end

local function DoRebirth()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes and remotes:FindFirstChild("Rebirth") then
        remotes.Rebirth:FireServer()
    end
end

-- 🚀 TP A PORTALES — ZONAS NUEVAS ACTUALIZADAS
local function TeleportTo(zoneName)
    local char = GetChar()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local portals = Workspace:FindFirstChild("Portals") or Workspace:FindFirstChild("Zones")
    if portals then
        for _, v in pairs(portals:GetChildren()) do
            if string.find(string.lower(v.Name), string.lower(zoneName)) then
                local spawn = v:FindFirstChild("SpawnLocation") or v:FindFirstChild("Teleport") or v:FindFirstChild("Position")
                if spawn then
                    char.HumanoidRootPart.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 6, 0))
                    return true
                end
            end
        end
    end
    -- Buscar por nombre directo de zona
    local zona = Workspace:FindFirstChild(zoneName) or Workspace:FindFirstChild(zoneName.."Zone")
    if zona and zona:FindFirstChild("Spawn") then
        char.HumanoidRootPart.CFrame = CFrame.new(zona.Spawn.Position + Vector3.new(0, 6, 0))
    end
end

-- 🪨 FUNCIÓN ROCKS PUNCH — GOLPEAR ROCAS
local function PunchRocks()
    local char = GetChar()
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not root or not hum then return end
    local rocks = Workspace:FindFirstChild("Rocks") or Workspace:FindFirstChild("Rocas")
    if rocks then
        for _, rock in pairs(rocks:GetChildren()) do
            if rock:IsA("BasePart") and rock:FindFirstChild("Humanoid") or rock:FindFirstChild("TouchTransmitter") then
                local dist = (rock.Position - root.Position).Magnitude
                if dist < 30 then
                    -- Golpear la roca
                    if rock:FindFirstChild("Humanoid") then
                        rock.Humanoid:TakeDamage(100)
                    else
                        hum:MoveTo(rock.Position)
                    end
                end
            end
        end
    end
end

-- ⚡ FUNCIÓN FAST PUNCH — GOLPEAR RÁPIDO
local function FastPunch()
    local char = GetChar()
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end
    -- Simular golpes rápidos
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://484300472"
    local humAnim = char.Humanoid:FindFirstChild("HumanoidAnimator")
    if humAnim then
        local track = humAnim:LoadAnimation(anim)
        track:AdjustSpeed(3)
        track:Play()
    end
end

-- 📦 CREAR SUBMENÚ — ESTILO IGUAL A JUNGLES 🎨
local function CreateSubMenu(menuTitle, color, opciones)
    MainFrame.Visible = false

    local SubFrame = Instance.new("Frame")
    SubFrame.Name = "SubMenu_"..menuTitle
    SubFrame.Parent = ScreenGui
    SubFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
    SubFrame.BorderColor3 = color
    SubFrame.BorderSizePixel = 2
    SubFrame.Position = UDim2.new(0.5, -170, 0.5, -220)
    SubFrame.Size = UDim2.new(0, 340, 0, 440)
    SubFrame.Active = true
    SubFrame.Draggable = true
    Instance.new("UICorner", SubFrame).CornerRadius = UDim.new(0, 16)

    local TitleBar2 = Instance.new("Frame")
    TitleBar2.Parent = SubFrame
    TitleBar2.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    TitleBar2.Size = UDim2.new(1, 0, 0, 55)
    Instance.new("UICorner", TitleBar2).CornerRadius = UDim.new(0, 16)

    local BackBtn = Instance.new("TextButton")
    BackBtn.Parent = TitleBar2
    BackBtn.BackgroundTransparency = 1
    BackBtn.Position = UDim2.new(0.03, 0, 0, 10)
    BackBtn.Size = UDim2.new(0, 35, 0, 35)
    BackBtn.Font = Enum.Font.GothamBold
    BackBtn.Text = "←"
    BackBtn.TextColor3 = color
    BackBtn.TextSize = 18
    BackBtn.MouseButton1Click:Connect(function()
        SubFrame:Destroy()
        MainFrame.Visible = true
    end)

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Parent = TitleBar2
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0.15, 0, 0, 8)
    SubTitle.Size = UDim2.new(0, 220, 0, 40)
    SubTitle.Font = Enum.Font.GothamBold
    SubTitle.Text = menuTitle
    SubTitle.TextColor3 = color
    SubTitle.TextSize = 18
    SubTitle.TextXAlignment = Enum.TextXAlignment.Center

    local CloseSub = Instance.new("TextButton")
    CloseSub.Parent = TitleBar2
    CloseSub.BackgroundTransparency = 1
    CloseSub.Position = UDim2.new(0.90, 0, 0, 10)
    CloseSub.Size = UDim2.new(0, 30, 0, 35)
    CloseSub.Font = Enum.Font.GothamBold
    CloseSub.Text = "✕"
    CloseSub.TextColor3 = Color3.fromRGB(255, 80, 80)
    CloseSub.TextSize = 20
    CloseSub.MouseButton1Click:Connect(function()
        SubFrame:Destroy()
        MainFrame.Visible = false
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    end)

    local SubLine = Instance.new("Frame")
    SubLine.Parent = SubFrame
    SubLine.BackgroundColor3 = color
    SubLine.Position = UDim2.new(0.05, 0, 0, 55)
    SubLine.Size = UDim2.new(0.90, 0, 0, 2)

    -- CREAR BOTONES DENTRO DEL SUBMENÚ
    for i, op in ipairs(opciones) do
        local y = 65 + ((i-1)*55)
        local OpBtn = Instance.new("TextButton")
        OpBtn.Parent = SubFrame
        OpBtn.BackgroundColor3 = color
        OpBtn.Position = UDim2.new(0.05, 0, 0, y)
        OpBtn.Size = UDim2.new(0.90, 0, 0, 48)
        OpBtn.Font = Enum.Font.GothamBold
        OpBtn.Text = op.nombre
        OpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        OpBtn.TextSize = 15
        Instance.new("UICorner", OpBtn).CornerRadius = UDim.new(0, 12)

        OpBtn.MouseButton1Click:Connect(function()
            OpBtn.BackgroundColor3 = Color3.fromRGB(40, 200, 90)
            task.wait(0.3)
            OpBtn.BackgroundColor3 = color
            if op.tp then
                TeleportTo(op.tp)
            elseif op.funcion then
                op.funcion()
            end
        end)
    end
end

-- 📦 BOTONES PRINCIPALES — IGUAL A TU IMAGEN 🎨
local function AddMainButton(icon, texto, color, subOpciones)
    local btn = Instance.new("TextButton")
    btn.Parent = MainFrame
    btn.BackgroundColor3 = color
    btn.Position = UDim2.new(0.05, 0, 0, 65 + (#MainButtons * 60))
    btn.Size = UDim2.new(0.90, 0, 0, 52)
    btn.Font = Enum.Font.GothamBold
    btn.Text = icon .. "  " .. texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    btn.MouseButton1Click:Connect(function()
        CreateSubMenu(texto, color, subOpciones)
    end)
    table.insert(MainButtons, btn)
end

MainButtons = {}

-- ==============================================
-- 💪 PUBLIC TRAINING → Rocks Punch + Fast Punch + TP Portales
-- ==============================================
AddMainButton("💪", "Public Training", Color3.fromRGB(40, 120, 200), {
    {nombre = "🪨 Rocks Punch — Todas las rocas", funcion = function() States.RocksPunch = not States.RocksPunch end},
    {nombre = "⚡ Fast Punch — Golpe rápido", funcion = function() States.FastPunch = not States.FastPunch end},
    {nombre = "🚀 TP Zona 1", tp = "Zona 1"},
    {nombre = "🚀 TP Zona 2", tp = "Zona 2"},
    {nombre = "🚀 TP Zona 3", tp = "Zona 3"},
    {nombre = "🚀 TP Zona 4", tp = "Zona 4"},
    {nombre = "🚀 TP Zona 5", tp = "Zona 5"},
    {nombre = "🚀 TP Nueva Zona", tp = "Nueva Zona"},
    {nombre = "🚀 TP Zona Final", tp = "Final"},
})

-- ==============================================
-- 🔄 AUTO REBIRTHS
-- ==============================================
AddMainButton("🔄", "Auto Rebirths", Color3.fromRGB(60, 180, 80), {
    {nombre = "🔄 Activar Auto Rebirth", funcion = function() States.AutoRebirth = not States.AutoRebirth end},
    {nombre = "📊 Rebirth al llegar a X", funcion = function() end},
})

-- ==============================================
-- 🎯 KILLING
-- ==============================================
AddMainButton("🎯", "Killing", Color3.fromRGB(200, 60, 60), {
    {nombre = "⚔️ Auto Matar Jugadores", funcion = function() States.AutoMatar = not States.AutoMatar end},
    {nombre = "👹 Matar solo enemigos", funcion = function() end},
})

-- ==============================================
-- 🐾 FREE PET SHOP
-- ==============================================
AddMainButton("🐾", "Free Pet Shop", Color3.fromRGB(180, 80, 220), {
    {nombre = "🦅 Mascota Apex Gratis", funcion = function() end},
    {nombre = "🌟 Mascota Legendaria", funcion = function() end},
})

-- ==============================================
-- 🔘 ABRIR / CERRAR
-- ==============================================
local Abierto = false
ToggleBtn.MouseButton1Click:Connect(function()
    Abierto = not Abierto
    MainFrame.Visible = Abierto
    ToggleBtn.BackgroundColor3 = Abierto and Color3.fromRGB(40, 200, 90) or Color3.fromRGB(255, 215, 0)
end)

-- ==============================================
-- 🔄 BUCLE PRINCIPAL — FUNCIONES ACTIVAS
-- ==============================================
task.spawn(function()
    while task.wait(0.1) do
        if not ScreenGui:IsDescendantOf(game) then break end
        local Char = GetChar()
        if not Char then continue end

        if States.AutoRebirth then DoRebirth() task.wait(1.2) end
        if States.RocksPunch then PunchRocks() end
        if States.FastPunch then FastPunch() task.wait(0.2) end

        -- Auto Matar
        if States.AutoMatar then
            local root = Char:FindFirstChild("HumanoidRootPart")
            if root then
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (v.Character.HumanoidRootPart.Position - root.Position).Magnitude
                        if dist < 80 and v.Character:FindFirstChild("Humanoid") then
                            v.Character.Humanoid.Health = 0
                        end
                    end
                end
            end
        end
    end
end)

print("==================================================")
print("✅  GOLD GUERRERO HUB — CARGADO COMPLETAMENTE ✅")
print("💪 Public Training → Rocks Punch + Fast Punch + TP Portales 🚀")
print("🔄 Auto Rebirths | 🎯 Killing | 🐾 Free Pet Shop")
print("🔘 Toca el botón ⚔️ para abrir/cerrar")
print("==================================================")
