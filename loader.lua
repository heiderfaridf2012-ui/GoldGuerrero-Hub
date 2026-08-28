-- ==================================================
-- 🦾 GOLDGUERRERO HUB — RECREACIÓN EXACTA A LA IMAGEN
-- 📱 Tamaño: 580×380 | Barra deslizante | Estilo 1:1
-- ==================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- ⚙️ TAMAÑO EXACTO DE LA IMAGEN
local ANCHO = 580
local ALTO = 380
local ANCHO_SIDEBAR = 180

-- 📦 CREAR INTERFAZ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 🪟 VENTANA PRINCIPAL
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Size = UDim2.new(0, ANCHO, 0, ALTO)
MainWindow.Position = UDim2.new(0.5, -ANCHO/2, 0.5, -ALTO/2)
MainWindow.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
MainWindow.BorderSizePixel = 2
MainWindow.BorderColor3 = Color3.fromRGB(70, 150, 255)
MainWindow.ClipsDescendants = true
MainWindow.Parent = ScreenGui

-- 🎭 ÍCONO CENTRAL SUPERIOR
local IconoCentral = Instance.new("Frame")
IconoCentral.Name = "IconoCentral"
IconoCentral.Size = UDim2.new(0, 50, 0, 50)
IconoCentral.Position = UDim2.new(0.5, -25, 0, -25)
IconoCentral.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
IconoCentral.BorderSizePixel = 2
IconoCentral.BorderColor3 = Color3.fromRGB(70, 150, 255)
IconoCentral.CornerRadius = UDim.new(0, 8)
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
TituloTexto.Size = UDim2.new(0, 200, 1, 0)
TituloTexto.Position = UDim2.new(0, 15, 0, 0)
TituloTexto.BackgroundTransparency = 1
TituloTexto.Text = "GoldGuerrero Hub"
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
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.AutoLocalize = false
    btn.Parent = TituloBar
    return btn
end

local btnMin = BotonVentana(-100, "─")
local btnMax = BotonVentana(-60, "□")
local btnClose = BotonVentana(-20, "✕")
btnClose.TextColor3 = Color3.fromRGB(255, 80, 80)

-- 📂 BARRA LATERAL IZQUIERDA
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, ANCHO_SIDEBAR, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainWindow

-- 📋 ITEMS DEL MENÚ LATERAL — EXACTOS A LA IMAGEN
local seccionActiva = "Main"
local function CrearItemLateral(nombre, icono, posY, activo)
    local item = Instance.new("TextButton")
    item.Name = nombre
    item.Size = UDim2.new(1, -10, 0, 45)
    item.Position = UDim2.new(0, 5, 0, posY)
    item.BackgroundColor3 = activo and Color3.fromRGB(40, 100, 180) or Color3.fromRGB(25, 28, 38)
    item.BorderSizePixel = 0
    item.CornerRadius = UDim.new(0, 6)
    item.Text = "  " .. icono .. "  " .. nombre
    item.TextColor3 = Color3.fromRGB(255, 255, 255)
    item.Font = Enum.Font.Gotham
    item.TextSize = 14
    item.TextXAlignment = Enum.TextXAlignment.Left
    item.AutoLocalize = false
    item.Parent = Sidebar
    
    item.MouseButton1Click:Connect(function()
        seccionActiva = nombre
        for _, v in pairs(Sidebar:GetChildren()) do
            if v:IsA("TextButton") then
                v.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
            end
        end
        item.BackgroundColor3 = Color3.fromRGB(40, 100, 180)
        ActualizarContenido(nombre)
    end)
    
    return item
end

-- ✅ ITEMS EXACTOS DE LA IMAGEN
local itemInfo = CrearItemLateral("Information", "🔔", 10, false)
local itemMain = CrearItemLateral("Main", "🏠", 65, true)
local itemAutoBuy = CrearItemLateral("Auto Buy", "🛒", 120, false)
local itemAutoStuff = CrearItemLateral("Auto Stuff", "⚙️", 175, false)
local itemAutoFarm = CrearItemLateral("Auto Farm", "📊", 230, false)
local itemRebirth = CrearItemLateral("Rebirth", "🔄", 285, false)
local itemKiller = CrearItemLateral("Killer", "⚔️", 340, false)

-- 📄 ÁREA DERECHA CON BARRA DESLIZANTE ✅
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -ANCHO_SIDEBAR - 20, 1, -60)
ContentArea.Position = UDim2.new(0, ANCHO_SIDEBAR + 15, 0, 55)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainWindow

-- 🔧 SCROLLINGFRAME — BARRA DESLIZANTE
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.ScrollBarColor3 = Color3.fromRGB(70, 150, 255)
ScrollingFrame.ScrollBarPosition = Enum.ScrollBarPosition.Right
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Parent = ContentArea

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 12)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame

local TituloSeccion = Instance.new("TextLabel")
TituloSeccion.Name = "TituloSeccion"
TituloSeccion.Size = UDim2.new(1, 0, 0, 50)
TituloSeccion.BackgroundTransparency = 1
TituloSeccion.Text = "Main"
TituloSeccion.TextColor3 = Color3.fromRGB(255, 255, 255)
TituloSeccion.Font = Enum.Font.GothamBold
TituloSeccion.TextSize = 32
TituloSeccion.TextXAlignment = Enum.TextXAlignment.Left
TituloSeccion.LayoutOrder = 0
TituloSeccion.Parent = ScrollingFrame

-- 🏷️ ETIQUETA "Main Features"
local EtiquetaFeatures = Instance.new("TextLabel")
EtiquetaFeatures.Name = "EtiquetaFeatures"
EtiquetaFeatures.Size = UDim2.new(1, 0, 0, 30)
EtiquetaFeatures.BackgroundTransparency = 1
EtiquetaFeatures.Text = "Main Features"
EtiquetaFeatures.TextColor3 = Color3.fromRGB(200, 200, 200)
EtiquetaFeatures.Font = Enum.Font.GothamBold
EtiquetaFeatures.TextSize = 18
EtiquetaFeatures.TextXAlignment = Enum.TextXAlignment.Left
EtiquetaFeatures.LayoutOrder = 1
EtiquetaFeatures.Parent = ScrollingFrame

-- BOTONES DERECHA — IGUALES A LA IMAGEN
local botonesContenido = {}
local function CrearBotonDerecho(texto, orden)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 55)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.fromRGB(70, 150, 255)
    btn.CornerRadius = UDim.new(0, 6)
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 15
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.AutoLocalize = false
    btn.LayoutOrder = orden
    
    local flecha = Instance.new("TextLabel")
    flecha.Size = UDim2.new(0, 25, 1, 0)
    flecha.Position = UDim2.new(1, -30, 0, 0)
    flecha.BackgroundTransparency = 1
    flecha.Text = "›"
    flecha.TextColor3 = Color3.fromRGB(150, 150, 150)
    flecha.Font = Enum.Font.GothamBold
    flecha.TextSize = 24
    flecha.Parent = btn
    
    btn.Parent = ScrollingFrame
    table.insert(botonesContenido, btn)
    return btn
end

-- 📋 CARGAR BOTONES DE LA SECCIÓN MAIN
CrearBotonDerecho("Copy", 2)
CrearBotonDerecho("Copy All Code", 3)
CrearBotonDerecho("Copy All Code", 4)
CrearBotonDerecho("Copy All Code", 5)

-- 🔄 ACTUALIZAR CONTENIDO AL CAMBIAR SECCIÓN
function ActualizarContenido(nombre)
    TituloSeccion.Text = nombre
    for _, v in pairs(botonesContenido) do v:Destroy() end
    botonesContenido = {}
    
    if nombre == "Main" then
        EtiquetaFeatures.Visible = true
        CrearBotonDerecho("Copy", 2)
        CrearBotonDerecho("Copy All Code", 3)
        CrearBotonDerecho("Copy All Code", 4)
        CrearBotonDerecho("Copy All Code", 5)
    else
        EtiquetaFeatures.Visible = false
        for i = 1, 6 do
            CrearBotonDerecho("Opción " .. i, i)
        end
    end
end

-- 🖱️ ARRASTRAR VENTANA
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

print("✅ GoldGuerrero Hub — Cargado con éxito!")
-- ==================================================
