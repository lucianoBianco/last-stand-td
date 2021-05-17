sceneManager = {}

function sceneManager:load()
    self.currentScene = 1
    self.sceneToLoad = nil
    base:loading()
end

function sceneManager:init(scene)
    self.sceneToLoad = require (scene)
    local loadState = self.sceneToLoad:load()
    base.outsideLoaded = loadState
end

function sceneManager:openScene(scene)
    base:loading()
    self.clear()
    self:init(scene)
end

function sceneManager.clear()
    
end

function sceneManager:update(dt)
    if not base.globalLoaded then return end
    self.sceneToLoad:update(dt, base.mouseX, base.mouseY)
end

function sceneManager:draw()
    if not base.globalLoaded then return end
    self.sceneToLoad:draw()
end

function sceneManager:keypressed(key)
    if not base.globalLoaded then return end
    self.sceneToLoad:keypressed(key)
end

function sceneManager:mousepressed(x, y, button, istouch, presses)
    if not base.globalLoaded then return end
    self.sceneToLoad:mousepressed(x, y, button, istouch, presses)
end