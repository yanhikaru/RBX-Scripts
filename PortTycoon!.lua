local Spoof = 1e+25

game:GetService("Players").localPlayer.Stats:FindFirstChild("Verified").Value = 
not game.Players.localPlayer.Stats:FindFirstChild("Verified").Value

game:GetService("Players").localPlayer.Stats:FindFirstChild("CashBoost").Value = 
game.Players.localPlayer.Stats:FindFirstChild("CashBoost").Value .. Spoof

print("Done!!")

--CashBoost
--Verified
