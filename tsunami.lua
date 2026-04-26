-- Tsunami Survival Script
-- Made by hazar-kun | github.com/hazar-kun
-- Kodu inceleyebilirsiniz ama kopyalamayın 🌊

local tsunami = script.Parent
local tsunamiSpeed = 100        -- hareket hızı
local resetDistance = 865       -- başa dönme mesafesi
local direction = Vector3.new(0, 0, 1)
local startPosition = tsunami.Position

-- Tsunami hareketi
spawn(function()
	while true do
		tsunami.Position = tsunami.Position + direction * tsunamiSpeed * 0.03
		
		local traveled = (Vector3.new(tsunami.Position.X, 0, tsunami.Position.Z) 
			- Vector3.new(startPosition.X, 0, startPosition.Z)).Magnitude
		
		if traveled >= resetDistance then
			tsunami.Position = startPosition
		end
		
		wait(0.03)
	end
end)

-- Oyuncuya değince ölme
tsunami.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		humanoid.Health = 0
	end
end)
