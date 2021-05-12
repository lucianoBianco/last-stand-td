Player = {}

local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()

function Player:new()
    self.x = screen_width / 2
    self.y = screen_height - 50
    self.r = 0
    self.sprite = love.graphics.newImage("assets/sprites/player.png")
    self.muzzles = {}
    for i = 1, 3, 1 do
        table.insert(self.muzzles, love.graphics.newImage("assets/sprites/m_"..i..".png"))
    end
    self.currentMuzzle = 1
    self.muzzleOpacity = 0
    self.width = self.sprite:getWidth()
    self.height = self.sprite:getHeight()
    self.dOrigin = {x = self.width/ 2, y = self.height - 30}
    self.tempOrigin = {x = self.width/ 2, y = 0}
    self.sOrigin = {x = 6, y = self.height - 1}
end

function Player:update(dt)
    self.r = math.atan2(Crosshair.y - self.y, Crosshair.x - self.x)
    if self.muzzleOpacity > 0 then
        self.muzzleOpacity = self.muzzleOpacity - dt * 6
    end
end

function Player:draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(self.sprite, self.x, self.y, self.r + math.pi / 2, 1, 1, self.dOrigin.x, self.dOrigin.y)
    love.graphics.setColor(1,1,1,self.muzzleOpacity)
    love.graphics.draw(self.muzzles[self.currentMuzzle], self.x, self.y, self.r + math.pi / 2, 1, 1, self.sOrigin.x, self.sOrigin.y)
end

function Player:fire()
    self.muzzleOpacity = 1
    self.currentMuzzle = math.random(3)
end