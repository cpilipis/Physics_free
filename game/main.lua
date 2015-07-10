require "objects"
require "building"

function love.load()
love.physics.setMeter(25)
world = love.physics.newWorld(0, 9.81*64, false)
objects.load()
builder.load()
end

function love.update(dt)
world:update(dt)
objects.update()
end

function love.draw()
objects.draw()
builder.draw()
love.graphics.setBackgroundColor(0,255,255)
love.graphics.setColor(0,0,0)
love.graphics.print("Use the A and D keys to move around.", 0,0)
love.graphics.print("Use S to go down fast (or to stop sliding), and W to jump", 0,15)
love.graphics.print("Use Q and E to dive, and the Space bar to do a flip",0,30)
love.graphics.print("left click to place a block, and right click to place an anchored one", 0,45)
love.graphics.print("Use the numbers on your keyboard to change types of blocks", 0,60)
love.graphics.print("Push R to reset the map", 0,75)
love.graphics.print("FPS: " .. tostring(love.timer.getFPS( )), 0,90)
end

