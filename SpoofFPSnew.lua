local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local WindowFocusedFunction = function()
	RunService:Set3dRenderingEnabled(true)
	setfpscap(math.huge)
	return
end

local Initialize = function()
	UserInputService.WindowFocused:Connect(WindowFocusedFunction)
	game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
	return
end
Initialize()

print("FPS UNLOCKED!!!")
