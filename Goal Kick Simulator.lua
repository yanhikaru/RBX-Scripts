local Ha = game.PlaceId

if Ha == 9281034297 then
	local gm = getrawmetatable(game)
	setreadonly(gm, false)
	local namecall = gm.__namecall
	gm.__namecall = newcclosure(function(self, ...)
    	local method = getnamecallmethod()
    	local args = {...}
    	if method == "InvokeServer" and 
	    	tostring(self) == "RemoteFunction" and args[1] == "Throw" then
        	args[2] = math.huge
        	return namecall(self, unpack(args))
    	end
    	return namecall(self, ...)
	end)
	setreadonly(gm, true)
end
