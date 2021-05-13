local Bullet = require "src.prefabs.bullet"
local bulletManager = {}

bullets = {}

function bulletManager.spawnBullet(x, y, precision, color)
    local spreadx = math.random(-precision, precision)
    local spready = math.random(-precision, precision)
    table.insert(bullets, Bullet(x + spreadx, y + spready, color))
end

return bulletManager