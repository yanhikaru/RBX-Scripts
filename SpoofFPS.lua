--[[ max spoofed framerate ]]
local FR = math.huge

--[[ error margin in FPS ]]
local EM = 5

local function GetTypeSpoofer()
	local TypeSpoofer = { Spoofed = {} }
	function TypeSpoofer:SpoofType(cloned, type)
		self.Spoofed[cloned] = type
	end
	function TypeSpoofer:Init()
		local Orig
		Orig = hookfunction(typeof, function(t)
			local spoofedType = self.Spoofed[t]
			return spoofedType or Orig(t)
		end)
	end
	return TypeSpoofer
end

local TypeSpoofer = GetTypeSpoofer()
TypeSpoofer:Init()

local function GetConnectionSpoofer() 
	local ConnSpoofer = {SpoofedTypes = {}}
	function ConnSpoofer:SpoofConnection(type, signal, callback)
		local Entry = self.SpoofedTypes[type] 
		local CS = {}
		if not Entry then
			local JMT = getrawmetatable(type)

			Entry = {MT = JMT, MCS = CS}
			self.SpoofedTypes[type] = Entry

			local OIdx = JMT.__index
			local RO = isreadonly(JMT)
			setreadonly(JMT, false)
			JMT.__index = newcclosure(function(t, k)
				local V = CS[k]
				return V or OIdx(t, k)
			end)
			setreadonly(JMT, RO)
		else
			CS = Entry.MCS
		end

		local Signal = type[signal]
		local OMT = getrawmetatable(Signal)

		local FakeSignal = newproxy(true)
		CS[signal] = FakeSignal
		
        local Connections = {}
        
        local Handler = Signal:Connect(function(...)
			for I, V in next, Connections do
				callback(V, ...)
			end
		end)
		local OCMT = getrawmetatable(Handler)

		local DisconnectHandler = newcclosure(function(connection)
			Connections[connection] = nil
		end)

		local ConnectHandler = newcclosure(function(_, func)
			local FakeConnection = newproxy(true)
            Connections[FakeConnection] = func
            
			local NFMT = {}
			for I, V in next, OCMT do
				NFMT[I] = newcclosure(function(t, ...)
					return V(Handler, ...)
				end)
			end
			NFMT.__index = newcclosure(function(t, k)
				if (typeof(k) == 'string') then
					if k == 'Disconnect' or k == 'disconnect' then return DisconnectHandler end
					if k == 'Connected' or k == 'connected' then return Connections[FakeConnection] or false end
				end
				return OMT.__index(t, k)
			end)
			debug.setmetatable(FakeConnection, NFMT)
			TypeSpoofer:SpoofType(FakeConnection, "RBXScriptConnection")
			return FakeConnection
        end)
        
        local Unpack = unpack
        local WaitHandler = newcclosure(function()
            local Results
            local Orig
            Orig = ConnectHandler(nil, function(...)
                Orig:Disconnect()
                Results = {...}
            end)
            Signal:Wait()
            return Unpack(Results)
        end)

		local FMT = {}
		for I, V in next, OMT do
			FMT[I] = newcclosure(function(t, ...)
				return V(connection, ...)
			end)
		end
        FMT.__index = newcclosure(function(t, k)
            if (typeof(k) == 'string') then
                if k == 'Connect' or k == 'connect' then return ConnectHandler end
                if k == 'Wait' or k == 'wait' then return WaitHandler end
			end
			return OMT.__index(t, k)
		end)
		debug.setmetatable(FakeSignal, FMT)
		TypeSpoofer:SpoofType(FakeSignal, "RBXScriptSignal")
	end
	return ConnSpoofer
end

local ConnectionSpoofer = GetConnectionSpoofer()

local TDelta = tick()
local _, WDelta = wait()

local TStart = TDelta - WDelta

hookfunction(tick, function() return TDelta end)

local OWait
OWait = hookfunction(wait, function(t) 
	local r, w = OWait(t)
	return r, TDelta - TStart
end)

local Rand = math.random
local CFR = FR

local Started = false
local RS = game:GetService("RunService")

RS.RenderStepped:Connect(function()
    CFR = 1 / (FR - (Rand() * EM))
    TDelta = TDelta + CFR
end)

ConnectionSpoofer:SpoofConnection(RS, 'Heartbeat', function(conn)
	conn(CFR)
end)

ConnectionSpoofer:SpoofConnection(RS, 'RenderStepped', function(conn)
	conn(CFR)
end)

local WMT = getrawmetatable(game:GetService("Workspace"))
local OWIndex = WMT.__index

local FRHandler = newcclosure(function() return CFR end)
local WRO = isreadonly(WMT)

setreadonly(WMT, false)
WMT.__index = newcclosure(function(w, k)
    if typeof(k) == 'string' then
        if k == 'GetRealPhysicsFPS' then return FRHandler end
    end
    return OWIndex(w, k)
end)
setreadonly(WMT, WRO)