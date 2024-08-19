_G.loop = true
if _G.loop == true then 
while _G.loop do
wait(0.1)
local args = {
    [1] = "rep",
    [2] = workspace.machinesFolder:FindFirstChild("Bench Press").interactSeat
}

game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))

end
end