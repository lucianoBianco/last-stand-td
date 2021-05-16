local scene = {}

local mouseX, mouseY

function scene:load()
    local enemyStatus = {mult = 1, cap = 3, pool = 10}
    enemyManager:setStatus(enemyStatus.mult, enemyStatus.cap, enemyStatus.pool)

    Crosshair:new()
end

function scene.update(dt)
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

    mouseX, mouseY = love.mouse.getPosition()
    Crosshair:update( mouseX, mouseY, dt )
end

function scene.draw()
    for i = 1, #bullets do
        bullets[i]:draw()
    end

    for i = 1, #enemies do
        enemies[i]:draw()
    end

    Crosshair:draw()
end

return scene