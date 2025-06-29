local inputservice = game:GetService("UserInputService")
local players = game:GetService("Players")
local coregui = game:GetService("CoreGui")
local localplayer = players.LocalPlayer
local enabled = false
local strength = 0
local dragging, dinput, dstart, spos
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScreenGui"
screenGui.Parent = coregui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
frame.BorderSizePixel = 0
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.Size = UDim2.fromOffset(140, 120)
frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dstart = input.Position
		spos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dinput = input
	end
end)
inputservice.InputChanged:Connect(function(input)
	if input == dinput and dragging then
		local delta = input.Position - dstart
		frame.Position = UDim2.new(spos.X.Scale, spos.X.Offset + delta.X, spos.Y.Scale, spos.Y.Offset + delta.Y)
	end
end)
local uIStroke = Instance.new("UIStroke")
uIStroke.Name = "UIStroke"
uIStroke.Color = Color3.fromRGB(32, 32, 32)
uIStroke.Parent = frame
local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.Parent = frame
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.Font = Enum.Font.SourceSans
textLabel.Text = "R E X"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 22
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.BorderSizePixel = 0
textLabel.Position = UDim2.new(0.5, 0, 0, 15)
textLabel.Size = UDim2.fromOffset(10, 10)
local uIStroke1 = Instance.new("UIStroke")
uIStroke1.Name = "UIStroke"
uIStroke1.Color = Color3.fromRGB(75, 75, 75)
uIStroke1.Thickness = 0.3
uIStroke1.Parent = textLabel
textLabel.Parent = frame
local frame1 = Instance.new("Frame")
frame1.Name = "Frame"
frame1.AnchorPoint = Vector2.new(0.5, 0)
frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame1.BackgroundTransparency = 1
frame1.BorderSizePixel = 0
frame1.Position = UDim2.new(0.5, 0, 0, 30)
frame1.Size = UDim2.new(1, -30, 0, 0)
local uIStroke2 = Instance.new("UIStroke")
uIStroke2.Name = "UIStroke"
uIStroke2.Color = Color3.fromRGB(48, 48, 48)
uIStroke2.LineJoinMode = Enum.LineJoinMode.Miter
uIStroke2.Parent = frame1
frame1.Parent = frame
local textBox = Instance.new("TextBox")
textBox.Name = "TextBox"
textBox.Font = Enum.Font.SourceSans
textBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 90)
textBox.PlaceholderText = "Delta time"
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextSize = 18
textBox.ClearTextOnFocus = false
textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
textBox.BorderColor3 = Color3.fromRGB(32, 32, 32)
textBox.ClipsDescendants = true
textBox.Position = UDim2.fromOffset(13, 40)
textBox.Size = UDim2.fromOffset(115, 25)
textBox.ZIndex = 2
textBox.Parent = frame
local textButton = Instance.new("TextButton")
textButton.Name = "TextButton"
textButton.Font = Enum.Font.SourceSansBold
textButton.Text = "Activate"
textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
textButton.TextSize = 22
textButton.TextWrapped = true
textButton.AnchorPoint = Vector2.new(0.5, 0)
textButton.BackgroundColor3 = Color3.fromRGB(94, 190, 94)
textButton.Position = UDim2.new(0.5, 0, 1, -10)
textButton.Size = UDim2.fromOffset(100, 25)
textButton.Parent = frame
local imageButton = Instance.new("ImageButton")
imageButton.Name = "ImageButton"
imageButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
imageButton.ImageTransparency = 1
imageButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
imageButton.BorderColor3 = Color3.fromRGB(32, 32, 32)
imageButton.Position = UDim2.fromOffset(103, 75)
imageButton.Size = UDim2.fromOffset(25, 25)
local textLabel1 = Instance.new("TextLabel")
textLabel1.Name = "TextLabel"
textLabel1.Font = Enum.Font.SourceSans
textLabel1.Text = "✓"
textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel1.TextSize = 25
textLabel1.TextWrapped = true
textLabel1.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel1.BackgroundTransparency = 1
textLabel1.BorderColor3 = Color3.fromRGB(27, 42, 53)
textLabel1.Position = UDim2.fromScale(0.5, 0.5)
textLabel1.Size = UDim2.new(1, 10, 1, 10)
textLabel1.Parent = imageButton
imageButton.Parent = frame
imageButton.MouseButton1Up:Connect(function()
	textLabel1.Visible = not textLabel1.Visible
end)
textButton.MouseButton1Up:Connect(function()
	enabled = textLabel1.Visible
	local num = tonumber(textBox.Text)
	if typeof(num) == "number" then
		if num > 500 then
			strength = 500
		elseif num < 0 then
			strength = 0
		else
			strength = num
		end
		textBox.Text = tostring(strength)
	end
end)
local textLabel2 = Instance.new("TextLabel")
textLabel2.Name = "TextLabel"
textLabel2.Font = Enum.Font.SourceSans
textLabel2.Text = "Enabled"
textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel2.TextSize = 18
textLabel2.TextXAlignment = Enum.TextXAlignment.Right
textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel2.BackgroundTransparency = 1
textLabel2.BorderSizePixel = 0
textLabel2.Position = UDim2.fromOffset(23, 75)
textLabel2.Size = UDim2.fromOffset(75, 25)
textLabel2.Parent = frame
frame.Parent = screenGui
local uis = game:GetService("UserInputService")
local keydown = uis.IsKeyDown
local kc = Enum.KeyCode.LeftShift
local kc2 = Enum.KeyCode.S
game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
	local k0down = keydown(uis, kc)
	local k1down = keydown(uis, kc2)
	if enabled and (k0down or k1down) then
		local character = localplayer.Character
		local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
		if typeof(humanoid) == "Instance" and typeof(humanoid.RootPart) == "Instance" and typeof(humanoid.SeatPart) == "Instance" then
			local rootpart = humanoid.RootPart
			local seatpart = humanoid.SeatPart
			local diff = 1 + 0.3 * deltaTime
			if k0down and not k1down then
				seatpart.AssemblyLinearVelocity *= Vector3.new(diff, 0.5, diff)
			elseif k1down and not k0down then
				seatpart.AssemblyLinearVelocity /= Vector3.new(diff, 2.5, diff)
			end
		end
	end
end)

--//Hide GUI for the 1st script //--
local Plr = game.Players.LocalPlayer

Plr:GetMouse().KeyDown:Connect(function(K)
    if K == "=" then
        frame.Visible = not frame.Visible
    end
end)
--//Hide GUI for the 1st script //--
