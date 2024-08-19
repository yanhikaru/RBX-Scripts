_G.Loop = true

spawn(function()
    while _G.Loop == true do
		local args = {
			[1] = "RequestCollectCash"
		}
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
        wait()
    end
end)

--// Spoofing //--
local Spoof = 1e+16

game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Tips").Value = 
game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Tips").Value .. Spoof

game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Speed").Value = 
game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Speed").Value .. Spoof

game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Stores").Value = 
game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Stores").Value .. Spoof

game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Decoration").Value = 
game:GetService("Players").localPlayer.RebirthTree:FindFirstChild("Decoration").Value .. Spoof

game:GetService("Players").localPlayer.Upgrades:FindFirstChild("CashID").Value = 
game:GetService("Players").localPlayer.Upgrades:FindFirstChild("CashID").Value .. Spoof

print("Done!!")
