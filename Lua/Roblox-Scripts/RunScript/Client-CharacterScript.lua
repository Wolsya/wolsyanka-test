local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunEvent = ReplicatedStorage:WaitForChild("RunEvent")
local UIS = game:GetService("UserInputService")

UIS.inputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		RunEvent:FireServer(true)
	end
end)

UIS.inputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		RunEvent:fireServer(false)
	end
end)


