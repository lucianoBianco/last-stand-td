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
    Crosshair:draw()
end

function love.mousepressed( x, y, button, istouch, presses )
    Crosshair:fire()
end