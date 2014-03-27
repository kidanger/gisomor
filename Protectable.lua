local _ = {}

local colors = require 'colors'

function _:init()
    self.is_protected = false
end

function _:update_protectable(dt)
    self.is_protected = true
    for _, n in ipairs(self.nodes[self.color.opposite] or {}) do
        if n.color == self.color.opposite then
            self.is_protected = false
        end
    end
end

return _

