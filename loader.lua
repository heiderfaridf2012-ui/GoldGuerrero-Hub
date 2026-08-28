-- ==================================================
--        ⚔️ GOLD GUERRERO HUB — TAMAÑO 325×300
--  ✅ 📐 ANCHO 325px — COMPACTO, NO ESTORBA
--  ✅ 📏 ALTO 300px — PROPORCIONAL A LA FOTO
--  ✅ 📂 BARRA 95px — ESTRECHITA, TODO CABE
--  ✅ 🔤 TEXTO CLARO — SIN CORTAR, SIN LETRAS RARAS
--  ✅ ⬛ CUADRITOS CON FLECHA › — BIEN ALINEADOS
--  ✅ 👁️ OJO 👁️ — ABRE/CIERRA, SIEMPRE IGUAL
--  ✅ 🇪🇸 TODO EN ESPAÑOL | 100% TUYO
-- ==================================================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ✅ BORRA DUPLICADOS
if PlayerGui:FindFirstChild("GoldGuerreroHub") then
    PlayerGui.GoldGuerreroHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GoldGuerreroHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 100

-- 🎨 COLORES
local Colores = {
    FondoVentana = Color3.fromRGB(22, 22, 30),
    FondoBarraLateral = Color3.fromRGB(16, 16, 24),
    FondoBotonDerecha = Color3.fromRGB(32, 32, 44),
    Borde = Color3.fromRGB(55, 55, 75),
    AcentoAzul = Color3.fromRGB(65, 135, 255),
    AcentoRojo = Color3.fromRGB(225, 55, 55),
    Texto = Color3.fromRGB(255, 255, 255),
    TextoGris = Color3.fromRGB(145, 145, 165)
}

-- 👁️ OJITO
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

-- 📦 VENTANA — 325×300 ✅ TAMAÑO QUE PEDISTE
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Parent = ScreenGui
MainWindow.BackgroundColor3 = Colores.FondoVentana
MainWindow.BorderColor3 = Colores.Borde
MainWindow.BorderSizePixel = 1
MainWindow.Position = UDim2.new(0.5, -162, 0.5, -150)
MainWindow.Size = UDim2.new(0, 325, 0, 300)
MainWindow.Active = true
MainWindow.Draggable = true
MainWindow.Visible = false
Instance.new("UICorner", MainWindow).CornerRadius = UDim.new(0, 8)

-- 🔄 ABRIR/CIERRA
local MenuAbierto = false
BtnOjo.MouseButton1Click:Connect(function()
    MenuAbierto = not MenuAbierto
    MainWindow.Visible = MenuAbierto
end)

-- 🏷️ TÍTULO — SOLO TU NOMBRE
local TituloVentana = Instance.new("TextLabel")
TituloVentana.Parent = MainWindow
TituloVentana.BackgroundTransparency = 1
TituloVentana.Position = UDim2.new(0, 10, 0, 8)
TituloVentana.Size = UDim2.new(0, 180, 0, 20)
TituloVentana.Font = Enum.Font.GothamBold
TituloVentana.Text = "GoldGuerrero Hub"
TituloVentana.TextColor3 = Colores.Texto
TituloVentana.TextSize = 13

-- 🪟 BOTONES − □ ×
local BtnMin = Instance.new("TextButton")
BtnMin.Parent = MainWindow
BtnMin.BackgroundTransparency = 1
BtnMin.Position = UDim2.new(1, -70, 0, 6)
BtnMin.Size = UDim2.new(0, 16, 0, 16)
BtnMin.Font = Enum.Font.GothamBold
BtnMin.Text = "−"
BtnMin.TextColor3 = Colores.TextoGris
BtnMin.TextSize = 14
BtnMin.MouseButton1Click:Connect(function()
    MainWindow.Visible = false
    MenuAbierto = false
end)

local BtnSquare = Instance.new("TextButton")
BtnSquare.Parent = MainWindow
BtnSquare.BackgroundTransparency = 1
BtnSquare.Position = UDim2.new(1, -48, 0, 6)
BtnSquare.Size = UDim2.new(0, 16, 0, 16)
BtnSquare.Font = Enum.Font.GothamBold
BtnSquare.Text = "□"
BtnSquare.TextColor3 = Colores.TextoGris
BtnSquare.TextSize = 11

local BtnCerrar = Instance.new("TextButton")
BtnCerrar.Parent = MainWindow
BtnCerrar.BackgroundTransparency = 1
BtnCerrar.Position = UDim2.new(1, -24, 0, 6)
BtnCerrar.Size = UDim2.new(0, 16, 0, 16)
BtnCerrar.Font = Enum.Font.GothamBold
BtnCerrar.Text = "×"
BtnCerrar.TextColor3 = Colores.AcentoRojo
BtnCerrar.TextSize = 15
BtnCerrar.MouseButton1Click:Connect(function()
    MainWindow.Visible = false
    MenuAbierto = false
end)

-- 📏 LÍNEA SEPARADORA
local Separador = Instance.new("Frame")
Separador.Parent = MainWindow
Separador.BackgroundColor3 = Colores.Borde
Separador.Position = UDim2.new(0, 0, 0, 35)
Separador.Size = UDim2.new(1, 0, 0, 1)

-- 📂 BARRA LATERAL — 95px ✅ ESTRECHITA
local BarraLateral = Instance.new("Frame")
BarraLateral.Parent = MainWindow
BarraLateral.BackgroundColor3 = Colores.FondoBarraLateral
BarraLateral.Position = UDim2.new(0, 0, 0, 36)
BarraLateral.Size = UDim2.new(0, 95, 1, -36)

local SeparadorVertical = Instance.new("Frame")
SeparadorVertical.Parent = MainWindow
SeparadorVertical.BackgroundColor3 = Colores.Borde
SeparadorVertical.Position = UDim2.new(0, 95, 0, 36)
SeparadorVertical.Size = UDim2.new(0, 1, 1, -36)

-- 📄 ÁREA DE CONTENIDO
local AreaContenido = Instance.new("Frame")
AreaContenido.Parent = MainWindow
AreaContenido.BackgroundTransparency = 1
AreaContenido.Position = UDim2.new(0, 100, 0, 36)
AreaContenido.Size = UDim2.new(1, -105, 1, -36)

-- Título de sección
local TituloSeccion = Instance.new("TextLabel")
TituloSeccion.Parent = AreaContenido
TituloSeccion.BackgroundTransparency = 1
TituloSeccion.Position = UDim2.new(0, 5, 0, 5)
TituloSeccion.Size = UDim2.new(0, 200, 0, 24)
TituloSeccion.Font = Enum.Font.GothamBold
TituloSeccion.Text = "🏠 Main"
TituloSeccion.TextColor3 = Colores.Texto
TituloSeccion.TextSize = 18

-- ⚙️ VARIABLES
local BotonesLateral = {}
local SeccionActiva = "Main"

-- 📦 FUNCIÓN BOTÓN LATERAL — TEXTO CLARO
local function CrearPestana(Nombre, Icono, ContenidoFunc)
    local Btn = Instance.new("TextButton")
    Btn.Parent = BarraLateral
    Btn.BackgroundTransparency = 1
    Btn.Size = UDim2.new(1, 0, 0, 34)
    Btn.Font = Enum.Font.Gotham
    Btn.Text = Icono .. "\n" .. Nombre
    Btn.TextColor3 = Nombre == "Main" and Colores.Texto or Colores.TextoGris
    Btn.TextSize = 10
    Btn.TextWrapped = true
    Btn.AutoLocalize = false

    local Barrita = Instance.new("Frame")
    Barrita.Parent = Btn
    Barrita.BackgroundColor3 = Nombre == "Main" and Colores.AcentoAzul or Color3.fromRGB(60,60,80)
    Barrita.Position = UDim2.new(0, 0, 0.5, -10)
    Barrita.Size = UDim2.new(0, 2, 0, 20)

    BotonesLateral[Nombre] = {Btn = Btn, Barrita = Barrita, Contenido = ContenidoFunc}

    Btn.MouseButton1Click:Connect(function()
        if BotonesLateral[SeccionActiva] then
            BotonesLateral[SeccionActiva].Btn.TextColor3 = Colores.TextoGris
            BotonesLateral[SeccionActiva].Barrita.BackgroundColor3 = Color3.fromRGB(60,60,80)
        end
        SeccionActiva = Nombre
        Btn.TextColor3 = Colores.Texto
        Barrita.BackgroundColor3 = Colores.AcentoAzul
        TituloSeccion.Text = Icono .. " " .. Nombre
        for _, v in pairs(AreaContenido:GetChildren()) do
            if v ~= TituloSeccion then v:Destroy() end
        end
        ContenidoFunc()
    end)
end

-- 📦 FUNCIÓN BOTÓN DERECHO — CUADRITO CON FLECHA
local function CrearBotonDerecho(texto, funcion)
    local BtnFrame = Instance.new("Frame")
    BtnFrame.BackgroundColor3 = Colores.FondoBotonDerecha
    BtnFrame.BorderColor3 = Colores.Borde
    BtnFrame.BorderSizePixel = 1
    BtnFrame.Size = UDim2.new(1, -10, 0, 40)
    Instance.new("UICorner", BtnFrame).CornerRadius = UDim.new(0, 5)

    local TextoBtn = Instance.new("TextLabel")
    TextoBtn.Parent = BtnFrame
    TextoBtn.BackgroundTransparency = 1
    TextoBtn.Position = UDim2.new(0, 12, 0, 0)
    TextoBtn.Size = UDim2.new(0.8, 0, 1, 0)
    TextoBtn.Font = Enum.Font.Gotham
    TextoBtn.Text = texto
    TextoBtn.TextColor3 = Colores.Texto
    TextoBtn.TextSize = 11
    TextoBtn.TextXAlignment = Enum.TextXAlignment.Left

    local Flecha = Instance.new("TextLabel")
    Flecha.Parent = BtnFrame
    Flecha.BackgroundTransparency = 1
    Flecha.Position = UDim2.new(0.92, 0, 0, 0)
    Flecha.Size = UDim2.new(0, 12, 1, 0)
    Flecha.Font = Enum.Font.GothamBold
    Flecha.Text = "›"
    Flecha.TextColor3 = Colores.TextoGris
    Flecha.TextSize = 16

    local BtnClick = Instance.new("TextButton")
    BtnClick.Parent = BtnFrame
    BtnClick.BackgroundTransparency = 1
    BtnClick.Size = UDim2.new(1, 0, 1, 0)
    BtnClick.Text = ""
    BtnClick.MouseButton1Click:Connect(funcion)

    return BtnFrame
end

-- ==================================================
-- 📋 SECCIONES
-- ==================================================

CrearPestana("Main", "🏠", function()
    local Texto = Instance.new("TextLabel")
    Texto.Parent = AreaContenido
    Texto.BackgroundTransparency = 1
    Texto.Position = UDim2.new(0, 10, 0, 35)
    Texto.Size = UDim2.new(1, -20, 0, 220)
    Texto.Font = Enum.Font.Gotham
    Texto.Text = [[
⚔️ GoldGuerrero Hub
Versión 1.0.0

Selecciona una opción ⬅️
]]
    Texto.TextColor3 = Colores.TextoGris
    Texto.TextSize = 11
    Texto.TextWrapped = true
end)

CrearPestana("Entrenar", "🏋️", function()
    local y = 35
    for _, opcion in pairs({"Pesas pequeñas", "Pesas medianas", "Pesas grandes", "Auto entrenar"}) do
        local Btn = CrearBotonDerecho(opcion, function() end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 5, 0, y)
        y += 46
    end
end)

CrearPestana("Peleas", "⚡", function()
    local y = 35
    for _, opcion in pairs({"Auto unirse", "Auto farmear", "Portal pelea"}) do
        local Btn = CrearBotonDerecho(opcion, function() end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 5, 0, y)
        y += 46
    end
end)

CrearPestana("Teleport", "🌍", function()
    local y = 35
    for _, opcion in pairs({"Gimnasio inicial", "Piedra", "Hierro", "Oro"}) do
        local Btn = CrearBotonDerecho(opcion, function() end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 5, 0, y)
        y += 46
    end
end)

CrearPestana("Renacer", "🔄", function()
    local y = 35
    for _, opcion in pairs({"Auto renacer", "Mantener mascotas", "Mantener pesas"}) do
        local Btn = CrearBotonDerecho(opcion, function() end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 5, 0, y)
        y += 46
    end
end)

CrearPestana("Mascotas", "🐾", function()
    local y = 35
    for _, opcion in pairs({"Mejor mascota", "Lista", "Auras gratis"}) do
        local Btn = CrearBotonDerecho(opcion, function() end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 5, 0, y)
        y += 46
    end
end)

CrearPestana("Ajustes", "⚙️", function()
    local y = 35
    for _, opcion in pairs({"Notificaciones", "Sonidos", "Reiniciar"}) do
        local Btn = CrearBotonDerecho(opcion, function() end)
        Btn.Parent = AreaContenido
        Btn.Position = UDim2.new(0, 5, 0, y)
        y += 46
    end
end)

-- ✅ ACTIVAR MAIN POR DEFECTO
task.wait(0.1)
BotonesLateral.Main.Btn.TextColor3 = Colores.Texto
BotonesLateral.Main.Barrita.BackgroundColor3 = Colores.AcentoAzul

print("✅ GoldGuerrero Hub — 325×300 — LISTO ✅")
