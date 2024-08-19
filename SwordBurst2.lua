local Boost = 1e+16
local BigSword = "Berserker"
local Single = "Noble"

local Isgame = game.PlaceId

if Isgame != 659222129 then
	end
else
	game:GetService("ReplicatedStorage").Profiles.Abidex123:FindFirstChild("Boost").Value = 
	game.ReplicatedStorage.Profiles.Abidex123:FindFirstChild("Boost").Value .. Boost

	game:GetService("ReplicatedStorage").Profiles.Abidex123.AnimSettings:FindFirstChild("2HSword").Value = 
	game.ReplicatedStorage.Profiles.Abidex123.AnimSettings:FindFirstChild("2HSword").Value .. BigSword

	game:GetService("ReplicatedStorage").Profiles.Abidex123.AnimSettings:FindFirstChild("SingleSword").Value = 
	game.ReplicatedStorage.Profiles.Abidex123.AnimSettings:FindFirstChild("SingleSword").Value .. Single
end
