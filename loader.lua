-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — VERSIÓN FINAL
--  🇪🇸 TODO EN ESPAÑOL | ESTILO YOUNG0X
--  📱 ANCHO=555px | ALTO=420px ✅ COMPACTO
--  ❌ SIN BOTÓN VOLVER → AL ABRIR SOLO QUEDA ESA VENTANA
--  ✕ SOLO BOTÓN SALIR | TODAS LAS FUNCIONES CONECTADAS
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- ✅ BORRA DUPLICADOS AL CARGAR
if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui.GoldGuerreroHub:Destroy()
end

-- 🔴 ESTADOS DE TODAS LAS FUNCIONES (TODO EN ESPAÑOL)
local Estados = {
    GlitchRapido = { Activar = false },
    Entrenamiento = {
        GolpearRocas = false,
        LevantarPesas = false,
        Flexionar = false,
        VelocidadDoble = false
    },
    Renacimiento = {
        AutoRenacer = false,
        SoloAlMaximo = false,
        ComprarMejoras = false
    },
    Combate = {
        MatarEnemigos = false,
        MatarJugadores = false,
        CambiarServidor = false
    },
    Mascotas = {
        TiendaGratis = false,
        AbrirHuevos = false,
        DuplicarMascotas = false
    },
    Extras = {
        Teletransportar = false,
        NoExpulsar = false,
        RecogerMonedas = false
    }
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ==================================================
-- 📂 FUNCIÓN ABRIR VENTANA → BORRA EL MENÚ PRINCIPAL
-- ❌ SIN BOTÓN VOLVER → SOLO QUEDA LA VENTANA
-- ==================================================
local function AbrirVentana(titulo, opciones, datosEstado)
    -- ✅ BORRA EL MENÚ PRINCIPAL
    if ScreenGui:FindFirstChild("MainFrame") then
        ScreenGui.MainFrame:Destroy()
    end

    -- ✅ BORRA VENTANA ANTERIOR
    if ScreenGui:FindFirstChild("VentanaFrame") then
        ScreenGui.VentanaFrame:Destroy()
    end

    -- ✅ CREA LA VENTANA NUEVA (ES EL NUEVO MENÚ)
    local Ventana = Instance.new("Frame")
    Ventana.Name = "VentanaFrame"
    Ventana.Parent = ScreenGui
    Ventana.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
    Ventana.BorderColor3 = Color3.fromRGB(0, 180, 90)
    Ventana.BorderSizePixel = 2
    Ventana.Position = UDim2.new(0.5, -277, 0.5, -210)
    Ventana.Size = UDim2.new(0, 555, 0, 420)
    Ventana.Active = true
    Ventana.Draggable = true
    Instance.new("UICorner", Ventana).CornerRadius = UDim.new(0, 16)

    -- 🏷️ TÍTULO DE LA VENTANA
    local TituloVentana = Instance.new("TextLabel")
    TituloVentana.Parent = Ventana
    TituloVentana.BackgroundTransparency = 1
    TituloVentana.Position = UDim2.new(0.5, -150, 0, 15)
    TituloVentana.Size = UDim2.new(0, 300, 0, 28)
    TituloVentana.Font = Enum.Font.GothamBold
    TituloVentana.Text = titulo
    TituloVentana.TextColor3 = Color3.fromRGB(0, 255, 120)
    TituloVentana.TextSize = 20

    -- 🔴 LÍNEA SEPARADORA
    local Linea = Instance.new("Frame")
    Linea.Parent = Ventana
    Linea.BackgroundColor3 = Color3.fromRGB(0, 180, 90)
    Linea.Position = UDim2.new(0.05, 0, 0, 55)
    Linea.Size = UDim2.new(0.90, 0, 0, 2)

    -- ⚙️ CREAR LOS BOTONES DE OPCIONES
    for i, opcion in ipairs(opciones) do
        local Fila = Instance.new("Frame")
        Fila.Parent = Ventana
        Fila.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
        Fila.BorderColor3 = Color3.fromRGB(50, 35, 65)
        Fila.BorderSizePixel = 1
        Fila.Position = UDim2.new(0.05, 0, 0, 70 + (i-1)*50)
        Fila.Size = UDim2.new(0.90, 0, 0, 42)
        Instance.new("UICorner", Fila).CornerRadius = UDim.new(0, 10)

        local Etiqueta = Instance.new("TextLabel")
        Etiqueta.Parent = Fila
        Etiqueta.BackgroundTransparency = 1
        Etiqueta.Position = UDim2.new(0.05, 0, 0.5, -12)
        Etiqueta.Size = UDim2.new(0.65, 0, 0, 24)
        Etiqueta.Font = Enum.Font.Gotham
        Etiqueta.Text = opcion.Nombre
        Etiqueta.TextColor3 = Color3.fromRGB(255, 255, 255)
        Etiqueta.TextSize = 15

        local Boton = Instance.new("TextButton")
        Boton.Parent = Fila
        Boton.BackgroundColor3 = datosEstado[opcion.Clave] and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(80, 30, 50)
        Boton.Position = UDim2.new(0.80, -50, 0.5, -15)
        Boton.Size = UDim2.new(0, 100, 0, 30)
        Boton.Font = Enum.Font.GothamBold
        Boton.Text = datosEstado[opcion.Clave] and "✅ ACTIVO" or "🔴 DESACT."
        Boton.TextColor3 = Color3.fromRGB(255, 255, 255)
        Boton.TextSize = 12
        Instance.new("UICorner", Boton).CornerRadius = UDim.new(0, 8)

        Boton.MouseButton1Click:Connect(function()
            datosEstado[opcion.Clave] = not datosEstado[opcion.Clave]
            Boton.BackgroundColor3 = datosEstado[opcion.Clave] and Color3.fromRGB(25, 180, 70) or Color3.fromRGB(80, 30, 50)
            Boton.Text = datosEstado[opcion.Clave] and "✅ ACTIVO" or "🔴 DESACT."
        end)
    end

    -- ✕ BOTÓN SALIR (ÚNICO BOTÓN PARA CERRAR TODO)
    local BotonSalir = Instance.new("TextButton")
    BotonSalir.Parent = Ventana
    BotonSalir.BackgroundColor3 = Color3.fromRGB(200, 0, 25)
    BotonSalir.Position = UDim2.new(0.5, -90, 1, -55)
    BotonSalir.Size = UDim2.new(0, 180, 0, 40)
    BotonSalir.Font = Enum.Font.GothamBold
    BotonSalir.Text = "✕ CERRAR TODO"
    BotonSalir.TextColor3 = Color3.fromRGB(255, 255, 255)
    BotonSalir.TextSize = 16
    Instance.new("UICorner", BotonSalir).CornerRadius = UDim.new(0, 10)
    BotonSalir.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

-- ==================================================
-- 📋 MENÚ PRINCIPAL
-- ==================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
MainFrame.BorderColor3 = Color3.fromRGB(180, 0, 25)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.5, -277, 0.5, -210)
MainFrame.Size = UDim2.new(0, 555, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

-- 🏷️ TÍTULO
local Titulo = Instance.new("TextLabel")
Titulo.Parent = MainFrame
Titulo.BackgroundTransparency = 1
Titulo.Position = UDim2.new(0.5, -110, 0, 8)
Titulo.Size = UDim2.new(0, 220, 0, 24)
Titulo.Font = Enum.Font.GothamBold
Titulo.Text = "GoldGuerrero Hub"
Titulo.TextColor3 = Color3.fromRGB(255, 215, 0)
Titulo.TextSize = 20

local Subtitulo = Instance.new("TextLabel")
Subtitulo.Parent = MainFrame
Subtitulo.BackgroundTransparency = 1
Subtitulo.Position = UDim2.new(0.5, -75, 0, 30)
Subtitulo.Size = UDim2.new(0, 150, 0, 14)
Subtitulo.Font = Enum.Font.Gotham
Subtitulo.Text = "Muscle Legends"
Subtitulo.TextColor3 = Color3.fromRGB(180, 0, 25)
Subtitulo.TextSize = 11

-- 🖼️ ICONO
local IconoPerfil = Instance.new("Frame")
IconoPerfil.Parent = MainFrame
IconoPerfil.BackgroundColor3 = Color3.fromRGB(25, 40, 60)
IconoPerfil.BorderColor3 = Color3.fromRGB(50, 100, 180)
IconoPerfil.BorderSizePixel = 2
IconoPerfil.Position = UDim2.new(0.05, 0, 0, 6)
IconoPerfil.Size = UDim2.new(0, 38, 0, 38)
Instance.new("UICorner", IconoPerfil).CornerRadius = UDim.new(0, 8)

local EmojiPerfil = Instance.new("TextLabel")
EmojiPerfil.Parent = IconoPerfil
EmojiPerfil.BackgroundTransparency = 1
EmojiPerfil.Size = UDim2.new(1, 0, 1, 0)
EmojiPerfil.Font = Enum.Font.GothamBold
EmojiPerfil.Text = "🥷"
EmojiPerfil.TextSize = 20
EmojiPerfil.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 🔴 LÍNEA
local LineaSup = Instance.new("Frame")
LineaSup.Parent = MainFrame
LineaSup.BackgroundColor3 = Color3.fromRGB(180, 0, 25)
LineaSup.Position = UDim2.new(0.05, 0, 0, 50)
LineaSup.Size = UDim2.new(0.90, 0, 0, 2)

-- ==================================================
-- ⚡ 1. GLITCH RÁPIDO
-- ==================================================
local MarcoGlitch = Instance.new("Frame")
MarcoGlitch.Parent = MainFrame
MarcoGlitch.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
MarcoGlitch.BorderColor3 = Color3.fromRGB(60, 25, 40)
MarcoGlitch.BorderSizePixel = 1
MarcoGlitch.Position = UDim2.new(0.05, 0, 0, 62)
MarcoGlitch.Size = UDim2.new(0.90, 0, 0, 60)
Instance.new("UICorner", MarcoGlitch).CornerRadius = UDim.new(0, 12)

local CajaRayo = Instance.new("Frame")
CajaRayo.Parent = MarcoGlitch
CajaRayo.BackgroundColor3 = Color3.fromRGB(220, 0, 30)
CajaRayo.Position = UDim2.new(0.03, 0, 0.08, 0)
CajaRayo.Size = UDim2.new(0, 50, 0, 48)
Instance.new("UICorner", CajaRayo).CornerRadius = UDim.new(0, 12)

local Rayo = Instance.new("TextLabel")
Rayo.Parent = CajaRayo
Rayo.BackgroundTransparency = 1
Rayo.Size = UDim2.new(1, 0, 1, 0)
Rayo.Font = Enum.Font.GothamBold
Rayo.Text = "⚡"
Rayo.TextSize = 24
Rayo.TextColor3 = Color3.fromRGB(255, 255, 255)

local TextoGlitch = Instance.new("TextLabel")
TextoGlitch.Parent = MarcoGlitch
TextoGlitch.BackgroundTransparency = 1
TextoGlitch.Position = UDim2.new(0.22, 0, 0.15, 0)
TextoGlitch.Size = UDim2.new(0.45, 0, 0, 22)
TextoGlitch.Font = Enum.Font.GothamBold
TextoGlitch.Text = "Glitch Rápido"
TextoGlitch.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoGlitch.TextSize = 16

local TextoGlitchDesc = Instance.new("TextLabel")
TextoGlitchDesc.Parent = MarcoGlitch
TextoGlitchDesc.BackgroundTransparency = 1
TextoGlitchDesc.Position = UDim2.new(0.22, 0, 0.55, 0)
TextoGlitchDesc.Size = UDim2.new(0.45, 0, 0, 14)
TextoGlitchDesc.Font = Enum.Font.Gotham
TextoGlitchDesc.Text = "Fuerza infinita muy rápido"
TextoGlitchDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
TextoGlitchDesc.TextSize = 10

local BtnGlitch = Instance.new("TextButton")
BtnGlitch.Parent = MarcoGlitch
BtnGlitch.BackgroundColor3 = Color3.fromRGB(220, 0, 30)
BtnGlitch.Position = UDim2.new(0.75, 0, 0.12, 0)
BtnGlitch.Size = UDim2.new(0, 90, 0, 45)
BtnGlitch.Font = Enum.Font.GothamBold
BtnGlitch.Text = "ABRIR"
BtnGlitch.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnGlitch.TextSize = 13
Instance.new("UICorner", BtnGlitch).CornerRadius = UDim.new(0, 12)
BtnGlitch.MouseButton1Click:Connect(function()
    AbrirVentana("⚡ GLITCH RÁPIDO", {
        {Nombre="Activar Glitch de Velocidad", Clave="Activar"}
    }, Estados.GlitchRapido)
end)

-- ==================================================
-- 🏋️ 2. ENTRENAMIENTO AUTOMÁTICO
-- ==================================================
local MarcoEntrenar = Instance.new("Frame")
MarcoEntrenar.Parent = MainFrame
MarcoEntrenar.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
MarcoEntrenar.BorderColor3 = Color3.fromRGB(60, 25, 40)
MarcoEntrenar.BorderSizePixel = 1
MarcoEntrenar.Position = UDim2.new(0.05, 0, 0, 132)
MarcoEntrenar.Size = UDim2.new(0.90, 0, 0, 60)
Instance.new("UICorner", MarcoEntrenar).CornerRadius = UDim.new(0, 12)

local CajaPesas = Instance.new("Frame")
CajaPesas.Parent = MarcoEntrenar
CajaPesas.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
CajaPesas.Position = UDim2.new(0.03, 0, 0.08, 0)
CajaPesas.Size = UDim2.new(0, 50, 0, 48)
Instance.new("UICorner", CajaPesas).CornerRadius = UDim.new(0, 12)

local Pesas = Instance.new("TextLabel")
Pesas.Parent = CajaPesas
Pesas.BackgroundTransparency = 1
Pesas.Size = UDim2.new(1, 0, 1, 0)
Pesas.Font = Enum.Font.GothamBold
Pesas.Text = "🏋️"
Pesas.TextSize = 24
Pesas.TextColor3 = Color3.fromRGB(255, 255, 255)

local TextoEntrenar = Instance.new("TextLabel")
TextoEntrenar.Parent = MarcoEntrenar
TextoEntrenar.BackgroundTransparency = 1
TextoEntrenar.Position = UDim2.new(0.22, 0, 0.15, 0)
TextoEntrenar.Size = UDim2.new(0.45, 0, 0, 22)
TextoEntrenar.Font = Enum.Font.GothamBold
TextoEntrenar.Text = "Entrenamiento"
TextoEntrenar.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoEntrenar.TextSize = 16

local TextoEntrenarDesc = Instance.new("TextLabel")
TextoEntrenarDesc.Parent = MarcoEntrenar
TextoEntrenarDesc.BackgroundTransparency = 1
TextoEntrenarDesc.Position = UDim2.new(0.22, 0, 0.55, 0)
TextoEntrenarDesc.Size = UDim2.new(0.45, 0, 0, 14)
TextoEntrenarDesc.Font = Enum.Font.Gotham
TextoEntrenarDesc.Text = "Auto entrenar fuerza"
TextoEntrenarDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
TextoEntrenarDesc.TextSize = 10

local BtnEntrenar = Instance.new("TextButton")
BtnEntrenar.Parent = MarcoEntrenar
BtnEntrenar.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
BtnEntrenar.Position = UDim2.new(0.75, 0, 0.12, 0)
BtnEntrenar.Size = UDim2.new(0, 90, 0, 45)
BtnEntrenar.Font = Enum.Font.GothamBold
BtnEntrenar.Text = "ABRIR"
BtnEntrenar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnEntrenar.TextSize = 13
Instance.new("UICorner", BtnEntrenar).CornerRadius = UDim.new(0, 12)
BtnEntrenar.MouseButton1Click:Connect(function()
    AbrirVentana("🏋️ ENTRENAMIENTO", {
        {Nombre="Golpear Rocas Automático", Clave="GolpearRocas"},
        {Nombre="Levantar Pesas Automático", Clave="LevantarPesas"},
        {Nombre="Flexionar Automático", Clave="Flexionar"},
        {Nombre="Velocidad Doble", Clave="VelocidadDoble"}
    }, Estados.Entrenamiento)
end)

-- ==================================================
-- 🔄 3. RENACIMIENTO AUTOMÁTICO
-- ==================================================
local MarcoRenacer = Instance.new("Frame")
MarcoRenacer.Parent = MainFrame
MarcoRenacer.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
MarcoRenacer.BorderColor3 = Color3.fromRGB(60, 25, 40)
MarcoRenacer.BorderSizePixel = 1
MarcoRenacer.Position = UDim2.new(0.05, 0, 0, 202)
MarcoRenacer.Size = UDim2.new(0.43, 0, 0, 60)
Instance.new("UICorner", MarcoRenacer).CornerRadius = UDim.new(0, 12)

local CajaRenacer = Instance.new("Frame")
CajaRenacer.Parent = MarcoRenacer
CajaRenacer.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
CajaRenacer.Position = UDim2.new(0.05, 0, 0.08, 0)
CajaRenacer.Size = UDim2.new(0, 45, 0, 45)
Instance.new("UICorner", CajaRenacer).CornerRadius = UDim.new(0, 10)

local Renacer = Instance.new("TextLabel")
Renacer.Parent = CajaRenacer
Renacer.BackgroundTransparency = 1
Renacer.Size = UDim2.new(1, 0, 1, 0)
Renacer.Font = Enum.Font.GothamBold
Renacer.Text = "🔄"
Renacer.TextSize = 22
Renacer.TextColor3 = Color3.fromRGB(255, 255, 255)

local TextoRenacer = Instance.new("TextLabel")
TextoRenacer.Parent = MarcoRenacer
TextoRenacer.BackgroundTransparency = 1
TextoRenacer.Position = UDim2.new(0.38, 0, 0.15, 0)
TextoRenacer.Size = UDim2.new(0.55, 0, 0, 20)
TextoRenacer.Font = Enum.Font.GothamBold
TextoRenacer.Text = "Renacimiento"
TextoRenacer.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoRenacer.TextSize = 14

local TextoRenacerDesc = Instance.new("TextLabel")
TextoRenacerDesc.Parent = MarcoRenacer
TextoRenacerDesc.BackgroundTransparency = 1
TextoRenacerDesc.Position = UDim2.new(0.38, 0, 0.55, 0)
TextoRenacerDesc.Size = UDim2.new(0.55, 0, 0, 14)
TextoRenacerDesc.Font = Enum.Font.Gotham
TextoRenacerDesc.Text = "Auto Renacer"
TextoRenacerDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
TextoRenacerDesc.TextSize = 10

local BtnRenacer = Instance.new("TextButton")
BtnRenacer.Parent = MarcoRenacer
BtnRenacer.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
BtnRenacer.Position = UDim2.new(0.15, 0, 0.70, 0)
BtnRenacer.Size = UDim2.new(0, 120, 0, 22)
BtnRenacer.Font = Enum.Font.GothamBold
BtnRenacer.Text = "ABRIR"
BtnRenacer.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnRenacer.TextSize = 11
Instance.new("UICorner", BtnRenacer).CornerRadius = UDim.new(0, 8)
BtnRenacer.MouseButton1Click:Connect(function()
    AbrirVentana("🔄 RENACIMIENTO", {
        {Nombre="Renacer Automáticamente", Clave="AutoRenacer"},
        {Nombre="Solo al Máximo de Fuerza", Clave="SoloAlMaximo"},
        {Nombre="Comprar Mejoras Solo", Clave="ComprarMejoras"}
    }, Estados.Renacimiento)
end)

-- ==================================================
-- 🎯 4. COMBATE AUTOMÁTICO
-- ==================================================
local MarcoCombate = Instance.new("Frame")
MarcoCombate.Parent = MainFrame
MarcoCombate.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
MarcoCombate.BorderColor3 = Color3.fromRGB(60, 25, 40)
MarcoCombate.BorderSizePixel = 1
MarcoCombate.Position = UDim2.new(0.52, 0, 0, 202)
MarcoCombate.Size = UDim2.new(0.43, 0, 0, 60)
Instance.new("UICorner", MarcoCombate).CornerRadius = UDim.new(0, 12)

local CajaCombate = Instance.new("Frame")
CajaCombate.Parent = MarcoCombate
CajaCombate.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
CajaCombate.Position = UDim2.new(0.05, 0, 0.08, 0)
CajaCombate.Size = UDim2.new(0, 45, 0, 45)
Instance.new("UICorner", CajaCombate).CornerRadius = UDim.new(0, 10)

local Combate = Instance.new("TextLabel")
Combate.Parent = CajaCombate
Combate.BackgroundTransparency = 1
Combate.Size = UDim2.new(1, 0, 1, 0)
Combate.Font = Enum.Font.GothamBold
Combate.Text = "🎯"
Combate.TextSize = 22
Combate.TextColor3 = Color3.fromRGB(255, 255, 255)

local TextoCombate = Instance.new("TextLabel")
TextoCombate.Parent = MarcoCombate
TextoCombate.BackgroundTransparency = 1
TextoCombate.Position = UDim2.new(0.38, 0, 0.15, 0)
TextoCombate.Size = UDim2.new(0.55, 0, 0, 20)
TextoCombate.Font = Enum.Font.GothamBold
TextoCombate.Text = "Combate"
TextoCombate.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoCombate.TextSize = 14

local TextoCombateDesc = Instance.new("TextLabel")
TextoCombateDesc.Parent = MarcoCombate
TextoCombateDesc.BackgroundTransparency = 1
TextoCombateDesc.Position = UDim2.new(0.38, 0, 0.55, 0)
TextoCombateDesc.Size = UDim2.new(0.55, 0, 0, 14)
TextoCombateDesc.Font = Enum.Font.Gotham
TextoCombateDesc.Text = "Auto Matar"
TextoCombateDesc.TextColor3 = Color3.fromRGB(160, 160, 170)
TextoCombateDesc.TextSize = 10

local BtnCombate = Instance.new("TextButton")
BtnCombate.Parent = MarcoCombate
BtnCombate.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
BtnCombate.Position = UDim2.new(0.15, 0, 0.70, 0)
BtnCombate.Size = UDim2.new(0, 120, 0, 22)
BtnCombate.Font = Enum.Font.GothamBold
BtnCombate.Text = "ABRIR"
BtnCombate.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnCombate.TextSize = 11
Instance.new("UICorner", BtnCombate).CornerRadius = UDim.new(0, 8)
BtnCombate.MouseButton1Click:Connect(function()
    AbrirVentana("🎯 COMBATE", {
        {Nombre="Matar Enemigos Automático", Clave="MatarEnemigos"},
        {Nombre="Matar Jugadores", Clave="MatarJugadores"},
        {Nombre="Cambiar Servidor Automático", Clave="CambiarServidor"}
    }, Estados.Combate)
end)

-- ==================================================
-- 🐾 5. MASCOTAS
-- ==================================================
local MarcoMascotas = Instance.new("Frame")
MarcoMascotas.Parent = MainFrame
MarcoMascotas.BackgroundColor3 = Color3.fromRGB(30, 15, 25)
MarcoMascotas.BorderColor3 = Color3.fromRGB(60, 25, 40)
MarcoMascotas.BorderSizePixel = 1
MarcoMascotas.Position = UDim2.new(0.05, 0, 0, 272)
MarcoMascotas.Size = UDim2.new(0.43, 0, 0, 60)
Instance.new("UICorner", MarcoMascotas).CornerRadius = UDim.new(0, 12)

local CajaMascotas = Instance.new("Frame")
CajaMascotas.Parent = MarcoMascotas
CajaMascotas.BackgroundColor3 = Color3.fromRGB(45, 20, 35)
CajaMascotas.Position = UDim2.new(0.05, 0, 0.08, 0)
CajaMascotas.Size = UDim2.new(0, 45, 0, 45)
Instance.new("UICorner", CajaMascotas).CornerRadius = UDim.new(0, 10)

local Mascotas = Instance.new("TextLabel")
Mascotas.Parent = CajaMascotas
Mascotas.BackgroundTransparency = 1
Mascotas.Size = UDim2.new(1, 0, 1, 0)
Mascotas.Font = Enum.Font.GothamBold
Mascotas.Text = "🐾"
Mascotas.TextSize = 22
Mascotas.TextColor3 = Color3.fromRGB(255, 255, 255)

local TextoMascotas = Instance.new("TextLabel")
TextoMascotas.Parent = MarcoMascotas
TextoMascotas.BackgroundTransparency = 1
TextoMascotas.Position = UDim2.new(0.38, 0, 0.15, 0)
TextoMascotas.Size = UDim2.new(0.55, 0, 0, 20)
TextoMascotas.Font = Enum.Font.GothamBold
TextoMascotas.Text = "Mascotas"
TextoMascotas.TextColor3 = Color3.fromRGB(255, 255, 255)
TextoMascotas.TextSize = 14

local TextoMascotasDesc = Instance.new("TextLabel")
