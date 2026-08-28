-- 🦾 MUSCLE LEGENDS HUB | VERSIÓN PARA CELULAR 📱
-- Tamaño ideal: 620×380 | Botones grandes | Fácil de usar con dedo

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- ⚙️ TAMAÑO IDEAL PARA CELULAR (NO MUY GRANDE, NO MUY PEQUEÑO)
local ANCHO = 620
local ALTO = 380

-- CREAR INTERFAZ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MuscleLegendsHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🪟 VENTANA PRINCIPAL
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Size = UDim2.new(0, ANCHO, 0, ALTO)
MainWindow.Position = UDim2.new(0.5, -ANCHO/2, 0.5, -ALTO/2)
MainWindow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainWindow.BorderSizePixel = 2
MainWindow.BorderColor3 = Color3.fromRGB(255, 255, 255)
MainWindow.ClipsDescendants = true
MainWindow.Parent = ScreenGui

-- 🎭 ÍCONO CENTRAL SUPERIOR
local IconoCentral = Instance.new("Frame")
IconoCentral.Name = "IconoCentral"
IconoCentral.Size = UDim2.new(0, 50, 0, 50)
IconoCentral.Position = UDim2.new(0.5, -25, 0, -25)
IconoCentral.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
IconoCentral.BorderSizePixel = 2
IconoCentral.BorderColor3 = Color3.fromRGB(60, 140, 220)
IconoCentral.CornerRadius = UDim.new(0, 10)
IconoCentral.Parent = MainWindow

local ImagenIcono = Instance.new("ImageLabel")
ImagenIcono.Size = UDim2.new(0, 36, 0, 36)
ImagenIcono.Position = UDim2.new(0.5, -18, 0.5, -18)
ImagenIcono.BackgroundTransparency = 1
ImagenIcono.Image = "rbxassetid://13336093871"
ImagenIcono.Parent = IconoCentral

-- 📝 BARRA DE TÍTULO
local TituloBar = Instance.new("Frame")
TituloBar.Name = "TituloBar"
TituloBar.Size = UDim2.new(1, 0, 0, 50)
TituloBar.BackgroundTransparency = 1
TituloBar.Parent = MainWindow

local TituloTexto = Instance.new("TextLabel")
TituloTexto.Name = "TituloTexto"
TituloTexto.Size = UDim2.new(0, 180, 1, 0)
TituloTexto.Position = UDim2.new(0, 15, 0, 0)
TituloTexto.BackgroundTransparency = 1
TituloTexto.Text = "Muscle Legends"
TituloTexto.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloTexto.Font = Enum.Font.GothamBold
TituloTexto.TextSize = 18
TituloTexto.TextXAlignment = Enum.TextXAlignment.Left
TituloTexto.Parent = TituloBar

-- BOTONES DE VENTANA ─ □ ✕
local function BotonVentana(posX, texto)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = UDim2.new(1, posX, 0.5, -15)
    btn.BackgroundTransparency = 1
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.AutoLocalize = false
    btn.Parent = TituloBar
    return btn
end

local btnMin = BotonVentana(-90, "─")
local btnMax = BotonVentana(-55, "□")
local btnClose = BotonVentana(-20, "✕")
btnClose.TextColor3 = Color3.fromRGB(255, 80, 80)

-- 📂 BARRA LATERAL IZQUIERDA
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 160, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainWindow

-- 📋 ITEMS DEL MENÚ LATERAL (GRANDES PARA DEDO)
local seccionActiva = "Main"
local function CrearItemLateral(nombre, icono, posY, activo)
    local item = Instance.new("TextButton")
    item.Name = nombre
    item.Size = UDim2.new(1, -15, 0, 48) -- ALTOS PARA CELULAR
    item.Position = UDim2.new(0, 8, 0, posY)
    item.BackgroundColor3 = activo and Color3.fromRGB(40, 90, 160) or Color3.fromRGB(25, 25, 25)
    item.BorderSizePixel = 0
    item.CornerRadius = UDim.new(0, 8)
    item.Text = "  " .. icono .. "  " .. nombre
    item.TextColor3 = Color3.fromRGB(240, 240, 240)
    item.Font = Enum.Font.Gotham
    item.TextSize = 14
    item.TextXAlignment = Enum.TextXAlignment.Left
    item.AutoLocalize = false
    item.Parent = Sidebar
    
    item.MouseButton1Click:Connect(function()
        seccionActiva = nombre
        for _, v in pairs(Sidebar:GetChildren()) do
            if v:IsA("TextButton") then
                v.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            end
        end
        item.BackgroundColor3 = Color3.fromRGB(40, 90, 160)
        ActualizarContenido(nombre)
    end)
    
    return item
end

-- CREAR TODOS LOS ITEMS (IGUAL A LA IMAGEN)
local itemInfo = CrearItemLateral("Information", "🔔", 5, false)
local itemMain = CrearItemLateral("Main", "🏠", 63, true)
local itemAutoBuy = CrearItemLateral("Auto Buy", "🛒", 121, false)
local itemAutoStuff = CrearItemLateral("Auto Stuff", "⚙️", 179, false)
local itemAutoFarm = CrearItemLateral("Auto Farm", "📊", 237, false)
local itemRebirth = CrearItemLateral("Rebirth", "🔄", 295, false)
local itemKiller = CrearItemLateral("Killer", "⚔️", 353, false)

-- 📄 ÁREA DE CONTENIDO DERECHA
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -180, 1, -60)
ContentArea.Position = UDim2.new(0, 175, 0, 55)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainWindow

local TituloSeccion = Instance.new("TextLabel")
TituloSeccion.Name = "TituloSeccion"
TituloSeccion.Size = UDim2.new(1, 0, 0, 45)
TituloSeccion.Position = UDim2.new(0, 0, 0, 0)
TituloSeccion.BackgroundTransparency = 1
TituloSeccion.Text = "Main"
TituloSeccion.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloSeccion.Font = Enum.Font.GothamBold
TituloSeccion.TextSize = 28
TituloSeccion.TextXAlignment = Enum.TextXAlignment.Left
TituloSeccion.Parent = ContentArea

-- BOTONES DE CONTENIDO (GRANDES PARA CELULAR)
local botonesContenido = {}
local function CrearBotonDerecho(texto, posY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 52) -- ALTOS PARA TOCAR
    btn.Position = UDim2.new(0, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(60, 140, 220)
    btn.CornerRadius = UDim.new(0, 8)
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 15
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.AutoLocalize = false
    
    local flecha = Instance.new("TextLabel")
    flecha.Size = UDim2.new(0, 25, 1, 0)
    flecha.Position = UDim2.new(1, -30, 0, 0)
    flecha.BackgroundTransparency = 1
    flecha.Text = "›"
    flecha.TextColor3 = Color3.fromRGB(150, 150, 150)
    flecha.Font = Enum.Font.GothamBold
    flecha.TextSize = 22
    flecha.Parent = btn
    
    btn.Parent = ContentArea
    table.insert(botonesContenido, btn)
    return btn
end

-- ACTUALIZAR CONTENIDO AL CAMBIAR SECCIÓN
function ActualizarContenido(nombre)
    TituloSeccion.Text = nombre
    for _, v in pairs(botonesContenido) do v:Destroy() end
    botonesContenido = {}
    
    if nombre == "Main" then
        CrearBotonDerecho("Copy", 55)
        local etiqueta = Instance.new("TextLabel")
        etiqueta.Size = UDim2.new(1, 0, 0, 30)
        etiqueta.Position = UDim2.new(0, 0, 0, 115)
        etiqueta.BackgroundTransparency = 1
        etiqueta.Text = "Main Features"
        etiqueta.TextColor3 = Color3.fromRGB(200, 200, 200)
        etiqueta.Font = Enum.Font.GothamBold
        etiqueta.TextSize = 16
        etiqueta.TextXAlignment = Enum.TextXAlignment.Left
        etiqueta.Parent = ContentArea
        table.insert(botonesContenido, etiqueta)
        CrearBotonDerecho("Copy All Code", 150)
        CrearBotonDerecho("Copy All Code", 212)
        CrearBotonDerecho("Copy All Code", 274)
    elseif nombre == "Auto Farm" then
        CrearBotonDerecho("Activar Auto Farm", 55)
        CrearBotonDerecho("Velocidad: 90", 117)
        CrearBotonDerecho("Rango de recolección", 179)
    elseif nombre == "Rebirth" then
        CrearBotonDerecho("Auto Rebirth", 55)
        CrearBotonDerecho("Solo cuando supere", 117)
    end
end

-- CARGAR SECCIÓN PRINCIPAL
ActualizarContenido("Main")

-- 🖱️ ARRASTRAR CON DEDO (FUNCIONA EN PANTALLA TÁCTIL)
local drag, inicioPos, inicioCursor
TituloBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        drag = true
        inicioPos = MainWindow.Position
        inicioCursor = UIS:GetMouseLocation()
    end
end)
TituloBar.InputEnded:Connect(function() drag = false end)
RunService.RenderStepped:Connect(function()
    if drag then
        local delta = UIS:GetMouseLocation() - inicioCursor
        MainWindow.Position = UDim2.new(
            inicioPos.X.Scale, inicioPos.X.Offset + delta.X,
            inicioPos.Y.Scale, inicioPos.Y.Offset + delta.Y
        )
    end
end)

-- ❌ CERRAR
btnClose.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ Muscle Legends Hub | CELULAR LISTO! 📱")
