-- ==================================================
-- MUSCLE LEGENDS - GOLDGUERRERO HUB (CON ANTI-AFK SEGURO)
-- ==================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Ventana principal del menú
local Window = Rayfield:CreateWindow({
   Name = "Muscle Legends | GoldGuerrero Hub",
   LoadingTitle = "Iniciando GoldGuerrero Hub...",
   LoadingSubtitle = "Modo Anti-Kick & Ahorro",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- Crear Pestaña Misc
local MiscTab = Window:CreateTab("Misc & Stats", 4483362458)

-- Integración del Anti-AFK Seguro
MiscTab:CreateToggle({
   Name = "Anti-AFK Ultra Seguro (Indetectable)",
   CurrentValue = true,
   Flag = "ToggleSafeAntiAFK",
   Callback = function(Value)
      getgenv().AntiAFK_Activo = Value
   end,
})

spawn(function()
   local VirtualUser = game:GetService("VirtualUser")
   local LocalPlayer = game:GetService("Players").LocalPlayer
   
   LocalPlayer.Idled:Connect(function()
      if getgenv().AntiAFK_Activo then
         VirtualUser:CaptureController()
         VirtualUser:ClickButton1(Vector2.new(0, 0))
         print("[🛡️ GoldGuerrero] Anti-AFK ejecutado con éxito.")
      end
   end)
end)
