local Spoof = 1e+12

game:GetService("Players").localPlayer.Inventory:FindFirstChild("Bottle").Value = 
game.Players.localPlayer.Inventory:FindFirstChild("Bottle").Value .. Spoof

game:GetService("Players").localPlayer.Inventory:FindFirstChild("VIP").Value = 
not game.Players.localPlayer.Inventory:FindFirstChild("VIP").Value

print("Done!!")
