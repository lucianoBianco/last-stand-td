
function love.keypressed(key)
    if key == "space" then
        hello()
    end
    sceneManager:keypressed(key)
end

function love.mousepressed( x, y, button, istouch, presses )
    sceneManager:mousepressed(x, y, button, istouch, presses)
end