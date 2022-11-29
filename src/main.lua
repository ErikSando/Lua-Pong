WindowSize = {
    width = 1280,
    height = 720
}

function love.load()
    love.window.setMode(WindowSize.width, WindowSize.height, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.update()

end

function love.draw()
    love.graphics.printf(
        'Hello Pong!',
        0,
        WindowSize.height / 2 - 6,
        WindowSize.width,
        'center'
    )
end