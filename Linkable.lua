local drystal = require 'drystal'

local _ = {}

function _:init_linkable()
	self.nodes = {}
end

function _:link(node, tocolor)
	if not self.nodes[tocolor] then
		self.nodes[tocolor] = {}
	end
	table.insert(self.nodes[tocolor], node)
end

function _:draw_links()
	for c, nodes in pairs(self.nodes) do
		if not self:path_is_locked(c) then
			drystal.set_color(c.visual_character)
			for _, n in ipairs(nodes) do
				drystal.draw_line(self.x, self.y, n.x+10, n.y+10)
			end
		end
	end
end

return _

