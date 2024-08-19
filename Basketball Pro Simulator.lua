local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "InvokeServer" and tostring(self) == "RF" and args[1] == "Shoot" then
        args[2] = "Green"
        return namecall(self, unpack(args))
    end
    return namecall(self, ...)
end)
setreadonly(gm, true)