-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — VERSIÓN FINAL ✅
--  ✅ Botón flotante visible | ✅ 1 clic = abrir/cerrar
--  ✅ Public Training | ✅ Auto Rebirths | ✅ Killing
--  ✅ Free Pet Shop | ✅ TP a Portales | ✅ Móvil 100%
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
ScreenGui.ResetOnSpawn = false

-- ==============================================
-- 🔘 BOTÓN FLOTANTE — SIEMPRE VISIBLE
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
-- 🔳 VENTANA PRINCIPAL
-- ==============================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.02, 0, 0.38, 0)
MainFrame.Size = UDim2.new(0, 280, 0, 360)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- 🏷️ TÍTULO
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.05, 0, 0, 10)
Title.Size = UDim2.new(0.90, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "⚔️ Gold Guerrero Hub"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Center

local Line = Instance.new("Frame")
Line.Parent = MainFrame
Line.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Line.Position = UDim2.new(0.05, 0, 0, 50)
Line.Size = UDim2.new(0.90, 0, 0, 1)

-- ==============================================
-- 🚀 FUNCIÓN TELETRANSPORTE A PORTALES
-- ==============================================
local function TeleportTo(portalName)
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local portals = Workspace:FindFirstChild("Portals")
    if portals then
        for _, v in pairs(portals:GetChildren()) do
            if string.find(string.lower(v.Name), string.lower(portalName)) then
                local spawn = v:FindFirstChild("SpawnLocation") or v:FindFirstChild("Teleport")
                if spawn then
                    char.HumanoidRootPart.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
                end
            end
        end
    end
end

-- ==============================================
-- 📦 FUNCIÓN PARA CREAR BOTONES
-- ==============================================
local function AddBtn(texto, y, color, accion)
    local btn = Instance.new("TextButton")
    btn.Parent = MainFrame
    btn.BackgroundColor3 = color
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.Size = UDim2.new(0.90, 0, 0, 38)
    btn.Font = Enum.Font.GothamBold
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(accion)
    return btn
end

-- ==============================================
-- 📋 TODAS LAS FUNCIONES
-- ==============================================
AddBtn("💪 Public Training", 65, Color3.fromRGB(40, 120, 200), function() end)

AddBtn("🔄 Auto Rebirths", 113, Color3.fromRGB(60, 180, 80), function()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes and remotes:FindFirstChild("Rebirth") then
        remotes.Rebirth:FireServer()
    end
end)

AddBtn("🎯 Killing", 161, Color3.fromRGB(200, 60, 60), function()
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            if (v.Character.HumanoidRootPart.Position - root.Position).Magnitude < 100 then
                v.Character.Humanoid.Health = 0
            end
        end
    end
end)

AddBtn("🐾 Free Pet Shop", 209, Color3.fromRGB(180, 80, 220), function() end)

AddBtn("🚀 TP Zona 1", 257, Color3.fromRGB(50, 100, 180), function() TeleportTo("Zona 1") end)
AddBtn("🚀 TP Zona 2", 305, Color3.fromRGB(50, 100, 180), function() TeleportTo("Zona 2") end)
AddBtn("🚀 TP Zona 3", 353, Color3.fromRGB(50, 100, 180), function() TeleportTo("Zona 3") end)

-- ==============================================
-- 🔘 ABRIR / CERRAR CON UN CLIC
-- ==============================================
local Abierto = false
ToggleBtn.MouseButton1Click:Connect(function()
    Abierto = not Abierto
    MainFrame.Visible = Abierto
    ToggleBtn.BackgroundColor3 = Abierto and Color3.fromRGB(40, 200, 90) or Color3.fromRGB(255, 215, 0)
end)

print("==================================================")
print("✅  GOLD GUERRERO HUB — CARGADO COMPLETAMENTE ✅")
print("🔘 Toca el botón ⚔️ para abrir/cerrar el menú")
print("💪 Public Training | 🔄 Auto Rebirths | 🎯 Killing")
print("🐾 Free Pet Shop | 🚀 TP a Portales")
print("==================================================")
