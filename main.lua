require "src.imports"

function love.load()
    math.randomseed(os.time())
    base:load()
    sceneManager:load()
    sceneManager:init("src.scenes.mainMenu")
end

function love.update( dt )
    base:update(dt)
    sceneManager:update(dt)
end

function love.draw()
    sceneManager:draw()
    base:draw()
end
