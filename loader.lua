-- Configuración inicial
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local velocidad = 16
local limite = 500  -- Límite máximo actualizado a 500
local minimo = 16   -- Límite mínimo fijado en 16
local incremento = 10

-- Crear Interfaz Táctil (GUI)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local BtnMas = Instance.new("TextButton")
local BtnMenos = Instance.new("TextButton")

ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Marco principal flotante
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 220, 0, 100)
Frame.Active = true
Frame.Draggable = true -- Se puede mover con el dedo

-- 1. Texto de velocidad (Encima / Arriba)
TextLabel.Parent = Frame
TextLabel.Position = UDim2.new(0, 0, 0.05, 0)
TextLabel.Size = UDim2.new(1, 0, 0.35, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
TextLabel.TextSize = 18
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "VELOCIDAD: " .. velocidad

-- 2. Botón Menos (-) (Lado Izquierdo)
BtnMenos.Parent = Frame
BtnMenos.Position = UDim2.new(0.08, 0, 0.45, 0)
BtnMenos.Size = UDim2.new(0.38, 0, 0.45, 0)
BtnMenos.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
BtnMenos.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnMenos.TextSize = 24
BtnMenos.Font = Enum.Font.SourceSansBold
BtnMenos.Text = "-"

-- 3. Botón Más (+) (Lado Derecho)
BtnMas.Parent = Frame
BtnMas.Position = UDim2.new(0.54, 0, 0.45, 0)
BtnMas.Size = UDim2.new(0.38, 0, 0.45, 0)
BtnMas.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
BtnMas.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnMas.TextSize = 24
BtnMas.Font = Enum.Font.SourceSansBold
BtnMas.Text = "+"

-- Función para actualizar la velocidad
local function actualizarVelocidad(nuevaVelocidad)
    velocidad = math.clamp(nuevaVelocidad, minimo, limite)
    TextLabel.Text = "VELOCIDAD: " .. velocidad
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = velocidad
    end
end

-- Eventos al pulsar los botones
BtnMas.MouseButton1Click:Connect(function()
    actualizarVelocidad(velocidad + incremento)
end)

BtnMenos.MouseButton1Click:Connect(function()
    actualizarVelocidad(velocidad - incremento)
end)

-- Mantener la velocidad tras reaparecer
LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    task.wait(0.5)
    LocalPlayer.Character.Humanoid.WalkSpeed = velocidad
end)
