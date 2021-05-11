require "src.imports"

local mouseX, mouseY

function love.load()
    Crosshair:new()
end

function love.update( dt )
    mouseX, mouseY = love.mouse.getPosition()
    Crosshair:update( mouseX, mouseY, dt )
end

function love.draw()
    for i = 1, #bullets do
        bullets[i]:draw()
    end
    Crosshair:draw()
end
