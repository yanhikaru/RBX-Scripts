local values = {
    Spoof = true,
}
local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if values.Spoof and method == "InvokeServer" and 
	    tostring(self) == "RemoteName" and args[1] == "Arg1" then
        args[2] = "Arg2"
        return namecall(self, args[1], args[2])
    end
    return namecall(self, ...)
end)
