local Object = require "modules.classic"

local bullet = Object:extend()

function bullet:new(x, y)
    self.x = x
    self.y = y
    self.r = 3
end

function bullet:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill", self.x, self.y, self.r)
end

return bullet