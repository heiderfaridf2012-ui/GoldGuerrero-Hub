-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — AJUSTE FINAL
--  ✅ Ancho: 565px (+10px) | Altura: 460px (-50px)
--  ✅ Fast Glitch 90 | Diseño Young0x | PlayerGui
--  ✅ Todo lo demás IGUAL — solo tamaño ajustado
-- ==================================================

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- ✅ Borra duplicados al cargar
if PlayerGui:FindFirstChild("GoldGuerreroHub") then
    PlayerGui.GoldGuerreroHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🎨 COLORES ESTILO YOUNG0X
local Colores = {
    Fondo = Color3.fromRGB(12, 12, 15),
    Borde = Color3.fromRGB(200, 0, 0),
    TarjetaRoja = Color3.fromRGB(200, 0, 0),
    TarjetaOscura = Color3.fromRGB(25, 25, 35),
    BordeTarjeta = Color3.fromRGB(60, 15, 25),
    BotonRojo = Color3.fromRGB(210, 0, 0),
    Texto = Color3.fromRGB(255, 255, 255),
    TextoGris = Color3.fromRGB(140, 140, 140)
}

-- 📦 VENTANA — TAMAÑO EXACTO QUE PEDISTE: 565 × 460px
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Parent = ScreenGui
MainWindow.BackgroundColor3 = Colores.Fondo
MainWindow.BorderColor3 = Colores.Borde
MainWindow.BorderSizePixel = 3
MainWindow.Position = UDim2.new(0.5, -282, 0.5, -230)  -- Centrado con nuevo ancho, más arriba
MainWindow.Size = UDim2.new(0, 565, 0, 460)  -- ✅ 565 ancho | 460 alto
MainWindow.Active = true
MainWindow.Draggable = true
Instance.new("UICorner", MainWindow).CornerRadius = UDim.new(0, 18)

-- 🏆 TÍTULO
local TituloHub = Instance.new("TextLabel")
TituloHub.Parent = MainWindow
TituloHub.BackgroundTransparency = 1
TituloHub.Position = UDim2.new(0.5, -130, 0, 12)
TituloHub.Size = UDim2.new(0, 260, 0, 28)
TituloHub.Font = Enum.Font.GothamBold
TituloHub.Text = "GoldGuerrero Hub"
TituloHub.TextColor3 = Colores.Texto
TituloHub.TextSize = 22

local Subtitulo = Instance.new("TextLabel")
Subtitulo.Parent = MainWindow
Subtitulo.BackgroundTransparency = 1
Subtitulo.Position = UDim2.new(0.5, -90, 0, 42)
Subtitulo.Size = UDim2.new(0, 180, 0, 14)
Subtitulo.Font = Enum.Font.Gotham
Subtitulo.Text = "Muscle Legends"
Subtitulo.TextColor3 = Colores.TextoGris
Subtitulo.TextSize = 13

-- 📦 FUNCIÓN CREAR TARJETA — Botón ABRIR: 88×36px
local function CrearTarjeta(PosY, ColorFondo, Texto, Descripcion, Icono)
    local Tarjeta = Instance.new("Frame")
    Tarjeta.Parent = MainWindow
    Tarjeta.BackgroundColor3 = ColorFondo
    Tarjeta.BorderColor3 = Colores.BordeTarjeta
    Tarjeta.BorderSizePixel = 2
    Tarjeta.Position = UDim2.new(0.5, -267, 0, PosY)  -- Ajustado para nuevo ancho
    Tarjeta.Size = UDim2.new(1, -40, 0, 72)
    Instance.new("UICorner", Tarjeta).CornerRadius = UDim.new(0, 12)

    local Icon = Instance.new("TextLabel")
    Icon.Parent = Tarjeta
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 15, 0.5, -18)
    Icon.Size = UDim2.new(0, 36, 0, 36)
    Icon.Font = Enum.Font.GothamBold
    Icon.Text = Icono
    Icon.TextColor3 = Colores.Texto
    Icon.TextSize = 26

    local TituloTarjeta = Instance.new("TextLabel")
    TituloTarjeta.Parent = Tarjeta
    TituloTarjeta.BackgroundTransparency = 1
    TituloTarjeta.Position = UDim2.new(0, 65, 0.5, -10)
    TituloTarjeta.Size = UDim2.new(0, 260, 0, 20)
    TituloTarjeta.Font = Enum.Font.GothamBold
    TituloTarjeta.Text = Texto
    TituloTarjeta.TextColor3 = Colores.Texto
    TituloTarjeta.TextSize = 17

    local Desc = Instance.new("TextLabel")
    Desc.Parent = Tarjeta
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0, 65, 0.5, 8)
    Desc.Size = UDim2.new(0, 260, 0, 14)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = Descripcion
    Desc.TextColor3 = Colores.TextoGris
    Desc.TextSize = 12

    local BtnAbrir = Instance.new("TextButton")
    BtnAbrir.Parent = Tarjeta
    BtnAbrir.BackgroundColor3 = Colores.BotonRojo
    BtnAbrir.Position = UDim2.new(1, -100, 0.5, -18)
    BtnAbrir.Size = UDim2.new(0, 88, 0, 36)
    BtnAbrir.Font = Enum.Font.GothamBold
    BtnAbrir.Text = "ABRIR"
    BtnAbrir.TextColor3 = Colores.Texto
    BtnAbrir.TextSize = 14
    BtnAbrir.AutoLocalize = false
    Instance.new("UICorner", BtnAbrir).CornerRadius = UDim.new(0, 10)

    return Tarjeta
end

-- 📋 TARJETAS — TODAS IGUALES
CrearTarjeta(70, Colores.TarjetaRoja, "Fast Glitch 90", "Script de pelea muy OP", "⚡")
CrearTarjeta(155, Colores.TarjetaOscura, "Public Training", "Script gratuito para Auto Farm", "🏋️")
CrearTarjeta(240, Colores.TarjetaOscura, "Auto Rebirths", "Renacimientos automáticos", "🔄")
CrearTarjeta(325, Colores.TarjetaOscura, "Killing", "Auto Kills + Server Hop", "🎯")
CrearTarjeta(410, Colores.TarjetaOscura, "Free Pet Shop", "¡Mascotas y auras gratis!", "🐾")

-- ❌ BOTÓN SALIR — AJUSTADO AL NUEVO ANCHO
local BtnSalir = Instance.new("TextButton")
BtnSalir.Parent = MainWindow
BtnSalir.BackgroundColor3 = Colores.BotonRojo
BtnSalir.Position = UDim2.new(0.5, -267, 0, 485)
BtnSalir.Size = UDim2.new(1, -40, 0, 55)
BtnSalir.Font = Enum.Font.GothamBold
BtnSalir.Text = "❌ SALIR"
BtnSalir.TextColor3 = Colores.Texto
BtnSalir.TextSize = 18
BtnSalir.AutoLocalize = false
Instance.new("UICorner", BtnSalir).CornerRadius = UDim.new(0, 12)

BtnSalir.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ✅ CONFIRMACIÓN
print("✅ GoldGuerrero Hub — Tamaño: 565×460px | CARGADO!")
