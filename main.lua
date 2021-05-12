require "src.imports"

local mouseX, mouseY

function love.load()
    math.randomseed(os.time())
    Crosshair:new()
    Player:new()
end

function love.update( dt )
    mouseX, mouseY = love.mouse.getPosition()
    Crosshair:update( mouseX, mouseY, dt )
    Player:update(dt)
end

function love.draw()
    for i = 1, #bullets do
        bullets[i]:draw()
    end
    Player:draw()
    Crosshair:draw()
end
