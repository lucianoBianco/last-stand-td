local Bullet = require "src.prefabs.bullet"
local bulletManager = {}

bullets = {}

function bulletManager.spawnBullet(x, y, precision)
    local spreadx = math.random(-precision, precision)
    local spready = math.random(-precision, precision)
    local finalPosX = x + spreadx
    local finalPosY = y + spready
    local color = enemyManager:collisionCheck({x = finalPosX, y = finalPosY})
    table.insert(bullets, Bullet(finalPosX, finalPosY, color))
end

return bulletManager