local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunEvent = ReplicatedStorage:WaitForChild("RunEvent")
local RunService = game:GetService("RunService")


game.Players.PlayerAdded:Connect(function(player)
	local playerFolder = Instance.new("Folder")
	playerFolder.Name = "PlayerData"
	playerFolder.Parent = player
	
	local stamina = Instance.new("IntValue")
	stamina.Name = "Stamina"
	stamina.Value = 100
	stamina.Parent = playerFolder
	
	local maxStamina = Instance.new("IntValue")
	maxStamina.Name = "MaxStamina"
	maxStamina.Value = 100
	maxStamina.Parent = playerFolder
	
	local isRunning = Instance.new("BoolValue")
	isRunning.Name = "IsRunning"
	isRunning.Value = false
	isRunning.Parent = playerFolder
	
	local LastUpdate = tick()
	task.wait(2.5)
	RunService.Heartbeat:Connect(function()
		local character = player.Character
		local humanoid = character:WaitForChild("Humanoid")
		if not humanoid then return end
		
		if tick() - LastUpdate >= 0.1 then
			LastUpdate = tick()
			
			if isRunning.Value == true then
				if stamina.Value > 0 then
					humanoid.WalkSpeed = 25
					stamina.Value = math.max(stamina.Value - 1, 0)
				else
					isRunning.Value = false
					humanoid.WalkSpeed = 16
				end
			else
				humanoid.WalkSpeed = 16
				stamina.Value = math.min(stamina.Value + 0.5, maxStamina.Value)
			end
		end
	end)
end)

RunEvent.OnServerEvent:Connect(function(player, run)
	local data = player:FindFirstChild("PlayerData")
	if data then
		local isRunning = data:FindFirstChild("IsRunning")
		if isRunning then
			isRunning.Value = run
		end
	end
end)

