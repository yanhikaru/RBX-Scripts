local mt = getrawmetatable(game);
setreadonly(mt, false)
local old_index = mt.__index;

while true do
	mt.__index = function(a, b)
    	if tostring(a) == "Ping" 
        	then
        	if tostring(b) == "Value" then
            	return 8
        	end
    	end
    	return old_index(a, b)
	end

	GetNetworkPing()
end
