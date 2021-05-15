local Enemy = require "src.prefabs.enemy"
require "src.physics.collision"

enemies = {}

enemyManager = {}
enemyManager.spawnMultiplier = 1
enemyManager.spawnCap = 3
enemyManager.pool = 10
function enemyManager.spawnEnemy()
    table.insert(enemies, Enemy())
end

function enemyManager:update()
    if  math.random() < 0.01 * self.spawnMultiplier and
        #enemies < self.spawnCap and
        self.pool > 0 then
        enemyManager.spawnEnemy()
        self.pool = self.pool - 1
    end
end

function enemyManager:setStatus(mult, cap, pool)
    self.spawnCap = cap
    self.spawnMultiplier = mult
    self.pool = pool
end

function enemyManager:collisionCheck(dot)
    for i = 1, #enemies, 1 do
        if dotIsColliding(dot, enemies[i]) then
            local enemyHealth = enemies[i]:damage()
            if enemyHealth <= 0 then
                Player:setScore(enemies[i].score)
                table.remove(enemies, i)
            end
            return 1
        end
    end
    return 2
end
