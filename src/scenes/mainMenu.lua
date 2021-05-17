local scene = {}

local function newButton(img, fn)
    return {
        img = img,
        fn = fn,
        scale = 1,
        x = 0,
        y = 0,
        w = 0,
        h = 0,
        hovering = false
    }
end


ww = love.graphics.getWidth()
wh = love.graphics.getHeight()
local totalHeight = 0
local margin = 16


function scene:load()
    self.buttons = {}
    totalHeight = 0
    table.insert(self.buttons, newButton(
        love.graphics.newImage("assets/ui/Play button.png"),
        function ()
            sceneManager:openScene("src.scenes.scene1")
        end
    ))
    table.insert(self.buttons, newButton(
        love.graphics.newImage("assets/ui/Option button.png"),
        function ()
            print('Options')
        end
    ))
    table.insert(self.buttons, newButton(
        love.graphics.newImage("assets/ui/Score button.png"),
        function ()
            print('Score')
        end
    ))
    table.insert(self.buttons, newButton(
        love.graphics.newImage("assets/ui/Help button.png"),
        function ()
            print('Help')
        end
    ))
    table.insert(self.buttons, newButton(
        love.graphics.newImage("assets/ui/Quit button.png"),
        function ()
            love.event.quit(0)
        end
    ))

    for i, b in ipairs(self.buttons) do
        totalHeight = totalHeight + b.img:getHeight() + margin
    end

    for i, button in ipairs(self.buttons) do

        button.w = button.img:getWidth()
        button.h = button.img:getHeight()
        button.x = ( ww / 2 ) - ( button.w / 2 )
        button.y = ( wh / 2 ) - (totalHeight / 2) +  ((i - 1) * (button.h + margin))

    end

    return true
end

function scene:update(dt, mouseX, mouseY)
    for i, button in ipairs(self.buttons) do

        button.hovering = dotIsColliding(
            {
                x = mouseX,
                y = mouseY
            },
            {
                x = button.x,
                y = button.y,
                w = button.w,
                h = button.h
            }
        )

        if button.hovering then
            button.scale = 1.2
        else
            button.scale = 1
        end

    end

end

function scene:draw()
    love.graphics.setColor(1,1,1)
    for i, button in ipairs(self.buttons) do

        love.graphics.draw(
            button.img,
            button.x + button.w / 2,
            button.y + button.h / 2,
            0,
            button.scale,
            button.scale,
            button.w / 2,
            button.h / 2
        )

    end

end

function scene:keypressed(key)

end

function scene:mousepressed(x, y, mouseButton, istouch, presses)

    for i, button in ipairs(self.buttons) do
        if button.hovering then
            button.fn()
        end
    end

end

return scene