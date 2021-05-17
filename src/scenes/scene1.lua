local bulletManager = require "src.motors.bulletManager"

local scene = {}
local loaded1, loaded2 = false, false

function scene:load()
    local enemyStatus = {mult = 1, cap = 3, pool = 10}
    enemyManager:setStatus(enemyStatus.mult, enemyStatus.cap, enemyStatus.pool)

    loaded1 = Player:new()

    loaded2 = Crosshair:new()

    if loaded1 and loaded2 then return true end
end

function scene:update(dt, mouseX, mouseY)
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

    Player:update( dt )
    Crosshair:update( dt, mouseX, mouseY )

    if #enemies == 0 and enemyManager.pool == 0 then
        sceneManager:openScene("src.scenes.mainMenu")
    end
end

function scene:draw()
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

function scene:keypressed(key)

end

function scene:mousepressed(x, y, button, istouch, presses)
    local bx, by = bulletManager.spawnBullet(x,y, Crosshair.currPrecision * 10)
    Crosshair:fire()
    Player:fire()
end

return scene