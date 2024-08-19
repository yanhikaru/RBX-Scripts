local mt = getrawmetatable(game);
local old = mt.__namecall
local readonly = setreadonly or make_writeable

local MarketplaceService = game:GetService("MarketplaceService");

readonly(mt, false);

mt.__namecall = function(self, ...)
   local args = {...}
   local method = table.remove(args)

   if (self == MarketplaceService and method:find("UserOwnsGamePassAsync")) then
       return true and 1
   end

   return old(self, ...)
end
