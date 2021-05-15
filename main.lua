require "src.imports"

local mouseX, mouseY

function love.load()
    math.randomseed(os.time())
    Crosshair:new()
    Player:new()
end

function love.update( dt )
    mouseX, mouseY = love.mouse.getPosition()
    for i = #bullets, 1, -1 do
        bullets[i]:update( dt )
        if bullets[i].opacity >= 2 then
            table.remove( bullets, i )
        end
    end
    for i = 1, #enemies do
        enemies[i]:update(dt)
    end
    enemyManager:update()
    Crosshair:update( mouseX, mouseY, dt )
    Player:update( dt )
end

function love.draw()
    love.graphics.setColor(1,1,1)
    love.graphics.print('Placar: '.. Player.score)
    for i = 1, #bullets do
        bullets[i]:draw()
    end
    for i = 1, #enemies do
        enemies[i]:draw()
    end
    Player:draw()
    Crosshair:draw()
end
