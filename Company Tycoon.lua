_G.loop = true
if _G.loop == true then 
while _G.loop do
wait(0.1)
local args = {
    [1] = 85.1,
    [2] = "TextButton",
    [3] = "Instance"
}

game:GetService("ReplicatedStorage").ClickMoney:InvokeServer(unpack(args))

game:GetService("ReplicatedStorage").CollectMoney:InvokeServer()

end
end