-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — ESTILO YOUNG0X
--  ✅ MISMO DISEÑO | MISMO TAMAÑO 555px
--  ✅ Fast Glitch 90 | Todos los menús completos
--  ✅ Sin botón de volver | PlayerGui funciona
-- ==================================================

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Borra duplicado
if PlayerGui:FindFirstChild("GoldGuerreroHub") then
    PlayerGui.GoldGuerreroHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- COLORES EXACTOS
local Colores = {
    Fondo = Color3.fromRGB(12, 12, 15),
    Borde = Color3.fromRGB(200, 0, 0),
    TarjetaRoja = Color3.fromRGB(200, 0, 0),
    TarjetaOscura = Color3.fromRGB(22, 22, 28),
    BordeTarjeta = Color3.fromRGB(60, 15, 25),
    BotonRojo = Color3.fromRGB(210, 0, 0),
    BotonOscuro = Color3.fromRGB(35, 20, 28),
    Texto = Color3.fromRGB(255, 255, 255),
    TextoRojo = Color3.fromRGB(255, 60, 60),
    TextoGris = Color3.fromRGB(140, 140, 140)
}

-- VENTANA PRINCIPAL — TAMAÑO 555px
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Parent = ScreenGui
MainWindow.BackgroundColor3 = Colores.Fondo
MainWindow.BorderColor3 = Colores.Borde
MainWindow.BorderSizePixel = 3
MainWindow.Position = UDim2.new(0.5, -277, 0.5, -320)
MainWindow.Size = UDim2.new(0, 555, 0, 640)
MainWindow.Active = true
MainWindow.Draggable = true
Instance.new("UICorner", MainWindow).CornerRadius = UDim.new(0, 18)

-- TÍTULO
local TituloHub = Instance.new("TextLabel")
TituloHub.Parent = MainWindow
TituloHub.BackgroundTransparency = 1
TituloHub.Position = UDim2.new(0.5, -130, 0, 18)
TituloHub.Size = UDim2.new(0, 260, 0, 28)
TituloHub.Font = Enum.Font.GothamBold
TituloHub.Text = "GoldGuerrero Hub"
TituloHub.TextColor3 = Colores.Texto
TituloHub.TextSize = 22

local Subtitulo = Instance.new("TextLabel")
Subtitulo.Parent = MainWindow
Subtitulo.BackgroundTransparency = 1
Subtitulo.Position = UDim2.new(0.5, -90, 0, 48)
Subtitulo.Size = UDim2.new(0, 180, 0, 18)
Subtitulo.Font = Enum.Font.Gotham
Subtitulo.Text = "Menú principal"
Subtitulo.TextColor3 = Colores.TextoGris
Subtitulo.TextSize = 16

-- FUNCIÓN PARA TARJETAS
local function CrearTarjeta(texto, descripcion, colorFondo, icono)
    local Tarjeta = Instance.new("Frame")
    Tarjeta.Name = "Tarjeta_" .. texto
    Tarjeta.Parent = MainWindow
    Tarjeta.BackgroundColor3 = colorFondo
    Tarjeta.BorderColor3 = Colores.BordeTarjeta
    Tarjeta.BorderSizePixel = 2
    Tarjeta.Size = UDim2.new(1, -40, 0, 72)
    Instance.new("UICorner", Tarjeta).CornerRadius = UDim.new(0, 12)

    local Icono = Instance.new("ImageButton")
    Icono.Parent = Tarjeta
    Icono.BackgroundTransparency = 1
    Icono.Position = UDim2.new(0, 18, 0.5, -18)
    Icono.Size = UDim2.new(0, 36, 0, 36)
    Icono.Image = icono

    local TextoTarjeta = Instance.new("TextLabel")
    TextoTarjeta.Parent = Tarjeta
    TextoTarjeta.BackgroundTransparency = 1
    TextoTarjeta.Position = UDim2.new(0, 65, 0.5, -14)
    TextoTarjeta.Size = UDim2.new(0, 200, 0, 20)
    TextoTarjeta.Font = Enum.Font.GothamBold
    TextoTarjeta.Text = texto
    TextoTarjeta.TextColor3 = Colores.Texto
    TextoTarjeta.TextSize = 18

    local DescripcionTarjeta = Instance.new("TextLabel")
    DescripcionTarjeta.Parent = Tarjeta
    DescripcionTarjeta.BackgroundTransparency = 1
    DescripcionTarjeta.Position = UDim2.new(0, 65, 0.5, 6)
    DescripcionTarjeta.Size = UDim2.new(0, 200, 0, 16)
    DescripcionTarjeta.Font = Enum.Font.Gotham
    DescripcionTarjeta.Text = descripcion
    DescripcionTarjeta.TextColor3 = Colores.TextoGris
    DescripcionTarjeta.TextSize = 14

    local BotonAbrir = Instance.new("TextButton")
    BotonAbrir.Parent = Tarjeta
    BotonAbrir.BackgroundColor3 = Colores.BotonRojo
    BotonAbrir.Position = UDim2.new(1, -90, 0.5, -18)
    BotonAbrir.Size = UDim2.new(0, 72, 0, 36)
    BotonAbrir.Font = Enum.Font.GothamBold
    BotonAbrir.Text = "ABRIR"
    BotonAbrir.TextColor3 = Colores.Texto
    BotonAbrir.TextSize = 16
    Instance.new("UICorner", BotonAbrir).CornerRadius = UDim.new(0, 10)

    return Tarjeta
end

-- TARJETAS — Fast Glitch 90
local Tarjeta1 = CrearTarjeta("Fast Glitch 90", "Script de pelea muy OP", Colores.TarjetaRoja, "rbxassetid://7733868248")
Tarjeta1.Position = UDim2.new(0.5, -257, 0, 85)

local Tarjeta2 = CrearTarjeta("Public Training", "Entrenamiento automático", Colores.TarjetaOscura, "rbxassetid://7734046739")
Tarjeta2.Position = UDim2.new(0.5, -257, 0, 172)

local Tarjeta3 = CrearTarjeta("Auto Rebirths", "Renacer automáticamente", Colores.TarjetaOscura, "rbxassetid://7733904319")
Tarjeta3.Position = UDim2.new(0.5, -257, 0, 259)

local Tarjeta4 = CrearTarjeta("Free Pet Shop", "Mascotas gratis", Colores.TarjetaOscura, "rbxassetid://7734129876")
Tarjeta4.Position = UDim2.new(0.5, -257, 0, 346)

-- BOTÓN SALIR
local BotonSalir = Instance.new("TextButton")
BotonSalir.Parent = MainWindow
BotonSalir.BackgroundColor3 = Colores.BotonRojo
BotonSalir.Position = UDim2.new(0.5, -257, 0, 440)
BotonSalir.Size = UDim2.new(1, -40, 0, 72)
BotonSalir.Font = Enum.Font.GothamBold
BotonSalir.Text = "SALIR"
BotonSalir.TextColor3 = Colores.Texto
BotonSalir.TextSize = 20
Instance.new("UICorner", BotonSalir).CornerRadius = UDim.new(0, 12)

BotonSalir.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
