push = require("push")
Class = require("Class")

require("Paddle")
require("Ball")

WindowSize = {
    width = 1280,
    height = 720
}

VirtualSize = {
    width = 432,
    height = 243
}

PaddleSpeed = 200

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    math.randomseed(os.time())

    smallFont = love.graphics.newFont("font.ttf", 8)
    love.graphics.setFont(smallFont)

    push:setupScreen(VirtualSize.width, VirtualSize.height, WindowSize.width, WindowSize.height, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    score = { 0, 0 }

    paddle1 = Paddle(5, 30, 5, 20)
    paddle2 = Paddle(VirtualSize.width - 10, VirtualSize.height - 30, 5, 20)

    ball = Ball(VirtualSize.width / 2, VirtualSize.height / 2, 4, 4)

    GameState = "start"
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()

    elseif key == "enter" or key == "return" then
        if GameState == "start" then
            GameState = "play"
        else
            GameState = "start"
            
            ball:Reset()
        end
    end
end

function love.update(delta)
    paddle1.dy = 0

    if love.keyboard.isDown("w") then
        paddle1.dy = paddle1.dy - PaddleSpeed
    end

    if love.keyboard.isDown("s") then
        paddle1.dy = paddle1.dy + PaddleSpeed
    end

    paddle2.dy = 0

    if love.keyboard.isDown("up") then
        paddle2.dy = paddle2.dy - PaddleSpeed
    end

    if love.keyboard.isDown("down") then
        paddle2.dy = paddle2.dy + PaddleSpeed
    end

    if GameState == "play" then
        ball:Update(delta)
    end

    paddle1:Update(delta)
    paddle2:Update(delta)
end

function love.draw()
    push:apply("start")

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    love.graphics.setFont(smallFont)

    paddle1:Render()
    paddle2:Render()

    ball:Render()

    push:apply("end")
end