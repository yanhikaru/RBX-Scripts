--net by stan / activeware
spawn(function()
   while true do game:GetService("RunService").Heartbeat:wait()
       settings().Physics.AllowSleep = false
       settings().Physics.ThrottleAdjustTime = math.huge-math.huge
setsimulationradius(1e9, 1e9)
           game:GetService("RunService").Stepped:wait()
   end
end)
