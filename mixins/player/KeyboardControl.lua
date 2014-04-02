local _ = {}

function _:mouse_motion(x, y, dx, dy)
	local angle = math.atan2(y - H / 2, x - W / 2)
	self.target_angle = angle
end

function _:mouse_press(x, y, b)
	self.fire = true
end

function _:mouse_release(x, y, b)
	self.fire = false
end

return _

