-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — TU ESTILO PROPIO
--  ✅ 👁️ OJO SOLO ÍCONO → SIN FONDO, SIN CUADRADO, SIN BORDES
--  ✅ 📍 OJO ARRIBA A LA IZQUIERDA (ESQUINA)
--  ✅ 📂 Barra lateral con scroll → TUS categorías
--  ✅ 📄 Área de contenido → TODO VISIBLE, NUNCA VACÍO
--  ✅ 🪟 Botones − □ × | Todo en ESPAÑOL
--  ✅ Empieza OCULTO → SOLO EL OJO AL CARGAR
--  ✅ ESTILO PROPIO → NO COPIA DE NADIE
-- ==================================================

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- ✅ Borra duplicados
if PlayerGui:FindFirstChild("GoldGuerreroHub") then
    PlayerGui.GoldGuerreroHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🎨 TUS COLORES
local Colores = {
    FondoVentana = Color3.fromRGB(24, 24, 28),
    FondoBarraLateral = Color3.fromRGB(16, 16, 20),
    FondoBotonActivo = Color3.fromRGB(36, 36, 46),
    Borde = Color3.fromRGB(45, 45, 55),
    AcentoAzul = Color3.fromRGB(45, 130, 255),
    AcentoRojo = Color3.fromRGB(210, 40, 40),
    Texto = Color3.fromRGB(255, 255, 255),
    TextoGris = Color3.fromRGB(150, 150, 160)
}

-- 👁️ OJO LIMPIO — SIN FONDO, SIN CUADRADO
local BtnOjo = Instance.new("TextButton")
BtnOjo.Parent = ScreenGui
BtnOjo.BackgroundTransparency = 1 -- ✅ SIN FONDO
BtnOjo.Position = UDim2.new(0, 15, 0, 15) -- ✅ ARRIBA A LA IZQUIERDA
BtnOjo.Size = UDim2.new(0, 35, 0, 35)
BtnOjo.Font = Enum.Font.GothamBold
BtnOjo.Text = "👁️"
BtnOjo.TextSize = 28
BtnOjo.Active = true
BtnOjo.Draggable = true

-- 📦 VENTANA PRINCIPAL
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Parent = ScreenGui
MainWindow.BackgroundColor3 = Colores.FondoVentana
MainWindow.BorderColor3 = Colores.Borde
MainWindow.BorderSizePixel = 2
MainWindow.Position = UDim2.new(0.5, -300, 0.5, -220)
MainWindow.Size = UDim2.new(0, 600, 0, 440)
MainWindow.Active = true
MainWindow.Draggable = true
MainWindow.Visible = false -- ✅ EMPIEZA OCULTA
Instance.new("UICorner", MainWindow).CornerRadius = UDim.new(0, 12)

-- 🔄 ABRIR/OCULTAR CON EL OJO
local MenuAbierto = false
BtnOjo.MouseButton1Click:Connect(function()
    MenuAbierto = not MenuAbierto
    MainWindow.Visible = MenuAbierto
    BtnOjo.Text = MenuAbierto and "🙈" or "👁️"
end)

-- 🏷️ TÍTULO
local Titulo = Instance.new("TextLabel")
Titulo.Parent = MainWindow
Titulo.BackgroundTransparency = 1
Titulo.Position = UDim2.new(0, 15, 0, 8)
Titulo.Size = UDim2.new(0, 200, 0, 24)
Titulo.Font = Enum.Font.GothamBold
Titulo.Text = "GoldGuerrero Hub"
Titulo.TextColor3 = Colores.Texto
Titulo.TextSize = 16

-- 🪟 BOTONES DE VENTANA
local BtnMin = Instance.new("TextButton")
BtnMin.Parent = MainWindow
BtnMin.BackgroundTransparency = 1
BtnMin.Position = UDim2.new(1, -90, 0, 5)
BtnMin.Size = UDim2.new(0, 25, 0, 25)
BtnMin.Font = Enum.Font.GothamBold
BtnMin.Text = "−"
BtnMin.TextColor3 = Colores.Texto
BtnMin.TextSize = 18

local BtnMax = Instance.new("TextButton")
BtnMax.Parent = MainWindow
BtnMax.BackgroundTransparency = 1
BtnMax.Position = UDim2.new(1, -60, 0, 5)
BtnMax.Size = UDim2.new(0, 25, 0, 25)
BtnMax.Font = Enum.Font.GothamBold
BtnMax.Text = "□"
BtnMax.TextColor3 = Colores.Texto
BtnMax.TextSize = 14

local BtnCerrar = Instance.new("TextButton")
BtnCerrar.Parent = MainWindow
BtnCerrar.BackgroundTransparency = 1
BtnCerrar.Position = UDim2.new(1, -30, 0, 5)
BtnCerrar.Size = UDim2.new(0, 25, 0, 25)
BtnCerrar.Font = Enum.Font.GothamBold
BtnCerrar.Text = "×"
BtnCerrar.TextColor3 = Colores.AcentoRojo
BtnCerrar.TextSize = 20
BtnCerrar.MouseButton1Click:Connect(function()
    MainWindow.Visible = false
    MenuAbierto = false
    BtnOjo.Text = "👁️"
end)

-- 📏 LÍNEA SEPARADORA
local Separador = Instance.new("Frame")
Separador.Parent = MainWindow
Separador.BackgroundColor3 = Colores.Borde
Separador.Position = UDim2.new(0, 0, 0, 35)
Separador.Size = UDim2.new(1, 0, 0, 1)

-- 📂 BARRA LATERAL CON SCROLL
local BarraLateral = Instance.new("ScrollingFrame")
BarraLateral.Parent = MainWindow
BarraLateral.BackgroundColor3 = Colores.FondoBarraLateral
BarraLateral.Position = UDim2.new(0, 0, 0, 36)
BarraLateral.Size = UDim2.new(0, 160, 1, -36)
BarraLateral.CanvasSize = UDim2.new(0, 0, 0, 320)
BarraLateral.ScrollBarThickness = 4
BarraLateral.ScrollBarColor3 = Colores.AcentoAzul
BarraLateral.ScrollBarPosition = Enum.ScrollBarPosition.Right

local Contenedor = Instance.new("Frame")
Contenedor.Parent = BarraLateral
Contenedor.BackgroundTransparency = 1
Contenedor.Size = UDim2.new(1, -8, 0, 300)

local Layout = Instance.new("UIListLayout")
Layout.Parent = Contenedor
Layout.Padding = UDim.new(0, 5)

-- 📄 ÁREA DE CONTENIDO
local AreaContenido = Instance.new("Frame")
AreaContenido.Parent = MainWindow
AreaContenido.BackgroundTransparency = 1
AreaContenido.Position = UDim2.new(0, 160, 0, 36)
AreaContenido.Size = UDim2.new(1, -160, 1, -36)

-- Título de contenido
local TituloContenido = Instance.new("TextLabel")
TituloContenido.Parent = AreaContenido
TituloContenido.BackgroundTransparency = 1
TituloContenido.Position = UDim2.new(0, 20, 0, 15)
TituloContenido.Size = UDim2.new(0, 300, 0, 30)
TituloContenido.Font = Enum.Font.GothamBold
TituloContenido.Text = "🏠 Información"
TituloContenido.TextColor3 = Colores.Texto
TituloContenido.TextSize = 22

-- Texto de bienvenida
local TextoInfo = Instance.new("TextLabel")
TextoInfo.Parent = AreaContenido
TextoInfo.BackgroundTransparency = 1
TextoInfo.Position = UDim2.new(0, 20, 0, 55)
TextoInfo.Size = UDim2.new(0, 350, 0, 100)
TextoInfo.Font = Enum.Font.Gotham
TextoInfo.Text = "¡Bienvenido a tu propio hub!\n\nSelecciona una categoría de la barra lateral\npara ver las opciones disponibles."
TextoInfo.TextColor3 = Colores.TextoGris
TextoInfo.TextSize = 14
TextoInfo.TextWrapped = true
TextoInfo.TextXAlignment = Enum.TextXAlignment.Left

-- 📦 FUNCIÓN BOTONES
local Botones = {}
local CategoriaActiva = nil

local function CrearBoton(Nombre, Icono)
    local Btn = Instance.new("TextButton")
    Btn.Parent = Contenedor
    Btn.BackgroundTransparency = 1
    Btn.Size = UDim2.new(1, 0, 0, 38)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = "  " .. Icono .. "  " .. Nombre
    Btn.TextColor3 = Colores.TextoGris
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.AutoLocalize = false

    Botones[Nombre] = Btn

    Btn.MouseButton1Click:Connect(function()
        if CategoriaActiva then
            Botones[CategoriaActiva].BackgroundColor3 = Color3.fromRGB(0,0,0,0)
            Botones[CategoriaActiva].TextColor3 = Colores.TextoGris
        end
        CategoriaActiva = Nombre
        Btn.BackgroundColor3 = Colores.FondoBotonActivo
        Btn.TextColor3 = Colores.Texto
        TituloContenido.Text = Icono .. " " .. Nombre
    end)
end

-- 📋 TUS CATEGORÍAS
CrearBoton("Información", "ℹ️")
CrearBoton("Principal", "🏠")
CrearBoton("Auto Entrenamiento", "🏋️")
CrearBoton("Fast Glitch 90", "⚡")
CrearBoton("Renacimientos", "🔄")
CrearBoton("Mascotas", "🐾")
CrearBoton("Asesino", "🗡️")
CrearBoton("Ajustes", "⚙️")

-- ✅ ACTIVAR POR DEFECTO
task.wait(0.1)
if Botones["Información"] then
    Botones["Información"].BackgroundColor3 = Colores.FondoBotonActivo
    Botones["Información"].TextColor3 = Colores.Texto
    CategoriaActiva = "Información"
end

-- ✅ CONFIRMACIÓN
print("========================================")
print("✅ GOLD GUERRERO HUB — TU ESTILO PROPIO ✅")
print("👁️ OJO LIMPIO SIN FONDO | ESQUINA SUPERIOR IZQUIERDA")
print("📂 Barra lateral con scroll | 8 categorías")
print("📄 Área de contenido SIEMPRE VISIBLE")
print("🎨 TU DISEÑO, TU ESTILO, TU NOMBRE")
print("========================================")
