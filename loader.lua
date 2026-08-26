-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — VERSIÓN FINAL
--  🇪🇸 TODO EN ESPAÑOL | ESTILO YOUNG0X
--  📱 COMPACTO | DESLIZANTE | PESTAÑAS
--  ✨ Creado por: GoldGuerrero | Versión: 1.0
-- ==================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- ✅ BORRA DUPLICADOS AL CARGAR
if CoreGui:FindFirstChild("GoldGuerreroHub") then
    CoreGui.GoldGuerreroHub:Destroy()
end

-- 🔴 ESTADOS GLOBALES
local Estados = {
    FastGlitch = {
        Activar = false,
        VelocidadExtra = false,
        FuerzaDoble = false,
        SinRetraso = false,
        AutoRocks = false
    },
    Entrenamiento = {
        AutoWeight = false,
        AutoPushups = false,
        LockPosition = false,
        AutoRebirths = false,
        Fly = false,
        FlySpeed = 10,
        Stars = false,
        AntiLag = 60,
        AntiAFK = false,
        ReclamarTodo = false
    },
    Kills = {
        AutoKill = false,
        ServerHop = false,
        NoAmigos = false,
        ObjetivoJugador = "",
        Kills = 0
    },
    PetShop = {
        Gemas = 0,
        PetSeleccionado = "",
        CompraAutoPet = false,
        AutoEvolucionar = false,
        AuraSeleccionada = "",
        CompraAutoAura = false
    },
    Rebirths = {
        Rebirths = 18980,
        Tamano1 = false,
        PesaAuto = false,
        AutoPushups = false,
        TeleportKing = false,
        BloquearPosicion = false,
        AutoEgg = false,
        Objetivo = 0,
        RenacerHasta = false,
        Ultimates = {
            DailySpin = 0,
            PetSlot = 0,
            ItemCapacity = 0,
            RepSpeed = 0,
            DemonDamage = 0
        }
    }
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ==================================================
-- 📂 FUNCIÓN DE VENTANA CON PESTAÑAS
-- ==================================================
local function CrearVentanaPestanas(titulo, pestanas, colorAcento)
    local Ventana = Instance.new("Frame")
    Ventana.Name = "Ventana"
    Ventana.Parent = ScreenGui
    Ventana.BackgroundColor3 = Color3.fromRGB(22, 18, 28)
    Ventana.BorderColor3 = colorAcento
    Ventana.BorderSizePixel = 2
    Ventana.Position = UDim2.new(0.5, -200, 0.5, -250)
    Ventana.Size = UDim2.new(0, 400, 0, 500)
    Ventana.Active = true
    Ventana.Draggable = true
    Instance.new("UICorner", Ventana).CornerRadius = UDim.new(0, 16)

    -- 🏆 TÍTULO
    local Titulo = Instance.new("TextLabel")
    Titulo.Parent = Ventana
    Titulo.BackgroundTransparency = 1
    Titulo.Position = UDim2.new(0.5, -150, 0, 12)
    Titulo.Size = UDim2.new(0, 300, 0, 28)
    Titulo.Font = Enum.Font.GothamBold
    Titulo.Text = titulo
    Titulo.TextColor3 = colorAcento
    Titulo.TextSize = 20
    Titulo.TextXAlignment = Enum.TextXAlignment.Center

    -- 📂 CONTENEDOR DE PESTAÑAS
    local PestanaContainer = Instance.new("Frame")
    PestanaContainer.Parent = Ventana
    PestanaContainer.BackgroundTransparency = 1
    PestanaContainer.Position = UDim2.new(0.05, 0, 0, 50)
    PestanaContainer.Size = UDim2.new(0.90, 0, 0, 36)

    local PestanaLayout = Instance.new("UIGridLayout")
    PestanaLayout.Parent = PestanaContainer
    PestanaLayout.CellSize = UDim2.new(0, 120, 0, 36)
    PestanaLayout.CellPadding = UDim2.new(0, 8, 0, 0)
    PestanaLayout.FillDirection = Enum.FillDirection.Horizontal
    PestanaLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- 📜 CONTENEDOR DESLIZANTE
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Parent = Ventana
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.Position = UDim2.new(0.05, 0, 0, 95)
    ScrollingFrame.Size = UDim2.new(0.90, 0, 1, -110)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.ScrollBarThickness = 5
    ScrollingFrame.ScrollBarColor3 = colorAcento
    ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local ListaLayout = Instance.new("UIListLayout")
    ListaLayout.Parent = ScrollingFrame
    ListaLayout.Padding = UDim.new(0, 8)
    ListaLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- 🔄 CAMBIAR PESTAÑA
    local ContenidoPorPestana = {}
    local PestanaActiva = 1

    local function MostrarPestana(indice)
        PestanaActiva = indice
        for i, hijo in ipairs(ScrollingFrame:GetChildren()) do
            if hijo:IsA("Frame") then
                hijo.Visible = false
            end
        end
        if ContenidoPorPestana[indice] then
            ContenidoPorPestana[indice].Visible = true
        end
        for i, boton in ipairs(PestanaContainer:GetChildren()) do
            if boton:IsA("TextButton") then
                if i == indice then
                    boton.BackgroundColor3 = colorAcento
                    boton.TextColor3 = Color3.fromRGB(255,255,255)
                else
                    boton.BackgroundColor3 = Color3.fromRGB(40, 35, 50)
                    boton.TextColor3 = Color3.fromRGB(180,180,180)
                end
            end
        end
    end

    -- 📂 CREAR BOTONES DE PESTAÑAS
    for i, pestana in ipairs(pestanas) do
        local BotonPestana = Instance.new("TextButton")
        BotonPestana.Parent = PestanaContainer
        BotonPestana.Name = "Pestana_"..pestana.Nombre
        BotonPestana.BackgroundColor3 = i == 1 and colorAcento or Color3.fromRGB(40, 35, 50)
        BotonPestana.Font = Enum.Font.GothamBold
        BotonPestana.Text = pestana.Nombre
        BotonPestana.TextColor3 = i == 1 and Color3.fromRGB(255,255,255) or Color3.fromRGB(180,180,180)
        BotonPestana.TextSize = 14
        BotonPestana.AutoLocalize = false
        BotonPestana.MouseButton1Click:Connect(function()
            MostrarPestana(i)
        end)

        -- 📜 CONTENIDO DE LA PESTAÑA
        local Contenido = Instance.new("Frame")
        Contenido.Parent = ScrollingFrame
        Contenido.Visible = i == 1
        Contenido.BackgroundTransparency = 1
        Contenido.Size = UDim2.new(1, 0, 0, 0)
        Contenido.AutomaticSize = Enum.AutomaticSize.Y
        ContenidoPorPestana[i] = Contenido

        local ContenidoLayout = Instance.new("UIListLayout")
        ContenidoLayout.Parent = Contenido
        ContenidoLayout.Padding = UDim.new(0, 8)

        -- ⚙️ AGREGAR OPCIONES
        for _, opcion in ipairs(pestana.Opciones) do
            if opcion.Tipo == "Interruptor" then
                local Fila = Instance.new("Frame")
                Fila.Parent = Contenido
                Fila.BackgroundColor3 = Color3.fromRGB(35, 30, 45)
                Fila.Size = UDim2.new(1, 0, 0, 48)
                Instance.new("UICorner", Fila).CornerRadius = UDim.new(0, 8)

                local Nombre = Instance.new("TextLabel")
                Nombre.Parent = Fila
                Nombre.BackgroundTransparency = 1
                Nombre.Position = UDim2.new(0, 15, 0, 0)
                Nombre.Size = UDim2.new(0.8, -15, 1, 0)
                Nombre.Font = Enum.Font.Gotham
                Nombre.Text = opcion.Nombre
                Nombre.TextColor3 = Color3.fromRGB(230,230,230)
                Nombre.TextSize = 15
                Nombre.TextXAlignment = Enum.TextXAlignment.Left

                local Switch = Instance.new("Frame")
                Switch.Parent = Fila
                Switch.Name = "Switch"
                Switch.BackgroundColor3 = opcion.Valor and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(80, 80, 80)
                Switch.Position = UDim2.new(1, -45, 0.5, -12)
                Switch.Size = UDim2.new(0, 24, 0, 24)
                Instance.new("UICorner", Switch).CornerRadius = UDim.new(1, 0)

                local BotonClick = Instance.new("TextButton")
                BotonClick.Parent = Fila
                BotonClick.BackgroundTransparency = 1
                BotonClick.Size = UDim2.new(1, 0, 1, 0)
                BotonClick.Text = ""
                BotonClick.MouseButton1Click:Connect(function()
                    opcion.Valor = not opcion.Valor
                    Switch.BackgroundColor3 = opcion.Valor and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(80, 80, 80)
                    if opcion.Callback then opcion.Callback(opcion.Valor) end
                end)
            elseif opcion.Tipo == "Deslizador" then
                -- Barra deslizante
                local Fila = Instance.new("Frame")
                Fila.Parent = Contenido
                Fila.BackgroundColor3 = Color3.fromRGB(35, 30, 45)
                Fila.Size = UDim2.new(1, 0, 0, 56)
                Instance.new("UICorner", Fila).CornerRadius = UDim.new(0, 8)

                local Nombre = Instance.new("TextLabel")
                Nombre.Parent = Fila
                Nombre.BackgroundTransparency = 1
                Nombre.Position = UDim2.new(0, 15, 0, 5)
                Nombre.Size = UDim2.new(0.9, -15, 0, 20)
                Nombre.Font = Enum.Font.Gotham
                Nombre.Text = opcion.Nombre.." : "..opcion.Valor
                Nombre.TextColor3 = Color3.fromRGB(230,230,230)
                Nombre.TextSize = 14
                Nombre.TextXAlignment = Enum.TextXAlignment.Left

                local BarraFondo = Instance.new("Frame")
                BarraFondo.Parent = Fila
                BarraFondo.BackgroundColor3 = Color3.fromRGB(60, 55, 70)
                BarraFondo.Position = UDim2.new(0, 15, 0, 32)
                BarraFondo.Size = UDim2.new(0.9, -15, 0, 8)
                Instance.new("UICorner", BarraFondo).CornerRadius = UDim.new(1, 0)

                local BarraLlena = Instance.new("Frame")
                BarraLlena.Parent = BarraFondo
                BarraLlena.BackgroundColor3 = colorAcento
                BarraLlena.Size = UDim2.new((opcion.Valor - opcion.Min) / (opcion.Max - opcion.Min), 0, 1, 0)
                Instance.new("UICorner", BarraLlena).CornerRadius = UDim.new(1, 0)

                local Punto = Instance.new("Frame")
                Punto.Parent = BarraFondo
                Punto.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Punto.Position = UDim2.new((opcion.Valor - opcion.Min) / (opcion.Max - opcion.Min), -8, 0.5, -8)
                Punto.Size = UDim2.new(0, 16, 0, 16)
                Instance.new("UICorner", Punto).CornerRadius = UDim.new(1, 0)

                -- Simplificado — funcionalidad completa la agregamos después
            elseif opcion.Tipo == "Contador" then
                local Fila = Instance.new("Frame")
                Fila.Parent = Contenido
                Fila.BackgroundColor3 = Color3.fromRGB(30, 25, 40)
                Fila.BorderColor3 = colorAcento
                Fila.BorderSizePixel = 1
                Fila.Size = UDim2.new(1, 0, 0, 70)
                Instance.new("UICorner", Fila).CornerRadius = UDim.new(0, 8)

                local Etiqueta = Instance.new("TextLabel")
                Etiqueta.Parent = Fila
                Etiqueta.BackgroundTransparency = 1
                Etiqueta.Position = UDim2.new(0.5, 0, 0, 8)
                Etiqueta.Size = UDim2.new(0.9, 0, 0, 22)
                Etiqueta.Font = Enum.Font.GothamBold
                Etiqueta.Text = opcion.Nombre
                Etiqueta.TextColor3 = colorAcento
                Etiqueta.TextSize = 16
                Etiqueta.TextXAlignment = Enum.TextXAlignment.Center

                local Valor = Instance.new("TextLabel")
                Valor.Parent = Fila
                Valor.BackgroundTransparency = 1
                Valor.Position = UDim2.new(0.5, 0, 0, 30)
                Valor.Size = UDim2.new(0.9, 0, 0, 30)
                Valor.Font = Enum.Font.GothamBold
                Valor.Text = opcion.Valor
                Valor.TextColor3 = Color3.fromRGB(255,255,255)
                Valor.TextSize = 28
                Valor.TextXAlignment = Enum.TextXAlignment.Center
            elseif opcion.Tipo == "MejoraUltimate" then
                local Fila = Instance.new("Frame")
                Fila.Parent = Contenido
                Fila.BackgroundColor3 = Color3.fromRGB(35, 30, 45)
                Fila.Size = UDim2.new(1, 0, 0, 54)
                Instance.new("UICorner", Fila).CornerRadius = UDim.new(0, 8)

                local Barra = Instance.new("Frame")
                Barra.Parent = Fila
                Barra.BackgroundColor3 = opcion.Completo and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(180, 40, 40)
                Barra.Position = UDim2.new(0, 4, 0.5, -18)
                Barra.Size = UDim2.new(0, 4, 0, 36)
                Instance.new("UICorner", Barra).CornerRadius = UDim.new(1, 0)

                local Nombre = Instance.new("TextLabel")
                Nombre.Parent = Fila
                Nombre.BackgroundTransparency = 1
                Nombre.Position = UDim2.new(0, 15, 0, 0)
                Nombre.Size = UDim2.new(0.7, 0, 1, 0)
                Nombre.Font = Enum.Font.Gotham
                Nombre.Text = opcion.Nombre
                Nombre.TextColor3 = Color3.fromRGB(230,230,230)
                Nombre.TextSize = 15
                Nombre.TextXAlignment = Enum.TextXAlignment.Left

                local Progreso = Instance.new("TextLabel")
                Progreso.Parent = Fila
                Progreso.BackgroundTransparency = 1
                Progreso.Position = UDim2.new(0, 15, 0.7, -12)
                Progreso.Size = UDim2.new(0.7, 0, 0, 16)
                Progreso.Font = Enum.Font.Gotham
                Progreso.Text = opcion.Progreso .. (opcion.Completo and " · ✅ Completo" or "")
                Progreso.TextColor3 = opcion.Completo and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(180, 40, 40)
                Progreso.TextSize = 12
                Progreso.TextXAlignment = Enum.TextXAlignment.Left

                local BtnMenos = Instance.new("TextButton")
                BtnMenos.Parent = Fila
                BtnMenos.BackgroundColor3 = Color3.fromRGB(60, 55, 70)
                BtnMenos.Position = UDim2.new(0.8, -35, 0.5, -12)
                BtnMenos.Size = UDim2.new(0, 24, 0, 24)
                BtnMenos.Font = Enum.Font.GothamBold
                BtnMenos.Text = "-"
                BtnMenos.TextColor3 = Color3.fromRGB(255,255,255)
                BtnMenos.TextSize = 16
                BtnMenos.AutoLocalize = false
                Instance.new("UICorner", BtnMenos).CornerRadius = UDim.new(4, 0)

                local Valor = Instance.new("TextLabel")
                Valor.Parent = Fila
                Valor.BackgroundTransparency = 1
                Valor.Position = UDim2.new(0.8, 0, 0.5, -10)
                Valor.Size = UDim2.new(0.1, 0, 0, 20)
                Valor.Font = Enum.Font.GothamBold
                Valor.Text = tostring(opcion.Nivel)
                Valor.TextColor3 = Color3.fromRGB(255,255,255)
                Valor.TextSize = 15
                Valor.TextXAlignment = Enum.TextXAlignment.Center

                local BtnMas = Instance.new("TextButton")
                BtnMas.Parent = Fila
                BtnMas.BackgroundColor3 = colorAcento
                BtnMas.Position = UDim2.new(0.95, -24, 0.5, -12)
                BtnMas.Size = UDim2.new(0, 24, 0, 24)
                BtnMas.Font = Enum.Font.GothamBold
                BtnMas.Text = "+"
                BtnMas.TextColor3 = Color3.fromRGB(255,255,255)
                BtnMas.TextSize = 16
                BtnMas.AutoLocalize = false
                Instance.new("UICorner", BtnMas).CornerRadius = UDim.new(4, 0)
            end
        end
    end

    -- 🏆 FIRMA FINAL
    local Firma = Instance.new("TextLabel")
    Firma.Parent = Ventana
    Firma.BackgroundTransparency = 1
    Firma.Position = UDim2.new(0.5, -150, 1, -28)
    Firma.Size = UDim2.new(0, 300, 0, 24)
    Firma.Font = Enum.Font.Gotham
    Firma.Text = "✨ Creado por: GoldGuerrero · v1.0 ✨"
    Firma.TextColor3 = Color3.fromRGB(140, 140, 140)
    Firma.TextSize = 12
    Firma.TextXAlignment = Enum.TextXAlignment.Center

    return Ventana
end

-- ==================================================
-- 📋 MENÚ PRINCIPAL
-- ==================================================
local function CrearMenuPrincipal()
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(22, 18, 28)
    MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    MainFrame.BorderSizePixel = 2
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -220)
    MainFrame.Size = UDim2.new(0, 550, 0, 440)
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 18)

    -- 🏆 TÍTULO
    local Titulo = Instance.new("TextLabel")
    Titulo.Parent = MainFrame
    Titulo.BackgroundTransparency = 1
    Titulo.Position = UDim2.new(0.5, -200, 0, 15)
    Titulo.Size = UDim2.new(0, 400, 0, 32)
    Titulo.Font = Enum.Font.GothamBold
    Titulo.Text = "⚔️ GoldGuerrero Hub — Muscle Legends ⚔️"
    Titulo.TextColor3 = Color3.fromRGB(255, 215, 0)
    Titulo.TextSize = 22
    Titulo.TextXAlignment = Enum.TextXAlignment.Center

    local Linea = Instance.new("Frame")
    Linea.Parent = MainFrame
    Linea.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Linea.Position = UDim2.new(0.05, 0, 0, 55)
    Linea.Size = UDim2.new(0.90, 0, 0, 2)

    -- 📂 BOTONES PRINCIPALES
    local Botones = {
        {Nombre = "⚡ Fast Glitch 90", Color = Color3.fromRGB(255, 50, 50), Funcion = function() MainFrame:Destroy() CrearVentanaPestanas("⚡ Fast Glitch 90", {{Nombre="Rocks", Opciones={{Tipo="Interruptor",Nombre="Golpear Rocas Auto",Valor=Estados.FastGlitch.AutoRocks,Callback=function(v) Estados.FastGlitch.AutoRocks=v end}},{Tipo="Interruptor",Nombre="Fuerza Doble",Valor=Estados.FastGlitch.FuerzaDoble,Callback=function(v) Estados.FastGlitch.FuerzaDoble=v end}},{Tipo="Interruptor",Nombre="Sin Retraso",Valor=Estados.FastGlitch.SinRetraso,Callback=function(v) Estados.FastGlitch.SinRetraso=v end}}},{Nombre="Ajustes", Opciones={{Tipo="Deslizador",Nombre="Velocidad de Ataque",Valor=5,Min=1,Max=50}}}, Color3.fromRGB(255,50,50)) end},
        {Nombre = "🏋️ Entrenamiento", Color = Color3.fromRGB(0, 200, 100), Funcion = function() MainFrame:Destroy() CrearVentanaPestanas("🏋️ Entrenamiento", {{Nombre="Entrenar", Opciones={{Tipo="Interruptor",Nombre="Auto Weight",Valor=Estados.Entrenamiento.AutoWeight,Callback=function(v) Estados.Entrenamiento.AutoWeight=v end}},{Tipo="Interruptor",Nombre="Auto Pushups",Valor=Estados.Entrenamiento.AutoPushups,Callback=function(v) Estados.Entrenamiento.AutoPushups=v end}},{Tipo="Interruptor",Nombre="Lock Position",Valor=Estados.Entrenamiento.LockPosition,Callback=function(v) Estados.Entrenamiento.LockPosition=v end}},{Tipo="Interruptor",Nombre="Auto Rebirths",Valor=Estados.Entrenamiento.AutoRebirths,Callback=function(v) Estados.Entrenamiento.AutoRebirths=v end}}},{Nombre="Misc", Opciones={{Tipo="Interruptor",Nombre="Fly",Valor=Estados.Entrenamiento.Fly,Callback=function(v) Estados.Entrenamiento.Fly=v end}},{Tipo="Deslizador",Nombre="Fly Speed",Valor=Estados.Entrenamiento.FlySpeed,Min=1,Max=50},{Tipo="Interruptor",Nombre="Stars ON/OFF",Valor=Estados.Entrenamiento.Stars,Callback=function(v) Estados.Entrenamiento.Stars=v end}},{Tipo="Deslizador",Nombre="Anti Lag %",Valor=Estados.Entrenamiento.AntiLag,Min=0,Max=100},{Tipo="Interruptor",Nombre="Activar Anti AFK",Valor=Estados.Entrenamiento.AntiAFK,Callback=function(v) Estados.Entrenamiento.AntiAFK=v end}},{Tipo="Interruptor",Nombre="Reclamar TODO",Valor=Estados.Entrenamiento.ReclamarTodo,Callback=function(v) Estados.Entrenamiento.ReclamarTodo=v end}}}}, Color3.fromRGB(0,200,100)) end},
        {Nombre = "🎯 Kills", Color = Color3.f
