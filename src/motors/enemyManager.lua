local Enemy = require "src.prefabs.enemy"
local tick = require "modules.tick"
require "src.physics.collision"

enemies = {}

enemyManager = {}
enemyManager.status = 1
enemyManager.spawning = false
-- enemyManager.spawnMultiplier = 1
enemyManager.spawnCap = { 1, 2, nil }
enemyManager.pool = { 2, 2, 2 }
local frame = 0

function enemyManager.spawnEnemy()
    table.insert(enemies, Enemy())
end

local function spanwWave(num)
    local self = enemyManager;
    if num > 0 then
        self.spawnEnemy()
        tick.delay(function ()
            spanwWave(num-1)
        end, 0.5)
    else 
        self.spawning = false
    end
end

local function handleWave()
    local self = enemyManager;
    if self.pool[self.status] == 0 then self.status = self.status + 1 end
    local cap = self.spawnCap[self.status] or 9999999
    if not self.pool[self.status] then return false end
    local rest = self.pool[self.status] - cap
    local tempCap = 0

    if rest >= 0 then
        tempCap = cap
    else
        tempCap = rest + cap
    end
    if tempCap > 0 then
        self.pool[self.status] = self.pool[self.status] - tempCap
        self.spawning = true
        spanwWave(tempCap)
    end
    return true
end


function enemyManager:update(dt)

    tick.update(dt)
    if #enemies == 0 and not self.spawning then
        return handleWave()
    end

    return true
end


function enemyManager:setStatus(mult, cap, pool)
    self.status = 1
    self.spawnCap = cap
    -- self.spawnMultiplier = mult
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
