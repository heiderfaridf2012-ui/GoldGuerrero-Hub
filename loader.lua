-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — ESTILO YOUNG0X ✅
--  🎨 PESTAÑAS: Entrenar | Rocks | Misc
--  ⚡ Auto Weight ✅ | Auto Pushups ✅ | Auto Rebirths ✅
--  🪨 Rocks Punch ✅ | Fast Punch ✅ | TP Portales ✅
--  🔘 INTERRUPTORES REALES → ON/OFF | ✅ FUNCIONAN AL ACTIVAR
--  📱 Móvil optimizado | 🖱️ Arrastrable
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
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
-- 🔘 BOTÓN FLOTANTE PARA ABRIR/CERRAR
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
-- 🔳 VENTANA PRINCIPAL — TAMAÑO EXACTO 🎨
-- ==============================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BorderColor3 = Color3.fromRGB(80, 140, 255)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.5, -340, 0.5, -280)
MainFrame.Size = UDim2.new(0, 680, 0, 560)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)

-- 🏷️ TÍTULO
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -180, 0, 12)
Title.Size = UDim2.new(0, 360, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "¡Gold Guerrero Hub!"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 26
Title.TextXAlignment = Enum.TextXAlignment.Center

-- 📌 PESTAÑAS
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0.03, 0, 0, 60)
TabContainer.Size = UDim2.new(0.94, 0, 0, 50)

local Tabs = {}
local SelectedTab = "Entrenar"

local function CreateTab(name, index)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabContainer
    TabBtn.Name = name
    TabBtn.BackgroundColor3 = name == "Entrenar" and Color3.fromRGB(30, 50, 90) or Color3.fromRGB(25, 25, 40)
    TabBtn.Position = UDim2.new((index-1)*0.33, 5, 0, 0)
    TabBtn.Size = UDim2.new(0.32, 0, 0, 45)
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.TextSize = 18
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 10)
    Tabs[name] = TabBtn
    return TabBtn
end

CreateTab("Entrenar", 1)
CreateTab("Rocks", 2)
CreateTab("Misc", 3)

-- Línea inferior pestaña seleccionada
local TabLine = Instance.new("Frame")
TabLine.Parent = MainFrame
TabLine.BackgroundColor3 = Color3.fromRGB(120, 170, 255)
TabLine.Position = UDim2.new(0.03, 5, 0, 110)
TabLine.Size = UDim2.new(0.32, 0, 0, 3)

-- 📊 PANEL DE ESTADÍSTICAS (solo en Entrenar)
local StatsPanel = Instance.new("Frame")
StatsPanel.Parent = MainFrame
StatsPanel.BackgroundColor3 = Color3.fromRGB(25, 30, 50)
StatsPanel.BorderColor3 = Color3.fromRGB(80, 140, 255)
StatsPanel.BorderSizePixel = 2
StatsPanel.Position = UDim2.new(0.03, 0, 0, 125)
StatsPanel.Size = UDim2.new(0.94, 0, 0, 90)
Instance.new("UICorner", StatsPanel).CornerRadius = UDim.new(0, 12)

local StatsTitle = Instance.new("TextLabel")
StatsTitle.Parent = StatsPanel
StatsTitle.BackgroundTransparency = 1
StatsTitle.Position = UDim2.new(0.5, -120, 0, 5)
StatsTitle.Size = UDim2.new(0, 240, 0, 25)
StatsTitle.Font = Enum.Font.GothamBold
StatsTitle.Text = "💪 ENTRENAMIENTO BÁSICO 💪"
StatsTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
StatsTitle.TextSize = 17
StatsTitle.TextXAlignment = Enum.TextXAlignment.Center

local function CreateStatLabel(text, posX)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = StatsPanel
    lbl.BackgroundTransparency = 1
    lbl.Position = UDim2.new(posX, 0, 0, 35)
    lbl.Size = UDim2.new(0.30, 0, 0, 45)
    lbl.Font = Enum.Font.GothamBold
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextSize = 20
    lbl.TextXAlignment = Enum.TextXAlignment.Center
    return lbl
end

local StatFuerza = CreateStatLabel("Cargando...", 0.02)
local StatDurabilidad = CreateStatLabel("Cargando...", 0.35)
local StatRebirths = CreateStatLabel("Cargando...", 0.68)

local Sep1 = Instance.new("Frame")
Sep1.Parent = StatsPanel
Sep1.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
Sep1.Position = UDim2.new(0.33, 0, 0, 20)
Sep1.Size = UDim2.new(0.01, 0, 0, 70)

local Sep2 = Instance.new("Frame")
Sep2.Parent = StatsPanel
Sep2.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
Sep2.Position = UDim2.new(0.66, 0, 0, 20)
Sep2.Size = UDim2.new(0.01, 0, 0, 70)

local LabelFuerza = Instance.new("TextLabel")
LabelFuerza.Parent = StatsPanel
LabelFuerza.BackgroundTransparency = 1
LabelFuerza.Position = UDim2.new(0.02, 0, 0, 5)
LabelFuerza.Size = UDim2.new(0.30, 0, 0, 20)
LabelFuerza.Font = Enum.Font.Gotham
LabelFuerza.Text = "FUERZA"
LabelFuerza.TextColor3 = Color3.fromRGB(150, 180, 220)
LabelFuerza.TextSize = 12
LabelFuerza.TextXAlignment = Enum.TextXAlignment.Center

local LabelDurabilidad = Instance.new("TextLabel")
LabelDurabilidad.Parent = StatsPanel
LabelDurabilidad.BackgroundTransparency = 1
LabelDurabilidad.Position = UDim2.new(0.35, 0, 0, 5)
LabelDurabilidad.Size = UDim2.new(0.30, 0, 0, 20)
LabelDurabilidad.Font = Enum.Font.Gotham
LabelDurabilidad.Text = "DURABILIDAD"
LabelDurabilidad.TextColor3 = Color3.fromRGB(150, 180, 220)
LabelDurabilidad.TextSize = 12
LabelDurabilidad.TextXAlignment = Enum.TextXAlignment.Center

local LabelRebirths = Instance.new("TextLabel")
LabelRebirths.Parent = StatsPanel
LabelRebirths.BackgroundTransparency = 1
LabelRebirths.Position = UDim2.new(0.68, 0, 0, 5)
LabelRebirths.Size = UDim2.new(0.30, 0, 0, 20)
LabelRebirths.Font = Enum.Font.Gotham
LabelRebirths.Text = "REBIRTHS"
LabelRebirths.TextColor3 = Color3.fromRGB(150, 180, 220)
LabelRebirths.TextSize = 12
LabelRebirths.TextXAlignment = Enum.TextXAlignment.Center

-- 📦 ESTADOS DE FUNCIONES
local States = {
    AutoWeight = false,
    AutoPushups = false,
    AutoRebirth = false,
    RocksPunch = false,
    FastPunch = false,
    LockPosition = false
}

local OriginalPosition = nil

-- 📦 FUNCIONES BÁSICAS
local function GetChar()
    return Player.Character or Player.CharacterAdded:Wait()
end

local function FormatNumber(num)
    return string.format("%.0f", num)
end

-- 📦 ACTUALIZAR ESTADÍSTICAS
local function UpdateStats()
    local leaderstats = Player:FindFirstChild("leaderstats")
    if leaderstats then
        local fuerza = leaderstats:FindFirstChild("Fuerza") or leaderstats:FindFirstChild("Strength")
        local durabilidad = leaderstats:FindFirstChild("Durabilidad") or leaderstats:FindFirstChild("Durability")
        local rebirths = leaderstats:FindFirstChild("Rebirths") or leaderstats:FindFirstChild("Rebirth")
        
        if fuerza then StatFuerza.Text = FormatNumber(fuerza.Value) end
        if durabilidad then StatDurabilidad.Text = FormatNumber(durabilidad.Value) end
        if rebirths then StatRebirths.Text = FormatNumber(rebirths.Value) end
    end
end

-- ⚡ AUTO WEIGHT — LEVANTAR PESAS AUTOMÁTICO
local function AutoWeightFunc()
    local char = GetChar()
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    
    local weights = Workspace:FindFirstChild("Weights") or Workspace:FindFirstChild("Pesas")
    if weights then
        for _, w in pairs(weights:GetChildren()) do
            if w:IsA("BasePart") and (string.find(string.lower(w.Name), "weight") or string.find(string.lower(w.Name), "pesa")) then
                local dist = (w.Position - hrp.Position).Magnitude
                if dist < 15 then
                    hum:MoveTo(w.Position)
                    task.wait(0.3)
                end
            end
        end
    end
end

-- ⚡ AUTO PUSHUPS — FLEXIONES AUTOMÁTICAS
local function AutoPushupsFunc()
    local char = GetChar()
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://616005518"
    local humAnim = char.Humanoid:FindFirstChild("HumanoidAnimator")
    if humAnim then
        local track = humAnim:LoadAnimation(anim)
        track:Play()
        task.wait(0.5)
        track:Stop()
    end
end

-- 🔄 AUTO REBIRTH
local function DoRebirth()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes and remotes:FindFirstChild("Rebirth") then
        remotes.Rebirth:FireServer()
    end
end

-- 🪨 ROCKS PUNCH — GOLPEAR ROCAS
local function PunchRocksFunc()
    local char = GetChar()
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local rocks = Workspace:FindFirstChild("Rocks") or Workspace:FindFirstChild("Rocas")
    if rocks then
        for _, rock in pairs(rocks:GetChildren()) do
            if rock:IsA("BasePart") then
                local dist = (rock.Position - hrp.Position).Magnitude
                if dist < 25 then
                    if rock:FindFirstChild("Humanoid") then
                        rock.Humanoid:TakeDamage(100)
                    else
                        local hum = char:FindFirstChild("Humanoid")
                        if hum then hum:MoveTo(rock.Position) end
                    end
                end
            end
        end
    end
end

-- ⚡ FAST PUNCH — GOLPE RÁPIDO
local function FastPunchFunc()
    local char = GetChar()
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://484300472"
    local humAnim = char.Humanoid:FindFirstChild("HumanoidAnimator")
    if humAnim then
        local track = humAnim:LoadAnimation(anim)
        track:AdjustSpeed(2.5)
        track:Play()
        task.wait(0.15)
        track:Stop()
    end
end

-- 🚀 TP A PORTALES
local function TeleportTo(zoneName)
    local char = GetChar()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    if States.LockPosition and OriginalPosition then
        char.HumanoidRootPart.CFrame = OriginalPosition
        return
    end
    local portals = Workspace:FindFirstChild("Portals") or Workspace:FindFirstChild("Zones")
    if portals then
        for _, v in pairs(portals:GetChildren()) do
            if string.find(string.lower(v.Name), string.lower(zoneName)) then
                local spawn = v:FindFirstChild("SpawnLocation") or v:FindFirstChild("Teleport")
                if spawn then
                    char.HumanoidRootPart.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 6, 0))
                end
            end
        end
    end
end

-- 🔘 CREAR INTERRUPTOR ESTILO YOUNG0X
local function CreateToggle(name, desc, yPos, color, callback)
    local Container = Instance.new("Frame")
    Container.Parent = MainFrame
    Container.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    Container.BorderColor3 = color
    Container.BorderSizePixel = 2
    Container.Position = UDim2.new(0.03, 0, 0, yPos)
    Container.Size = UDim2.new(0.94, 0, 0, 55)
    Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 12)

    local TitleLbl = Instance.new("TextLabel")
    TitleLbl.Parent = Container
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Position = UDim2.new(0.03, 0, 0, 0)
    TitleLbl.Size = UDim2.new(0.75, 0, 1, 0)
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.Text = name
    TitleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLbl.TextSize = 18
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left

    local SwitchBg = Instance.new("Frame")
    SwitchBg.Parent = Container
    SwitchBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    SwitchBg.Position = UDim2.new(0.88, 0, 0.15, 0)
    SwitchBg.Size = UDim2.new(0, 45, 0, 38)
    Instance.new("UICorner", SwitchBg).CornerRadius = UDim.new(1, 0)

    local SwitchKnob = Instance.new("Frame")
    SwitchKnob.Parent = SwitchBg
    SwitchKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 210)
    SwitchKnob.Position = UDim2.new(0.08, 0, 0.12, 0)
    SwitchKnob.Size = UDim2.new(0, 32, 0, 30)
    Instance.new("UICorner", SwitchKnob).CornerRadius = UDim.new(1, 0)

    local Toggled = false
    local Btn = Instance.new("TextButton")
    Btn.Parent = Container
    Btn.BackgroundTransparency = 1
    Btn.Size = UDim2.new(1, 0, 1, 0)
    Btn.Text = ""
    Btn.MouseButton1Click:Connect(function()
        Toggled = not Toggled
        if Toggled then
            SwitchBg.BackgroundColor3 = color
            SwitchKnob.Position = UDim2.new(0.58, 0, 0.12, 0)
            SwitchKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            SwitchBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
            SwitchKnob.Position = UDim2.new(0.08, 0, 0.12, 0)
            SwitchKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 210)
        end
        if callback then callback(Toggled) end
    end)

    return Container
end

-- 📦 CONTENEDORES DE PESTAÑAS
local TabContents = {
    Entrenar = Instance.new("Frame"),
    Rocks = Instance.new("Frame"),
    Misc = Instance.new("Frame")
}

for name, frame in pairs(TabContents) do
    frame.Parent = MainFrame
    frame.BackgroundTransparency = 1
    frame.Position = UDim2.new(0.03, 0, 0, 125)
    frame.Size = UDim2.new(0.94, 0, 0, 420)
    frame.Visible = name == "Entrenar"
end

-- ⚡ PESTAÑA ENTRENAR — INTERRUPTORES
CreateToggle("⚡ Auto Weight ⚡", "Levantar pesas automático", 0, Color3.fromRGB(120, 80, 220), function(state)
    States.AutoWeight = state
end).Parent = TabContents.Entrenar

CreateToggle("⚡ Auto Pushups ⚡", "Flexiones automáticas", 65, Color3.fromRGB(120, 80, 220), function(state)
    States.AutoPushups = state
end).Parent = TabContents.Entrenar

CreateToggle("📍 Lock Position 📍", "Bloquear posición", 130, Color3.fromRGB(200, 60, 60), function(state)
    States.LockPosition = state
    if state then
        local char = GetChar()
        if char and char:FindFirstChild("HumanoidRootPart") then
            OriginalPosition = char.HumanoidRootPart.CFrame
        end
    end
end).Parent = TabContents.Entrenar

CreateToggle("🔄 Auto Rebirths 🔄", "Renacimientos automáticos", 195, Color3.fromRGB(60, 180, 80), function(state)
    States.AutoRebirth = state
end).Parent = TabContents.Entrenar

-- 🪨 PESTAÑA ROCKS
CreateToggle("🪨 Rocks Punch 🪨", "Golpear rocas automático", 0, Color3.fromRGB(160, 100, 60), function(state)
    States.RocksPunch = state
end).Parent = TabContents.Rocks

CreateToggle("⚡ Fast Punch ⚡", "Golpe rápido", 65, Color3.fromRGB(160, 100, 60), function(state)
    States.FastPunch = state
end).Parent = TabContents.Rocks

-- TP dentro de Rocks
local TPLabel = Instance.new("TextLabel")
TPLabel.Parent = TabContents.Rocks
TPLabel.BackgroundTransparency = 1
TPLabel.Position = UDim2.new(0, 0, 0.45, 0)
TPLabel.Size = UDim2.new(1, 0, 0, 30)
TPLabel.Font = Enum.Font.GothamBold
TPLabel.Text = "🚀 TELETRANSPORTE"
TPLabel.TextColor3 = Color3.fromRGB(80, 140, 255)
TPLabel.TextSize = 16
TPLabel.TextXAlignment = Enum.TextXAlignment.Center

local TPZones = {"Zona 1", "Zona 2", "Zona 3", "Zona 4", "Nueva Zona", "Zona Final"}
for i, zona in ipairs(TPZones) do
    local y = 180 + ((i-1)*55)
    local TpBtn = Instance.new("TextButton")
    TpBtn.Parent = TabContents.Rocks
    TpBtn.BackgroundColor3 = Color3.fromRGB(30, 50, 90)
    TpBtn.BorderColor3 = Color3.fromRGB(80, 140, 255)
    TpBtn.BorderSizePixel = 2
    TpBtn.Position = UDim2.new(0, 0, 0, y)
    TpBtn.Size = UDim2.new(1, 0, 0, 48)
    TpBtn.Font = Enum.Font.GothamBold
    TpBtn.Text = "🚀 " .. zona
    TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TpBtn.TextSize = 15
    Instance.new("UICorner", TpBtn).CornerRadius = UDim.new(0, 10)
    TpBtn.MouseButton1Click:Connect(function()
        TeleportTo(zona)
        TpBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 80)
        task.wait(0.3)
        TpBtn.BackgroundColor3 = Color3.fromRGB(30, 50, 90)
    end)
end

-- 📋 PESTAÑA MISC
local MiscLabel = Instance.new("TextLabel")
MiscLabel.Parent = TabContents.Misc
MiscLabel.BackgroundTransparency = 1
MiscLabel.Position = UDim2.new(0, 0, 0.05, 0)
MiscLabel.Size = UDim2.new(1, 0, 0, 40)
MiscLabel.Font = Enum.Font.GothamBold
MiscLabel.Text = "⚙️ AJUSTES ADICIONALES"
MiscLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
MiscLabel.TextSize = 18
MiscLabel.TextXAlignment = Enum.TextXAlignment.Center

-- 🔄 CAMBIAR PESTAÑAS
local function SwitchTab(name)
    SelectedTab = name
    for tabName, btn in pairs(Tabs) do
        btn.BackgroundColor3 = tabName == name and Color3.fromRGB(30, 50, 90) or Color3.fromRGB(25, 25, 40)
    end
    for tabName, frame in pairs(TabContents) do
        frame.Visible = tabName == name
    end
    StatsPanel.Visible = name == "Entrenar"
    local index = 1
    if name == "Rocks" then index = 2 elseif name == "Misc" then index = 3 end
    TabLine.Position = UDim2.new(0.03, 5 + (index-1)*225, 0, 110)
end

Tabs["Entrenar"].MouseButton1Click:Connect(function() SwitchTab("Entrenar") end)
Tabs["Rocks"].MouseButton1Click:Connect(function() SwitchTab("Rocks") end)
Tabs["Misc"].MouseButton1Click:Connect(function() SwitchTab("Misc") end)

-- ❌ BOTÓN SALIR
local ExitBtn = Instance.new("TextButton")
ExitBtn.Parent = MainFrame
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 25, 40)
ExitBtn.Position = UDim2.new(0.03, 0, 0.92, 0)
ExitBtn.Size = UDim2.new(0.94, 0, 0, 45)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.Text = "✕ CERRAR"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.TextSize = 18
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 12)
ExitBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
end)

-- 🔘 ABRIR/CERRAR MENÚ
local Abierto = false
ToggleBtn.MouseButton1Click:Connect(function()
    Abierto = not Abierto
    MainFrame.Visible = Abierto
    ToggleBtn.BackgroundColor3 = Abierto and Color3.fromRGB(40, 200, 90) or Color3.fromRGB(255, 215, 0)
    if Abierto then UpdateStats() end
end)

-- 🔄 BUCLE PRINCIPAL — TODAS LAS FUNCIONES FUNCIONANDO ✅
task.spawn(function()
    while task.wait(0.1) do
        if not ScreenGui:IsDescendantOf(game) then break end
        local Char = GetChar()
        if not Char then continue end

        if Abierto then UpdateStats() end

        if States.LockPosition and OriginalPosition then
            if Char and Char:FindFirstChild("HumanoidRootPart") then
                Char.HumanoidRootPart.CFrame = OriginalPosition
            end
        end

        if States.AutoWeight then AutoWeightFunc() end
        if States.AutoPushups then AutoPushupsFunc() end
        if States.AutoRebirth then 
            DoRebirth() 
              task.wait(1.5)
        end
        if States.RocksPunch then PunchRocksFunc() end
        if States.FastPunch then FastPunchFunc() end
    end
end)

print("==================================================")
print("✅  GOLD GUERRERO HUB — CARGADO COMPLETAMENTE ✅")
print("🎨 Estilo Young0x | Pestañas: Entrenar | Rocks | Misc")
print("⚡ Auto Weight ✅ | Auto Pushups ✅ | Auto Rebirths ✅")
print("🪨 Rocks Punch ✅ | Fast Punch ✅ | TP Portales ✅")
print("🔘 Toca el botón ⚔️ para abrir/cerrar")
print("==================================================")
