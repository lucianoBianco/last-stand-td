require "src.utils.math"

local Object = require "modules.classic"

local bullet = Object:extend()

local colors = {{2, 0.2, 0.2}, {0.7, 0.5, 0}}

function bullet:new(x, y, color)
    self.x = x
    self.y = y
    self.r = 2
    self.opacity = 0
    self.color = color or 1
    self.splater = {}
    for i = 1, 200, 1 do
        table.insert(self.splater,{
            x = x,
            y = y,
            xSpeed = math.random(-5, 5) * math.random(),
            ySpeed = math.random(-5, 5) * math.random(),
        })
    end
end

function bullet:draw()
    love.graphics.setColor(colors[self.color][1] - self.opacity,colors[self.color][2] - self.opacity,colors[self.color][3] - self.opacity)
    for i = 1, #self.splater, 1 do
        love.graphics.circle("fill", self.splater[i].x, self.splater[i].y, self.r)
    end
end

function bullet:update(dt)
    for i = 1, #self.splater, 1 do
        self.splater[i].x = self.splater[i].x + self.splater[i].xSpeed / (self.color * 2)
        self.splater[i].y = self.splater[i].y + self.splater[i].ySpeed / (self.color * 2)
    end
    if self.opacity < 2  then
        self.opacity = self.opacity + dt * 6 / (self.color ^ 3)
    end
end

return bullet