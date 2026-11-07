
--!strict
local TouchScaler = {}
local MIN_TOUCH_PX = 48

function TouchScaler.EnforceHitbox(button: GuiButton)
	local absSize = button.AbsoluteSize
	if absSize.X >= MIN_TOUCH_PX and absSize.Y >= MIN_TOUCH_PX then
		return
	end

	local padX = math.max(0, (MIN_TOUCH_PX - absSize.X) * 0.5)
	local padY = math.max(0, (MIN_TOUCH_PX - absSize.Y) * 0.5)

	local hitbox = button:FindFirstChild("_TouchHitbox") :: Frame?
	if not hitbox then
		local newHitbox = Instance.new("Frame")
		newHitbox.Name = "_TouchHitbox"
		newHitbox.BackgroundTransparency = 1
		newHitbox.Active = true
		newHitbox.Parent = button
		hitbox = newHitbox
	end

	if hitbox then
		hitbox.Size = UDim2.new(1, padX * 2, 1, padY * 2)
		hitbox.Position = UDim2.fromScale(0.5, 0.5)
		hitbox.AnchorPoint = Vector2.new(0.5, 0.5)
	end
end

return TouchScaler
