local colors = require 'colors'

local _ = {}

local interesting_keys = {
	up=true, down=true, left=true, right=true
}
function _:key_press(key)
	if interesting_keys[key] then
		self[key] = true
	end
	if key == 'v' then
		local newcolor = self.color == colors.blue and colors.red or colors.blue
		self:set_color(newcolor)
		self:init_visual_rectangle(newcolor.visual)
	end
end

function _:key_release(key)
	if interesting_keys[key] then
		self[key] = false
	end
end

return _

