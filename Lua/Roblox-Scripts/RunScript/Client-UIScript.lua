local Frame = script.Parent
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

local function update()
	local player = game.Players.LocalPlayer
	local stamina = player:WaitForChild("PlayerData"):WaitForChild("Stamina")
	local tween = TweenService:Create(Frame, tweenInfo, {Size = UDim2.new(stamina.Value / 100, 0, 1, 0)})
	tween:Play()
end

game.Players.LocalPlayer:WaitForChild("PlayerData"):WaitForChild("Stamina").Changed:Connect(update)
update()