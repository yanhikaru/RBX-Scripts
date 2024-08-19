_G.loop = true
if _G.loop == true then 
    while _G.loop do
        wait(0.1)

        local A_1 = "PistolAmmo"
        local A_2 = true
        local Event = game:GetService("ReplicatedStorage").GeneralEvents.BuyItem
        Event:InvokeServer(A_1, A_2)

        local args = {
            [1] = "Dynamite",
            [2] = true
        }

        game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer(unpack(args))
    end
end
