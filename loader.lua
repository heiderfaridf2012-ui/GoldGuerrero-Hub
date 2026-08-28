-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — SIN ÍCONO NINJA
--  ✅ 👁️ OJITO SIN FONDO → ABRE/CIERRA TODO
--  ✅ 📐 VENTANA MEDIANA 540×400 → OSCURITA, BONITA
--  ✅ 📜 BARRA LATERAL DESLIZANTE → TODAS LAS OPCIONES
--  ✅ ❌ SIN ÍCONO NINJA → SOLO TÍTULO LIMPIO
--  ✅ 🏠 TU NOMBRE COMO CREADOR + CRÉDITOS
--  ✅ 🪟 BOTONES − × → LIMPIOS
--  ✅ 📅 PREPARADO PARA ACTUALIZACIÓN 05/09
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

-- 🎨 COLORES — OSCURITOS Y BONITOS
local Colores = {
    FondoVentana = Color3.fromRGB(26, 26, 32),
    FondoBarraLateral = Color3.fromRGB(18, 18, 22),
    FondoBotonActivo = Color3.fromRGB(42, 42, 55),
    Borde = Color3.fromRGB(55, 55, 70),
    AcentoAzul = Color3.fromRGB(55, 150, 255),
    AcentoRojo = Color3.fromRGB(220, 50, 50),
    Texto = Color3.fromRGB(255, 255, 255),
    TextoGris = Color3.fromRGB(150, 150, 170)
}

-- 👁️ OJITO — SIN FONDO, SIEMPRE VISIBLE ✅
local BtnOjo = Instance.new("TextButton")
BtnOjo.Parent = ScreenGui
BtnOjo.BackgroundTransparency = 1
BtnOjo.Position = UDim2.new(0.5, -22, 0.5, -22)
BtnOjo.Size = UDim2.new(0, 44, 0, 44)
BtnOjo.Font = Enum.Font.GothamBold
BtnOjo.Text = "👁️"
BtnOjo.TextColor3 = Colores.Texto
BtnOjo.TextSize = 32
BtnOjo.Active = true
BtnOjo.Draggable = true

-- 📦 VENTANA PRINCIPAL — MEDIANA 540×400 ✅
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Parent = ScreenGui
MainWindow.BackgroundColor3 = Colores.FondoVentana
MainWindow.BorderColor3 = Colores.Borde
MainWindow.BorderSizePixel = 2
MainWindow.Position = UDim2.new(0.5, -270, 0.5, -200)
MainWindow.Size = UDim2.new(0, 540, 0, 400)
MainWindow.Active = true
MainWindow.Draggable = true
MainWindow.Visible = false
Instance.new("UICorner", MainWindow).CornerRadius = UDim.new(0, 10)

-- 🔄 ABRIR/CIERRA CON EL OJITO ✅
local MenuAbierto = false
BtnOjo.MouseButton1Click:Connect(function()
    MenuAbierto = not MenuAbierto
    MainWindow.Visible = MenuAbierto
    BtnOjo.Text = MenuAbierto and "🙈" or "👁️"
end)

-- 🏷️ TÍTULO LIMPIO — ARRIBA IZQUIERDA, SIN ÍCONO NINJA ✅
local Titulo = Instance.new("TextLabel")
Titulo.Parent = MainWindow
Titulo.BackgroundTransparency = 1
Titulo.Position = UDim2.new(0, 15, 0, 12)
Titulo.Size = UDim2.new(0, 250, 0, 22)
Titulo.Font = Enum.Font.GothamBold
Titulo.Text = "GoldGuerrero Hub"
Titulo.TextColor3 = Colores.Texto
Titulo.TextSize = 16

-- 🪟 BOTONES − × → SIN CUADRADO ✅
local BtnMin = Instance.new("TextButton")
BtnMin.Parent = MainWindow
BtnMin.BackgroundTransparency = 1
BtnMin.Position = UDim2.new(1, -65, 0, 8)
BtnMin.Size = UDim2.new(0, 20, 0, 20)
BtnMin.Font = Enum.Font.GothamBold
BtnMin.Text = "−"
BtnMin.TextColor3 = Colores.TextoGris
BtnMin.TextSize = 18

local BtnCerrar = Instance.new("TextButton")
BtnCerrar.Parent = MainWindow
BtnCerrar.BackgroundTransparency = 1
BtnCerrar.Position = UDim2.new(1, -35, 0, 8)
BtnCerrar.Size = UDim2.new(0, 20, 0, 20)
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
Separador.Position = UDim2.new(0, 0, 0, 45)
Separador.Size = UDim2.new(1, 0, 0, 1)

-- 📜 BARRA LATERAL DESLIZANTE → TODAS LAS OPCIONES ✅
local BarraLateral = Instance.new("ScrollingFrame")
BarraLateral.Parent = MainWindow
BarraLateral.BackgroundColor3 = Colores.FondoBarraLateral
BarraLateral.Position = UDim2.new(0, 0, 0, 46)
BarraLateral.Size = UDim2.new(0, 140, 1, -46)
BarraLateral.CanvasSize = UDim2.new(0, 0, 0, 450)
BarraLateral.ScrollBarThickness = 4
BarraLateral.ScrollBarColor3 = Colores.AcentoAzul
BarraLateral.ScrollBarPosition = Enum.ScrollBarPosition.Right

local Contenedor = Instance.new("Frame")
Contenedor.Parent = BarraLateral
Contenedor.BackgroundTransparency = 1
Contenedor.Size = UDim2.new(1, -8, 0, 440)

local Layout = Instance.new("UIListLayout")
Layout.Parent = Contenedor
Layout.Padding = UDim.new(0, 4)

-- 📄 ÁREA DE CONTENIDO
local AreaContenido = Instance.new("Frame")
AreaContenido.Parent = MainWindow
AreaContenido.BackgroundTransparency = 1
AreaContenido.Position = UDim2.new(0, 145, 0, 46)
AreaContenido.Size = UDim2.new(1, -150, 1, -46)

-- Título de contenido
local TituloContenido = Instance.new("TextLabel")
TituloContenido.Parent = AreaContenido
TituloContenido.BackgroundTransparency = 1
TituloContenido.Position = UDim2.new(0, 15, 0, 10)
TituloContenido.Size = UDim2.new(0, 300, 0, 28)
TituloContenido.Font = Enum.Font.GothamBold
TituloContenido.Text = "🏠 Main"
TituloContenido.TextColor3 = Colores.Texto
TituloContenido.TextSize = 22

-- 📝 CRÉDITOS EN MAIN — TU NOMBRE PRIMERO ✅
local TextoContenido = Instance.new("TextLabel")
TextoContenido.Parent = AreaContenido
TextoContenido.BackgroundTransparency = 1
TextoContenido.Position = UDim2.new(0, 15, 0, 50)
TextoContenido.Size = UDim2.new(0, 350, 0, 300)
TextoContenido.Font = Enum.Font.Gotham
TextoContenido.Text = [[
══════════════════════════
⚔️  Creado por: GoldGuerrero
💚  Gracias a: Dola (por la guía y ayuda)
══════════════════════════

📌 Versión: 1.0.0
🎮 Juego: Muscle Legends
📅 Preparado para actualización: 05/09/2026

Selecciona una opción de la barra lateral ⬅️
para ver las funciones disponibles.
]]
TextoContenido.TextColor3 = Colores.TextoGris
TextoContenido.TextSize = 14
TextoContenido.TextWrapped = true
TextoContenido.TextXAlignment = Enum.TextXAlignment.Left

-- 📦 FUNCIÓN BOTONES LATERALES
local Botones = {}
local CategoriaActiva = nil

local function CrearBoton(Nombre, Icono, TextoPanel)
    local Btn = Instance.new("TextButton")
    Btn.Parent = Contenedor
    Btn.BackgroundTransparency = 1
    Btn.Size = UDim2.new(1, 0, 0, 36)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = "  " .. Icono .. "  " .. Nombre
    Btn.TextColor3 = Colores.TextoGris
    Btn.TextSize = 12
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
        TextoContenido.Text = TextoPanel
    end)
end

-- 📋 TODAS LAS CATEGORÍAS — DESLIZANTES ✅
CrearBoton("Main", "🏠", [[
══════════════════════════
⚔️  Creado por: GoldGuerrero
💚  Gracias a: Dola (por la guía y ayuda)
══════════════════════════

📌 Versión: 1.0.0
🎮 Juego: Muscle Legends
📅 Preparado para: 05/09/2026
]])

CrearBoton("Auto Entrenamiento", "🏋️", [[
🏋️ Auto Entrenamiento
══════════════════════════
Selecciona el ejercicio:
• Pesas pequeñas
• Pesas medianas
• Pesas grandes
• Entrenamiento alto
• Portales de entrenamiento
• Todos los ejercicios

⚡ Auto farmear fuerza según el ejercicio.
]])

CrearBoton("Fast Glitch 90", "⚡", [[
⚡ Fast Glitch 90
══════════════════════════
• Velocidad de pelea: 90%
• Auto unirse a peleas
• Auto farmear peleas
• Teletransportar a portales de pelea
• Modo automático / manual
]])

CrearBoton("Teletransport", "🌍", [[
🌍 Teletransport — Gimnasios
══════════════════════════
• Gimnasio inicial
• Gimnasio de piedra
• Gimnasio de hierro
• Gimnasio de oro
• Gimnasio de diamante
• Gimnasio de maestro
• ¡Todos SIN REQUISITOS! 1 clic ✅
]])

CrearBoton("Mascotas", "🐾", [[
🐾 Mascotas y Auras
══════════════════════════
• Lista completa de mascotas
• Auto equipar mejor mascota
• Auras gratis
• Multiplicadores de ganancia
• Tienda de mascotas
]])

CrearBoton("Auto Renacimiento", "🔄", [[
🔄 Auto Renacimiento
══════════════════════════
• Renacer automáticamente
• Mínimo de fuerza para renacer
• Mantener mascotas al renacer
• Mantener pesas al renacer
• Notificación al renacer
]])

CrearBoton("Killer / PvP", "🗡️", [[
🗡️ Killer / PvP
══════════════════════════
• Auto atacar jugadores cercanos
• Rango de detección
• Ignorar amigos
• Auto teletransportar al objetivo
• Modo sigiloso
]])

CrearBoton("Ajustes", "⚙️", [[
⚙️ Ajustes del Hub
══════════════════════════
• Tamaño de ventana
• Tema: Oscuro / Claro
• Notificaciones: On/Off
• Sonidos: On/Off
• Reiniciar configuración
]])

CrearBoton("Misceláneos", "🔧", [[
🔧 Misceláneos
══════════════════════════
• Velocidad de movimiento
• Salto alto
• No caer
• Tiempo de pelea
• Visualización de estadísticas
]])

CrearBoton("Actualización", "📅", [[
📅 Próxima actualización
══════════════════════════
Fecha estimada: 05/09/2026
• Nuevos gimnasios
• Nuevas mascotas
• Nuevos ejercicios
• Mejoras de rendimiento
• ¡Mantente atento! 👀
]])

-- ✅ ACTIVAR MAIN POR DEFECTO
task.wait(0.1)
if Botones["Main"] then
    Botones["Main"].BackgroundColor3 = Colores.FondoBotonActivo
    Botones["Main"].TextColor3 = Colores.Texto
    CategoriaActiva = "Main"
end

-- ✅ CONFIRMACIÓN
print("========================================")
print("✅ GOLD GUERRERO HUB — SIN ÍCONO NINJA")
print("⚔️ Creado por: GoldGuerrero")
print("💚 Gracias a: Dola (por la guía y ayuda)")
print("📐 Tamaño mediano 540×400 — limpio y bonito")
print("📜 Barra deslizante — TODAS las opciones")
print("👁️ Ojito sin fondo — abre/cierra")
print("========================================")
