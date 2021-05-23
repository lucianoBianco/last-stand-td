local tick = require "modules.tick"
base = {}
local currentFrame = 1

function base:load()
    self.font = love.graphics.newFont(32)
    self.mouseX = 0
    self.mouseY = 0
    self.outsideLoaded = false
    self.internalLoaded = false
    self.globalLoaded = false

    self.spriteSheet = love.graphics.newImage("assets/ui/loading.png")
    self.frames = {}
    self.frame_width = 117
    self.frame_height = 233

    for i=0,4 do
        table.insert(self.frames,
            love.graphics.newQuad(
                i * self.frame_width,
                0,
                self.frame_width,
                self.frame_height,
                self.spriteSheet
            )
        )
    end
end

function base:loading()
    self.globalLoaded = false
    self.outsideLoaded = false
    self.internalLoaded = false

    tick.delay(function ()
        self.internalLoaded = true
    end , 2)
end

function base:update(dt)
    self.mouseX, self.mouseY = love.mouse.getPosition()
    if not self.outsideLoaded or not self.internalLoaded then
        tick.update(dt)
        currentFrame = currentFrame + 10 * dt
        if currentFrame >= 6 then
            currentFrame = 1
        end
    elseif not self.globalLoaded then
        self.globalLoaded = true
    end
end

function base:draw()
    if not self.outsideLoaded or not self.internalLoaded then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle(
            'fill',
            0,
            0,
            love.graphics.getWidth(),
            love.graphics.getHeight()
        )
        love.graphics.setColor(.5,0,0)
        love.graphics.print("Carregando...", self.font,  ww - 250, wh - 50)
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.spriteSheet, self.frames[math.floor(currentFrame)], ww / 2, wh / 2, 0, 1, 1, self.frame_width / 2, self.frame_height / 2)
    end
end