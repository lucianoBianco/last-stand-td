local Enemy = require "src.prefabs.enemy"

enemyManager = {}
enemies = {}

function enemyManager.spawnEnemy()
    table.insert(enemies, Enemy())
end

function enemyManager.update()
    local rand = math.random()
    if (rand < 0.01) then
        enemyManager.spawnEnemy()
    end
end

