local zombies = game:GetService("Workspace").Zombies
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = false
local RunService = game:GetService("RunService")


getfenv().lock = "Head" -- Head or Hitbox or Random

fov = 9e9;
local fovCircle = true;
local st = tonumber(tick());
warn("Loading script...")

if fovCircle then
function createcircle()
    local a=Drawing.new('Circle');a.Transparency=1;a.Thickness=1.5;a.Visible=true;a.Color=Color3.fromRGB(0,255,149);a.Filled=false;a.Radius=fov;
    return a;
end;  
local fovc = createcircle();
spawn(function()
    RunService:BindToRenderStep("FovCircle",1,function()
        fovc.Position = Vector2.new(mouse.X,mouse.Y)
    end);
end);
end;

-- function isFfa()
-- local am = #Players:GetChildren();
-- local amm = 0;
-- for i , v in pairs(Players:GetChildren()) do
-- if v.Team == LocalPlayer.Team then
-- amm = amm + 1;
-- end;
-- end;
-- return am == amm;
--end;
function getnearest()
local nearestmagnitude = math.huge
local nearestenemy = nil
local vector = nil
--local ffa = isFfa();
for i,v in next, zombies:GetChildren() do
if v and  v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
local vector, onScreen = Camera:WorldToScreenPoint(v["HumanoidRootPart"].Position)
if onScreen then
local ray = Ray.new(
Camera.CFrame.p,
(v["Head"].Position-Camera.CFrame.p).unit*500
)
local ignore = {
LocalPlayer.Character,
}
local hit,position,normal=workspace:FindPartOnRayWithIgnoreList(ray,ignore)
if hit and hit:FindFirstAncestorOfClass("Model") and zombies:FindFirstChild(hit:FindFirstAncestorOfClass("Model").Name)then
local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
if magnitude < nearestmagnitude and magnitude <= fov then
nearestenemy = v
nearestmagnitude = magnitude
end
end
end
end
end
return nearestenemy
end



local meta = getrawmetatable(game)
setreadonly(meta, false)
local oldNamecall = meta.__namecall
meta.__namecall = newcclosure(function(...)
    
local method = getnamecallmethod()
local args = {...}
if string.find(method,'Ray') then
if target then
    if args[1].Name ~= "Workspace" then
            print(args[1])
        end;
args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target.Position + Vector3.new(0,(workspace.CurrentCamera.CFrame.Position-target.Position).Magnitude/500,0) - workspace.CurrentCamera.CFrame.Position).unit * 5000)
end
end
return oldNamecall(unpack(args))
end)

warn("Script loaded!\nTime taken: "..math.abs(tonumber(tick())-st))
RunService:BindToRenderStep("SilentAim",1,function()
if UserInputService:IsMouseButtonPressed(0) and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Players.LocalPlayer.Character.Humanoid.Health > 0 then
local enemy = getnearest()
if enemy and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then                
local vector, onScreen = Camera:WorldToScreenPoint(enemy["Head"].Position)
local head = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
local vector, onScreen = Camera:WorldToScreenPoint(enemy["HumanoidRootPart"].Position)
local hitbox = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
if head <= hitbox then
magnitude = head
else
magnitude = hitbox;
end;
if getfenv().lock == "Head" then
target = workspace.Zombies[enemy.Name]["Head"]
else
if getfenv().lock == "Random" then
if magnitude == hitbox then
target = zombies[enemy.Name]["HumanoidRootPart"];
else
target = zombies[enemy.Name]["Head"]
end;
else
target = zombies[enemy.Name]["HumanoidRootPart"];
end;

end;
else
target = nil
end
end
end)