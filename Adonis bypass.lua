getgenv().BypassSettings = {
   ["Crystal AntiCheat"] = true,
   ["Adonis"] = true,

   ["Anti-Obfuscated Scripts"] = false,-- CANNOT BE ENABLED WITH CRYSTAL This will block any obfuscated script on the client from running (Not executed by your exploit thought)
   ["Random"] = true, -- Will disallow scripts calling, GetPropertyChanged signal on WalkSpeed, JumpPower, Gravity, Health, LogService

   ["Enable Kill Logs"] = false, -- Say if you want to get told what's bypassed
}

loadstring(game:HttpGet("https://irisapp.ca/TheGoodSucc/iAntiCheat.lua"))()
