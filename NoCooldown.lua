local cooldown; 
Cooldown =
hookfunction(wait, function (v)
	v = nil
	return Cooldown(v)
end)
