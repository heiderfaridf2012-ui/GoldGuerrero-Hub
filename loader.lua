-- Configuración inicial
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local velocidad = 16 -- Velocidad normal por defecto
local limite = 250
local incremento = 10

-- Crear Interfaz Visual (GUI)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.02, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 180, 0, 50)
Frame.Active = true
Frame.Draggable = true -- Puedes mover la cajita con el ratón

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
TextLabel.TextSize = 18
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "VELOCIDAD: " .. velocidad

-- Función para actualizar la velocidad del personaje
local function actualizarVelocidad(nuevaVelocidad)
    velocidad = math.clamp(nuevaVelocidad, 16, limite) -- Limita entre 16 y 250
    TextLabel.Text = "VELOCIDAD: " .. velocidad
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = velocidad
    end
end

-- Asegurar que la velocidad se mantenga si reapareces (respawn)
LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    task.wait(0.5)
    LocalPlayer.Character.Humanoid.WalkSpeed = velocidad
end)

-- Detectar teclas + y -
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.KeypadPlus or input.KeyCode == Enum.KeyCode.Plus then
        actualizarVelocidad(velocidad + incremento)
    elseif input.KeyCode == Enum.KeyCode.KeypadMinus or input.KeyCode == Enum.KeyCode.Minus then
        actualizarVelocidad(velocidad - incremento)
    end
end)
