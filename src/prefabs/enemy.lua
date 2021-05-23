local Object = require "modules.classic"
local enemy = Object:extend()

function enemy:new(x, y, w, h)
    self.x = x or math.random(0, 14) * 50
    self.y = y or -100
    self.w = w or 100
    self.h = h or 200
    self.speed = 40
    self.health = 2
    self.score = 1
end

function enemy:update(dt)
    self.x = self.x + math.random(-1, 1) * math.random()
    self.y = self.y + self.speed * dt
end

function enemy:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
end

function enemy:damage(d)
    local damage = d or 1
    self.health = self.health - damage
    return self.health
end

return enemy