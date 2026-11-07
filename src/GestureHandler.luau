--!strict
local UserInputService = game:GetService("UserInputService")

export type SwipeDirection = "Up" | "Down" | "Left" | "Right"

local GestureHandler = {}
GestureHandler.__index = GestureHandler

function GestureHandler.new(minSwipeDist: number?, maxSwipeTime: number?)
	return setmetatable({
		_startPos = Vector2.zero,
		_startTime = 0,
		_minSwipeDist = minSwipeDist or 45,
		_maxSwipeTime = maxSwipeTime or 0.35,
		_connBegan = nil :: RBXScriptConnection?,
		_connEnded = nil :: RBXScriptConnection?,
	}, GestureHandler)
end

function GestureHandler:BindSwipe(onSwipe: (direction: SwipeDirection, velocity: number) -> ())
	self._connBegan = UserInputService.TouchStarted:Connect(function(touch: InputObject, gameProcessed: boolean)
		if gameProcessed then return end
		self._startPos = Vector2.new(touch.Position.X, touch.Position.Y)
		self._startTime = os.clock()
	end)

	self._connEnded = UserInputService.TouchEnded:Connect(function(touch: InputObject, gameProcessed: boolean)
		if gameProcessed then return end
		local dt = os.clock() - self._startTime
		if dt <= 0 or dt > self._maxSwipeTime then return end

		local endPos = Vector2.new(touch.Position.X, touch.Position.Y)
		local delta = endPos - self._startPos
		local dist = delta.Magnitude
		if dist < self._minSwipeDist then return end

		local velocity = dist / dt
		if math.abs(delta.X) > math.abs(delta.Y) then
			onSwipe(if delta.X > 0 then "Right" else "Left", velocity)
		else
			onSwipe(if delta.Y > 0 then "Down" else "Up", velocity)
		end
	end)
end

function GestureHandler:Destroy()
	if self._connBegan then self._connBegan:Disconnect() end
	if self._connEnded then self._connEnded:Disconnect() end
end

return GestureHandler

