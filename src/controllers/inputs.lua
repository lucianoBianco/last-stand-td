local bulletManager = require "src.motors.bulletManager"

function love.keypressed(key)
    if key == "space" then
        hello()
    end
end

function love.mousepressed( x, y, button, istouch, presses )
    bulletManager.spawnBullet(x,y, Crosshair.currPrecision * 10)
    Crosshair:fire()
    Player:fire()
end