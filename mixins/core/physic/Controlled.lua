local _ = {}

function _:init_physic_control(speed)
	self.up = false
	self.down = false
	self.left = false
	self.right = false
	self.target_angle = 0
	self.speed = speed
end

function _:update_physic_control(dt)
	local moving = false

	local dx, dy = self.body:get_linear_velocity()
	local oldspeed = math.abs(dx)+math.abs(dy)

	do
		local dx, dy = 0, 0
		if self.up then
			dy = dy - 1
		end
		if self.down then
			dy = dy + 1
		end
		if self.left then
			dx = dx - 1
		end
		if self.right then
			dx = dx + 1
		end

		local d = math.sqrt(dx^2 + dy^2)
		if d ~= 0 then
			dx = dx / d
			dy = dy / d
			moving = true
		end

		if moving then
			self.body:set_linear_velocity(dx*self.speed, dy*self.speed)
		end
		do
			local desire_angle = self.target_angle --math.atan2(dy, dx) % (math.pi*2)
			local angle = (self.body:get_angle()) % (math.pi*2)
			-- little hack to make angle works as expected (search shorter angle)
			local delta1 = desire_angle - angle
			local delta2 = desire_angle - math.pi*2 - angle
			local delta3 = desire_angle - (angle-math.pi*2)
			local delta_angle = delta1
			for _, d in ipairs({delta1, delta2, delta3}) do
				if math.abs(d) < math.abs(delta_angle) then
					delta_angle = d
				end
			end
			self.body:set_angular_velocity(delta_angle*15)
		end
	end
end

return _

