require "src.imports"

function love.load()
    math.randomseed(os.time())
    Player:new()
    sceneManager:load()
    sceneManager:init()
end

function love.update( dt )
    sceneManager:update(dt)
    Player:update( dt )
end

function love.draw()
    love.graphics.setColor(1,1,1)
    love.graphics.print('Placar: '.. Player.score)
    Player:draw()
    sceneManager:draw()
end
