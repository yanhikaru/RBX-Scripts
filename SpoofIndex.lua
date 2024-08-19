local mt = getrawmetatable(game);
setreadonly(mt, false)
local old_index = mt.__index;

mt.__index = function(a, b)
    if tostring(a) == "Luck" 
        then
        if tostring(b) == "Value" 
            then
            return math.huge
        end
    end
    return old_index(a, b)
end
