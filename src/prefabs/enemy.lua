local Object = require "modules.classic"
local enemy = Object:extend()

function enemy:new(x, y)
    self.x = x or math.random(0, 700)
    self.y = y or -100
    self.speed = 20
end

function enemy:update(dt)
    self.x = self.x + math.random(-1, 1) * math.random()
    self.y = self.y + self.speed * dt
end
function enemy:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('line', self.x, self.y, 100, 200)
end

return enemy