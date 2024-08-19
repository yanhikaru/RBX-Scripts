for i,v in next, workspace:GetDescendants() do
	if v:IsA("MeshPart") or v:IsA("UnionOperation") then
		sethiddenproperty(v, "RenderFidelity", "Automatic")
	end
end
