-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — VERSIÓN DEFINITIVA
--  ✅ 👁️ OJO → AL DAR CLIC ABRE/OCULTA TODO EL MENÚ
--  ✅ Barra Lateral CON BARRA DESLIZANTE → TODAS LAS CATEGORÍAS
--  ✅ Área de contenido a la derecha | Botones − □ ×
--  ✅ Categorías: Información, Principal, Auto Entrenamiento, Fast Glitch 90,
--     Auto Renacimiento, Mascotas, Asesino, Ajustes
--  ✅ Empieza OCULTO → SOLO SE VE EL OJO AL CARGAR
--  ✅ Diseño oscuro moderno | Todo en ESPAÑOL | PlayerGui ✅ MÓVIL
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

-- 🎨 COLORES ESTILO MODERNO
local Colores = {
    FondoVentana = Color3.fromRGB(30, 30, 35),
    FondoBarraLateral = Color3.fromRGB(22, 22, 26),
    FondoBotonActivo = Color3.fromRGB(45, 45, 55),
    Borde = Color3.fromRGB(60, 60, 70),
    AcentoAzul = Color3.fromRGB(40, 120, 240),
    AcentoRojo = Color3.fromRGB(200, 0, 0),
    Texto = Color3.fromRGB(255, 255, 255),
    TextoGris = Color3.fromRGB(160, 160, 170),
    Separador = Color3.fromRGB(50, 50, 60)
}

-- 👁️ BOTÓN DEL OJO — SIEMPRE VISIBLE, ABRE/OCULTA EL MENÚ
local BtnOjo = Instance.new("TextButton")
BtnOjo.Parent = ScreenGui
BtnOjo.BackgroundColor3 = Colores.FondoBarraLateral
BtnOjo.BorderColor3 = Colores.AcentoAzul
BtnOjo.BorderSizePixel = 2
BtnOjo.Position = UDim2.new(0.5, -25, 0.5, -25)
BtnOjo.Size = UDim2.new(0, 50, 0, 50)
BtnOjo.Font = Enum.Font.GothamBold
BtnOjo.Text = "👁️"
BtnOjo.TextSize = 28
BtnOjo.Active = true
BtnOjo.Draggable = true
Instance.new("UICorner", BtnOjo).CornerRadius = UDim.new(0, 12)

-- 📦 VENTANA PRINCIPAL — EMPIEZA OCULTA
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

-- 🔄 FUNCIÓN MOSTRAR/OCULTAR CON EL OJO
local MenuAbierto = false
BtnOjo.MouseButton1Click:Connect(function()
    MenuAbierto = not MenuAbierto
    MainWindow.Visible = MenuAbierto
    BtnOjo.Text = MenuAbierto and "🙈" or "👁️"
end)

-- 🏷️ TÍTULO DE LA VENTANA
local TituloVentana = Instance.new("TextLabel")
TituloVentana.Parent = MainWindow
TituloVentana.BackgroundTransparency = 1
TituloVentana.Position = UDim2.new(0, 15, 0, 8)
TituloVentana.Size = UDim2.new(0, 180, 0, 24)
TituloVentana.Font = Enum.Font.GothamBold
TituloVentana.Text = "GoldGuerrero Hub"
TituloVentana.TextColor3 = Colores.Texto
TituloVentana.TextSize = 16

-- 🪟 BOTONES DE VENTANA − □ ×
local BtnMinimizar = Instance.new("TextButton")
BtnMinimizar.Parent = MainWindow
BtnMinimizar.BackgroundTransparency = 1
BtnMinimizar.Position = UDim2.new(1, -90, 0, 5)
BtnMinimizar.Size = UDim2.new(0, 25, 0, 25)
BtnMinimizar.Font = Enum.Font.GothamBold
BtnMinimizar.Text = "−"
BtnMinimizar.TextColor3 = Colores.Texto
BtnMinimizar.TextSize = 18

local BtnMaximizar = Instance.new("TextButton")
BtnMaximizar.Parent = MainWindow
BtnMaximizar.BackgroundTransparency = 1
BtnMaximizar.Position = UDim2.new(1, -60, 0, 5)
BtnMaximizar.Size = UDim2.new(0, 25, 0, 25)
BtnMaximizar.Font = Enum.Font.GothamBold
BtnMaximizar.Text = "□"
BtnMaximizar.TextColor3 = Colores.Texto
BtnMaximizar.TextSize = 14

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
Separador.BackgroundColor3 = Colores.Separador
Separador.Position = UDim2.new(0, 0, 0, 35)
Separador.Size = UDim2.new(1, 0, 0, 1)

-- 📂 BARRA LATERAL CON BARRA DESLIZANTE ✅
local BarraLateral = Instance.new("ScrollingFrame")
BarraLateral.Name = "BarraLateral"
BarraLateral.Parent = MainWindow
BarraLateral.BackgroundColor3 = Colores.FondoBarraLateral
BarraLateral.Position = UDim2.new(0, 0, 0, 36)
BarraLateral.Size = UDim2.new(0, 160, 1, -36)
BarraLateral.CanvasSize = UDim2.new(0, 0, 0, 360)
BarraLateral.ScrollBarThickness = 4
BarraLateral.ScrollBarColor3 = Colores.AcentoAzul
BarraLateral.ScrollBarPosition = Enum.ScrollBarPosition.Right
BarraLateral.ScrollingEnabled = true

-- Contenedor de botones de categorías
local ContenedorCategorias = Instance.new("Frame")
ContenedorCategorias.Parent = BarraLateral
ContenedorCategorias.BackgroundTransparency = 1
ContenedorCategorias.Size = UDim2.new(1, -8, 0, 360)

local LayoutCategorias = Instance.new("UIListLayout")
LayoutCategorias.Parent = ContenedorCategorias
LayoutCategorias.Padding = UDim.new(0, 5)
LayoutCategorias.HorizontalAlignment = Enum.HorizontalAlignment.Center
LayoutCategorias.FillDirection = Enum.FillDirection.Vertical

-- 📄 ÁREA DE CONTENIDO A LA DERECHA
local AreaContenido = Instance.new("Frame")
AreaContenido.Name = "AreaContenido"
AreaContenido.Parent = MainWindow
AreaContenido.BackgroundTransparency = 1
AreaContenido.Position = UDim2.new(0, 160, 0, 36)
AreaContenido.Size = UDim2.new(1, -160, 1, -36)

-- 📦 PANELES DE CONTENIDO (cada categoría tiene su panel)
local Paneles = {}
local Botones = {}
local CategoriaActiva = nil

-- Función para crear paneles
local function CrearPanel(Nombre)
    local Panel = Instance.new("ScrollingFrame")
    Panel.Name = Nombre
    Panel.Parent = AreaContenido
    Panel.BackgroundTransparency = 1
    Panel.Position = UDim2.new(0, 20, 0, 10)
    Panel.Size = UDim2.new(1, -40, 1, -20)
    Panel.CanvasSize = UDim2.new(0, 0, 0, 500)
    Panel.ScrollBarThickness = 4
    Panel.ScrollBarColor3 = Colores.AcentoAzul
    Panel.Visible = false

    local Contenido = Instance.new("Frame")
    Contenido.Parent = Panel
    Contenido.BackgroundTransparency = 1
    Contenido.Size = UDim2.new(1, -12, 0, 0)
    Contenido.AutomaticSize = Enum.AutomaticSize.Y

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = Contenido
    Layout.Padding = UDim.new(0, 12)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    Layout.FillDirection = Enum.FillDirection.Vertical

    -- Título del panel
    local TituloPanel = Instance.new("TextLabel")
    TituloPanel.Parent = Contenido
    TituloPanel.BackgroundTransparency = 1
    TituloPanel.Size = UDim2.new(1, 0, 0, 30)
    TituloPanel.Font = Enum.Font.GothamBold
    TituloPanel.Text = Nombre
    TituloPanel.TextColor3 = Colores.Texto
    TituloPanel.TextSize = 22
    TituloPanel.TextXAlignment = Enum.TextXAlignment.Left

    Paneles[Nombre] = {Panel = Panel, Contenido = Contenido}
    return Paneles[Nombre]
end

-- Función para crear botón de categoría
local function CrearBotonCategoria(Nombre, Icono)
    local Btn = Instance.new("TextButton")
    Btn.Parent = ContenedorCategorias
    Btn.BackgroundTransparency = 1
    Btn.Size = UDim2.new(1, 0, 0, 40)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = "  " .. Icono .. "  " .. Nombre
    Btn.TextColor3 = Colores.TextoGris
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.AutoLocalize = false

    Botones[Nombre] = Btn

    Btn.MouseButton1Click:Connect(function()
        -- Restaurar botón anterior
        if CategoriaActiva then
            Botones[CategoriaActiva].BackgroundColor3 = Color3.fromRGB(0,0,0,0)
            Botones[CategoriaActiva].TextColor3 = Colores.TextoGris
            Paneles[CategoriaActiva].Panel.Visible = false
        end
        -- Activar nuevo
        CategoriaActiva = Nombre
        Btn.BackgroundColor3 = Colores.FondoBotonActivo
        Btn.TextColor3 = Colores.Texto
        Paneles[Nombre].Panel.Visible = true
    end)

    return Btn
end

-- 📋 CREAR TODAS LAS CATEGORÍAS Y PANELES
CrearPanel("ℹ️ Información")
CrearPanel("🏠 Principal")
CrearPanel("🏋️ Auto Entrenamiento")
CrearPanel("⚡ Fast Glitch 90")
CrearPanel("🔄 Auto Renacimiento")
CrearPanel("🐾 Mascotas")
CrearPanel("🗡️ Asesino")
CrearPanel("⚙️ Ajustes")

CrearBotonCategoria("ℹ️ Información", "ℹ️")
CrearBotonCategoria("🏠 Principal", "🏠")
CrearBotonCategoria("🏋️ Auto Entrenamiento", "🏋️")
CrearBotonCategoria("⚡ Fast Glitch 90", "⚡")
CrearBotonCategoria("🔄 Auto Renacimiento", "🔄")
CrearBotonCategoria("🐾 Mascotas", "🐾")
CrearBotonCategoria("🗡️ Asesino", "🗡️")
CrearBotonCategoria("⚙️ Ajustes", "⚙️")

-- ✅ ACTIVAR PANEL POR DEFECTO AL ABRIR
task.wait(0.1)
if Botones["ℹ️ Información"] then
    Botones["ℹ️ Información"].BackgroundColor3 = Colores.FondoBotonActivo
    Botones["ℹ️ Información"].TextColor3 = Colores.Texto
    Paneles["ℹ️ Información"].Panel.Visible = true
    CategoriaActiva = "ℹ️ Información"
end

-- ✅ CONFIRMACIÓN
print("========================================")
print("✅ GOLD GUERRERO HUB — VERSIÓN DEFINITIVA ✅")
print("👁️ Ojo para abrir/ocultar | Barra deslizante")
print("📂 8 Categorías | Estilo moderno oscuro")
print("📱 Optimizado para MÓVIL | Todo en ESPAÑOL")
print("========================================")
