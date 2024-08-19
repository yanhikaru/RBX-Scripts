local mt = getrawmetatable(game);
setreadonly(mt, false)
local old_index = mt.__index;

mt.__index = function(a, b)
    if tostring(a) == "isActive" 
        then
        if tostring(b) == "Value" 
            then
            return "true";
        end
    end
    return old_index(a, b);
end
mt.__index = function(c, d)
    if tostring(c) == "timeLeft" 
        then
        if tostring(d) == "Value" 
            then
            return 1e+16;
        end
    end
    return old_index(c, d);
end
local value = 
";autoclicker;;autorebirth;;doubleclicks;;autorebirths;;superlucky;;luckychances;;magiceggs;"

game.Players.LocalPlayer.Data.gamepasses.Value = 
game.Players.LocalPlayer.Data.gamepasses.Value .. value

