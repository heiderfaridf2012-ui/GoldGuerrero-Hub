-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — LETRAS CLARAS ✅
--  ✅ 🔤 SIN LETRAS RARAS — TODO EN ESPAÑOL, FUENTE LIMPIA
--  ✅ ❌ SIN ÍCONO NINJA — SOLO TU NOMBRE ARRIBA
--  ✅ 📐 560×360 — COMPACTA, NO TAPA EL JUEGO
--  ✅ 📂 BARRA LATERAL — TEXTO COMPLETO, SIN CORTAR
--  ✅ ⬛ CUADRITOS CON FLECHA › — IGUAL A LA IMAGEN
--  ✅ 👁️ OJO 👁️ — ABRE/CIERRA, SIEMPRE IGUAL
--  ✅ 📅 PREPARADO PARA 05/09/2026
-- ==================================================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ✅ Borra duplicados
if PlayerGui:FindFirstChild("GoldGuerreroHub") then
    PlayerGui.GoldGuerreroHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🎨 COLORES
local Colores = {
    FondoVentana = Color3.fromRGB(20, 20, 28),
    FondoBarraLateral = Color3.fromRGB(15, 15, 22),
    FondoBotonActivo = Color3.fromRGB(35, 35, 50),
    FondoBotonDerecha = Color3.fromRGB(30, 30, 42),
    Borde = Color3.fromRGB(50, 50, 70),
    AcentoAzul = Color3.fromRGB(60, 140, 255),
    AcentoRojo = Color3.fromRGB(220, 50, 50),
    Texto = Color3.fromRGB(255, 255, 255),
    TextoGris = Color3.fromRGB(150, 150, 170)
}

-- 👁️ OJITO — SIEMPRE 👁️ ✅
local BtnOjo = Instance.new("TextButton")
BtnOjo.Parent = ScreenGui
BtnOjo.BackgroundTransparency = 1
BtnOjo.Position = UDim2.new(0.5, -18, 0.5, -18)
BtnOjo.Size = UDim2.new(0, 36, 0, 36)
BtnOjo.Font = Enum.Font.GothamBold
BtnOjo.Text = "👁️"
BtnOjo.TextColor3 = Colores.Texto
BtnOjo.TextSize = 26
BtnOjo.Active = true
BtnOjo.Draggable = true

-- 📦 VENTANA — 560×360 → COMPACTA ✅
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Parent = ScreenGui
MainWindow.BackgroundColor3 = Colores.FondoVentana
MainWindow.BorderColor3 = Colores.Borde
MainWindow.BorderSizePixel = 1
MainWindow.Position = UDim2.new(0.5, -280, 0.5, -180)
MainWindow.Size = UDim2.new(0, 560, 0, 360)
MainWindow.Active = true
MainWindow.Draggable = true
MainWindow.Visible = false
Instance.new("UICorner", MainWindow).CornerRadius = UDim.new(0, 8)

-- 🔄 ABRIR/CIERRA CON EL OJITO ✅
local MenuAbierto = false
BtnOjo.MouseButton1Click:Connect(function()
    MenuAbierto = not MenuAbierto
    MainWindow.Visible = MenuAbierto
end)

-- 🏷️ TÍTULO — SIN ÍCONO NINJA ✅ SOLO TU NOMBRE
local TituloVentana = Instance.new("TextLabel")
TituloVentana.Parent = MainWindow
TituloVentana.BackgroundTransparency = 1
TituloVentana.Position = UDim2.new(0, 15, 0, 10)
TituloVentana.Size = UDim2.new(0, 200, 0, 22)
TituloVentana.Font = Enum.Font.GothamBold
TituloVentana.Text = "GoldGuerrero Hub"
TituloVentana.TextColor3 = Colores.Texto
TituloVentana.TextSize = 15

-- 🪟 BOTONES − □ × ✅
local BtnMin = Instance.new("TextButton")
BtnMin.Parent = MainWindow
BtnMin.BackgroundTransparency = 1
BtnMin.Position = UDim2.new(1, -80, 0, 8)
BtnMin.Size = UDim2.new(0, 18, 0, 18)
BtnMin.Font = Enum.Font.GothamBold
BtnMin.Text = "−"
BtnMin.TextColor3 = Colores.TextoGris
BtnMin.TextSize = 16
BtnMin.MouseButton1Click:Connect(function()
    MainWindow.Visible = false
    MenuAbierto = false
end)

local BtnSquare = Instance.new("TextButton")
BtnSquare.Parent = MainWindow
BtnSquare.BackgroundTransparency = 1
BtnSquare.Position = UDim2.new(1, -52, 0, 8)
BtnSquare.Size = UDim2.new(0, 18, 0, 18)
BtnSquare.Font = Enum.Font.GothamBold
BtnSquare.Text = "□"
BtnSquare.TextColor3 = Colores.TextoGris
BtnSquare.TextSize = 13

local BtnCerrar = Instance.new("TextButton")
BtnCerrar.Parent = MainWindow
BtnCerrar.BackgroundTransparency = 1
BtnCerrar.Position = UDim2.new(1, -25, 0, 8)
BtnCerrar.Size = UDim2.new(0, 18, 0, 18)
BtnCerrar.Font = Enum.Font.GothamBold
BtnCerrar.Text = "×"
BtnCerrar.TextColor3 = Colores.AcentoRojo
BtnCerrar.TextSize = 18
BtnCerrar.MouseButton1Click:Connect(function()
    MainWindow.Visible = false
    MenuAbierto = false
end)

-- 📏 LÍNEA SEPARADORA
local Separador = Instance.new("Frame")
Separador.Parent = MainWindow
Separador.BackgroundColor3 = Colores.Borde
Separador.Position = UDim2.new(0, 0, 0, 45)
Separador.Size = UDim2.new(1, 0, 0, 1)

-- 📂 BARRA LATERAL — MÁS ANCHA → TEXTO SIN CORTAR ✅
local BarraLateral = Instance.new("Frame")
BarraLateral.Parent = MainWindow
BarraLateral.BackgroundColor3 = Colores.FondoBarraLateral
BarraLateral.Position = UDim2.new(0, 0, 0, 46)
BarraLateral.Size = UDim2.new(0, 150, 1, -46)

local SeparadorVertical = Instance.new("Frame")
SeparadorVertical.Parent = MainWindow
SeparadorVertical.BackgroundColor3 = Colores.Borde
SeparadorVertical.Position = UDim2.new(0, 150, 0, 46)
SeparadorVertical.Size = UDim2.new(0, 1, 1, -46)

-- 📄 ÁREA DE CONTENIDO
local AreaContenido = Instance.new("Frame")
AreaContenido.Parent = MainWindow
AreaContenido.BackgroundTransparency = 1
AreaContenido.Position = UDim2.new(0, 155, 0, 46)
AreaContenido.Size = UDim2.new(1, -160, 1, -46)

-- Título de sección
local TituloSeccion = Instance.new("TextLabel")
TituloSeccion.Parent = AreaContenido
TituloSeccion.BackgroundTransparency = 1
TituloSeccion.Position = UDim2.new(0, 10, 0, 12)
TituloSeccion.Size = UDim2.new(0, 300, 0, 30)
TituloSeccion.Font = Enum.Font.GothamBold
TituloSeccion.Text = "🏠 Main"
TituloSeccion.TextColor3 = Colores.Texto
TituloSeccion.TextSize = 22

-- ⚙️ VARIABLES
local BotonesLateral = {}
local SeccionActiva = "Main"

-- 📦 FUNCIÓN BOTÓN LATERAL — TEXTO COMPLETO, SIN CORTAR ✅
local function CrearPestana(Nombre, Icono, ContenidoFunc)
    local Btn = Instance.new("TextButton")
    Btn.Parent = BarraLateral
    Btn.BackgroundTransparency = 1
    Btn.Size = UDim2.new(1, 0, 0, 40)
    Btn.Font = Enum.Font.Gotham -- ✅ FUENTE LIMPIA, SIN LETRAS RARAS
    Btn.Text = "  " .. Icono .. "  " .. Nombre -- ✅ ESPACIO SUFICIENTE → NO SE CORTA
    Btn.TextColor3 = Nombre == "Main" and Colores.Texto or Colores.TextoGris
    Btn.TextSize = 12 -- ✅ TAMAÑO PERFECTO → TODO SE VE CLARO
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.AutoLocalize = false

    local Barrita = Instance.new("Frame")
    Barrita.Parent = Btn
    Barrita.BackgroundColor3 = Nombre == "Main" and Colores.AcentoAzul or Color3.fromRGB(60,60,80)
    Barrita.Position = UDim2.new(0, 0, 0.5, -12)
    Barrita.Size = UDim2.new(0, 3, 0, 24)

    BotonesLateral[Nombre] = {Btn = Btn, Barrita = Barrita, Contenido = ContenidoFunc}

    Btn.MouseButton1Click:Connect(function()
        -- Restaurar anterior
        if BotonesLateral[SeccionActiva] then
            BotonesLateral[SeccionActiva].Btn.TextColor3 = Colores.TextoGris
            BotonesLateral[SeccionActiva].Barrita.BackgroundColor3 = Color3.fromRGB(60,60,80)
        end
        -- Activar actual
        SeccionActiva = Nombre
        Btn.TextColor3 = Colores.Texto
        Barrita.BackgroundColor3 = Colores.AcentoAzul
        TituloSeccion.Text = Icono .. " " .. Nombre
        -- Limpiar y cargar contenido
        for _, v in pairs(AreaContenido:GetChildren()) do
            if v ~= TituloSeccion then v:Destroy() end
        end
        ContenidoFunc()
    end)
end

-- 📦 FUNCIÓN BOTÓN DERECHO — CUADRITO CON FLECHA › ✅
local function CrearBotonDerecho(texto, funcion)
    local BtnFrame = Instance.new("Frame")
    BtnFrame.BackgroundColor3 = Colores.FondoBotonDerecha
    BtnFrame.BorderColor3 = Colores.Borde
    BtnFrame.BorderSizePixel = 1
    BtnFrame.Size = UDim2.new(1, -20, 0, 46)
    Instance.new("UICorner", BtnFrame).CornerRadius = UDim.new(0, 6)

    local TextoBtn = Instance.new("TextLabel")
    TextoBtn.Parent = BtnFrame
    TextoBtn.BackgroundTransparency = 1
    TextoBtn.Position = UDim2.new(0, 15, 0, 0)
    TextoBtn.Size = UDim2.new(0.85, 0, 1, 0)
    TextoBtn.Font = Enum.Font.Gotham
    TextoBtn.Text = texto
    TextoBtn.TextColor3 = Colores.Texto
    TextoBtn.TextSize = 13
    TextoBtn.TextXAlignment = Enum.TextXAlignment.Left

    local Flecha = Instance.new("TextLabel")
    Flecha.Parent = BtnFrame
    Flecha.BackgroundTransparency = 1
    Flecha.Position = UDim2.new(0.93, 0, 0, 0)
    Flecha.Size = UDim2.new(0, 16, 1, 0)
    Flecha.Font = Enum.Font.GothamBold
    Flecha.Text = "›"
    Flecha.TextColor3 = Colores.TextoGris
    Flecha.TextSize = 18

    local BtnClick = Instance.new("TextButton")
    BtnClick.Parent = BtnFrame
    BtnClick.BackgroundTransparency = 1
    BtnClick.Size = UDim2.new(1, 0, 1, 0)
    BtnClick.Text = ""
    BtnClick.MouseButton1Click:Connect(funcion)

    return BtnFrame
end

-- ==================================================
-- 📋 TODAS LAS SECCIONES — TODO EN ESPAÑOL ✅
-- ==================================================

-- 🏠 MAIN
CrearPestana("Main", "🏠", function()
    local Texto = Instance.new("TextLabel")
    Texto.Parent = AreaContenido
    Texto.BackgroundTransparency = 1
    Texto.Position = UDim2.new(0, 15, 0, 50)
    Texto.Size = UDim2.new(1, -30, 0, 280)
    Texto.Font = Enum.Font.Gotham
    Texto.Text = [[
══════════════════════════
⚔️  Creado por: GoldGuerrero
💚  Gracias a: Dola (guía y ayuda)
══════════════════════════

📌 Versión: 1.0.0
🎮 Juego: Muscle Legends
📅 Preparado para: 05/09/2026

Selecciona una opción de la barra ⬅️
]]
    Texto.TextColor3 = Colores.TextoGris
    Texto.TextSize = 13
    Texto.TextWrapped = true
    Texto.TextXAlignment = Enum.TextXAlignment.Left
end)

-- 🏋️ AUTO ENTRENAMIENTO
CrearPestana("Auto Entrenar", "🏋️", function()
    local y = 50
    local Opciones = {
        "Auto pesas pequeñas", "Auto pesas medianas",
        "Auto pesas grandes", "Auto entrenamiento alto",
        "Auto portal de fuerza", "Todos los ejercicios"
    }
    for _, opcion in pairs(Opciones) do
        local Btn = CrearBotonDerecho(opcion, function()
            print("[GoldGuerrero] Activado:", opcion)
        end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 10, 0, y)
        y += 52
    end
end)

-- ⚡ PELEAS
CrearPestana("Peleas", "⚡", function()
    local y = 50
    local Opciones = {
        "Auto unirse a peleas", "Auto farmear peleas",
        "Teletransportar a portal de pelea", "Modo automático"
    }
    for _, opcion in pairs(Opciones) do
        local Btn = CrearBotonDerecho(opcion, function()
            print("[GoldGuerrero] Activado:", opcion)
        end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 10, 0, y)
        y += 52
    end
end)

-- 🌍 TELETRANSPORT
CrearPestana("Teletransport", "🌍", function()
    local y = 50
    local Gimnasios = {
        "Gimnasio inicial", "Gimnasio de piedra",
        "Gimnasio de hierro", "Gimnasio de oro",
        "Gimnasio de diamante", "Gimnasio de maestro"
    }
    for _, gimnasio in pairs(Gimnasios) do
        local Btn = CrearBotonDerecho(gimnasio .. " ✅ Sin requisitos", function()
            print("[GoldGuerrero] Teletransportado a:", gimnasio)
        end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 10, 0, y)
        y += 52
    end
end)

-- 🔄 RENACIMIENTO
CrearPestana("Renacimiento", "🔄", function()
    local y = 50
    local Opciones = {
        "Auto renacer", "Mantener mascotas al renacer",
        "Mantener pesas al renacer", "Fuerza mínima para renacer"
    }
    for _, opcion in pairs(Opciones) do
        local Btn = CrearBotonDerecho(opcion, function()
            print("[GoldGuerrero] Activado:", opcion)
        end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 10, 0, y)
        y += 52
    end
end)

-- 🐾 MASCOTAS
CrearPestana("Mascotas", "🐾", function()
    local y = 50
    local Opciones = {
        "Auto equipar mejor mascota", "Lista de mascotas",
        "Auras gratis", "Multiplicadores de ganancia"
    }
    for _, opcion in pairs(Opciones) do
        local Btn = CrearBotonDerecho(opcion, function()
            print("[GoldGuerrero] Activado:", opcion)
        end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 10, 0, y)
        y += 52
    end
end)

-- 🗡️ KILLER
CrearPestana("Killer", "🗡️", function()
    local y = 50
    local Opciones = {
        "Auto atacar cercanos", "Rango de detección",
        "Ignorar amigos", "Auto teletransportar al objetivo"
    }
    for _, opcion in pairs(Opciones) do
        local Btn = CrearBotonDerecho(opcion, function()
            print("[GoldGuerrero] Activado:", opcion)
        end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 10, 0, y)
        y += 52
    end
end)

-- ⚙️ AJUSTES
CrearPestana("Ajustes", "⚙️", function()
    local y = 50
    local Opciones = {
        "Notificaciones ON/OFF", "Sonidos ON/OFF",
        "Tema oscuro/claro", "Reiniciar configuración"
    }
    for _, opcion in pairs(Opciones) do
        local Btn = CrearBotonDerecho(opcion, function()
            print("[GoldGuerrero] Cambiado:", opcion)
        end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 10, 0, y)
        y += 52
    end
end)

-- ✅ ACTIVAR MAIN POR DEFECTO
task.wait(0.1)
BotonesLateral.Main.Btn.TextColor3 = Colores.Texto
BotonesLateral.Main.Barrita.BackgroundColor3 = Colores.AcentoAzul

-- ✅ CONFIRMACIÓN
print("========================================")
print("✅ GOLD GUERRERO HUB — LETRAS CLARAS ✅")
print("⚔️ Creado por: GoldGuerrero")
print("🔤 Todo en español — SIN letras raras")
print("❌ SIN ícono ninja — SOLO TU NOMBRE")
print("📐 560×360 — compacto para celular")
print("👁️ Ojo 👁️ — abre/cierra siempre igual")
print("========================================")
