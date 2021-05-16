sceneManager = {}

function sceneManager:load()
    self.currentScene = 1
    self.sceneToLoad = nil
end

function sceneManager:init()
    self.sceneToLoad = require ("src.scenes.scene"..self.currentScene)
    self.sceneToLoad:load()
end

function sceneManager:next()
    -- self.currentScene = self.currentScene + 1
    self.clear()
    self:init()
end

function sceneManager.clear()
    
end

function sceneManager:update(dt)
    self.sceneToLoad.update(dt)
end

function sceneManager:draw()
    self.sceneToLoad.draw()
end