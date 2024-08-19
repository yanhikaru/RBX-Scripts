local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldIndex = gmt.__index

gmt.__index = newcclosure(function(a,b)
   if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" then
       return 16
   end

   return oldIndex(a,b)
end)

setreadonly(gmt, true)
