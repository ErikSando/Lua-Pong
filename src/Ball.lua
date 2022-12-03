Ball = Class{}

function Ball:init(x, y, w, h)
    self.x = x
    self.y = y
    self.w = w
    self.h = h

    self.dx = math.random(-50, 50)
    self.dy = math.random(2) == 1 and -100 or 100
end

function Ball:Reset()
    self.x = VirtualSize.width / 2 - 2
    self.y = VirtualSize.height / 2 - 2
    self.dy = math.random(2) == 1 and -100 or 100
    self.dx = math.random(-50, 50)
end

function Ball:Update(delta)
    self.x = self.x + self.dx * delta
    self.y = self.y + self.dy * delta
end

function Ball:Render()
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end