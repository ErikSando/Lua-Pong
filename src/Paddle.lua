Paddle = Class{}

function Paddle:init(x, y, w, h)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.dy = 0
end

function Paddle:Update(delta)
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * delta)

    else
        self.y = math.min(VirtualSize.height - self.h, self.y + self.dy * delta)
    end
end

function Paddle:Render()
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end