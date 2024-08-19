local list = require(game:GetService("ReplicatedStorage").GunScripts.GunStats)
for i,v in pairs(list) do
v.Spread = 0
v.prepTime = 0
v.ReloadSpeed = 0
v.BulletSpeed = 9e9
v.HipFireAccuracy = 0
v.ZoomAccuracy = 0
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua"))()
