Crosshair = {}
local prLength = 4
local prWidth = 1
local prDist = 10

local function renderPrecisionLine( self )
    love.graphics.setLineWidth( prWidth )
    local dist = self.currPrecision * prDist
    love.graphics.setColor( 1, 0, 0, 0.05 * dist )
    love.graphics.line( self.x + dist, self.y - prLength, self.x + dist, self.y + prLength )
    love.graphics.line( self.x - dist, self.y - prLength, self.x - dist, self.y + prLength )
    love.graphics.line( self.x - prLength, self.y - dist, self.x + prLength, self.y - dist )
    love.graphics.line( self.x - prLength, self.y + dist, self.x + prLength, self.y + dist )
end
local function renderAimLine( self )
    love.graphics.setLineWidth( prWidth * 3 )
    love.graphics.setColor( 1, 0, 0, 0.5 )
    love.graphics.line( self.x + prDist, self.y, self.x + prDist + 15, self.y )
    love.graphics.line( self.x - prDist, self.y, self.x - (prDist + 15), self.y )
    love.graphics.line( self.x, self.y - prDist, self.x, self.y - (prDist+ 15) )
    love.graphics.line( self.x, self.y + prDist, self.x, self.y + prDist + 15 )
end

function Crosshair:new()
    self.x = 0
    self.y = 0
    self.recovery = 3
    self.precision = 6
    self.currPrecision = 0
end

function Crosshair:update( x, y, dt )
    self.x = x
    self.y = y
    if (self.currPrecision > 0) then
        self.currPrecision = self.currPrecision - self.recovery * dt
    end
end

function Crosshair:draw()
    love.graphics.setColor( 1, 0, 0, 1 )
    love.graphics.circle( "line", self.x, self.y, 1 )
    renderPrecisionLine( self )
    renderAimLine( self )
end

function Crosshair:fire()
    local newPres = self.currPrecision + 10 - self.precision
    if newPres > 10 then
        self.currPrecision = 10
    else
        self.currPrecision = newPres
    end
end

