local settings = {repeatamount = 4} --Amount of repeat

local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" or method == "InvokeServer" then
		if tostring(self) == "Changed" and args[1] == "ThrottleSign" then --Specify remote to duplicate
			for i = 1,settings.repeatamount do
				namecall(self, unpack(args)) --Start repeating
			end
		end
    end
    return namecall(self, ...)
end)
setreadonly(gm, true)
print("Duplicated!")

-- Known remotes --
-- Fishing sim {MonsterHit}
-- All of us are dead {WeaponHit}
-- WestBound {Hit, Inventory, SkinAnimal}
-- SwordBurst 2 {Event (args[1] == "Combat")} 2 max
-- Driving simulator {Changed (args[1] == "ThrottleSign")}
