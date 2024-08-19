repeat
	wait()
until game:IsLoaded() 
and game.Players 
and game.Players.LocalPlayer 
and game.Players.LocalPlayer.Character

local function calculatevelo(PlayerPart)
	local currentPosition = PlayerPart.Position
	wait(0.1)
	local newPosition = PlayerPart.Position
	local positionDiff = newPosition - currentPosition

	return positionDiff / 0.1
end
