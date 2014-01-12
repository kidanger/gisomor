local colors = require 'colors'

local _ = {}

_.SPEED_BOOST = 4

local interesting_keys = {
	up=true, down=true, left=true, right=true
}
function _:key_press(key)
	if key == 'v' then
		local newcolor = self.color == colors.blue and colors.red or colors.blue
		self:set_color(newcolor)
		self:init_visual_rectangle(newcolor.visual_character)
	elseif key == 'c' and not self._boosting then
		self.speed = self.speed * self.SPEED_BOOST
		self._boosting = true
	elseif interesting_keys[key] then
		self[key] = true
	end
end

function _:key_release(key)
	if key == 'c' then
		self.speed = self.speed / self.SPEED_BOOST
		self._boosting = false
	elseif interesting_keys[key] then
		self[key] = false
	end
end

return _

