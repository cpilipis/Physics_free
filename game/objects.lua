objects = {}

function objects.load()
objects.bodys = {}
objects.fixtures = {}
objects.shapes = {}
objects.bodys.bricks = {}
objects.bodys.built = {}
objects.fixtures.brickfixs = {}
objects.fixtures.builtfixs = {}
objects.shapes.longrect = love.physics.newRectangleShape(200, 25)
objects.shapes.circle = love.physics.newCircleShape(25)
loadground()
loadplayer()
wallload()
end

function objects.update()
control()
end

function objects.draw()
drawground()
drawplayer()
walldraw()
end

function loadground()
objects.bodys.ground = love.physics.newBody(world, 325, 642.5, "static")
objects.shapes.floor = love.physics.newRectangleShape(650, 25)
objects.fixtures.groundfix = love.physics.newFixture(objects.bodys.ground, objects.shapes.floor, 30)
end

function loadplayer()
objects.bodys.player = love.physics.newBody(world, 325, 0, "dynamic")
objects.shapes.rect = love.physics.newRectangleShape(30, 50)
objects.fixtures.playerfix = love.physics.newFixture(objects.bodys.player, objects.shapes.rect, 5)
end

function drawground()
love.graphics.setColor(40,174,40)
love.graphics.polygon("fill", objects.bodys.ground:getWorldPoints(objects.shapes.floor:getPoints()))
end

function drawplayer()
love.graphics.setColor(255,0,0)
love.graphics.polygon("fill", objects.bodys.player:getWorldPoints(objects.shapes.rect:getPoints()))
end

function control()
if love.keyboard.isDown("a") then
objects.bodys.player:applyForce(-5000, 0)
elseif love.keyboard.isDown("d") then
objects.bodys.player:applyForce(5000, 0)
end

function love.keypressed(key)
if key == "q" then
objects.bodys.player:applyLinearImpulse(-2500, -5000)
objects.bodys.player:applyAngularImpulse(-5000)
elseif key == "e" then
objects.bodys.player:applyLinearImpulse(2500, -5000)
objects.bodys.player:applyAngularImpulse(5000)
elseif key == "s" then
objects.bodys.player:applyLinearImpulse(0, 20000)
elseif key == "w" then
objects.bodys.player:applyLinearImpulse(0, -5000)
elseif key == " " then
objects.bodys.player:applyLinearImpulse(0, -5000)
objects.bodys.player:applyAngularImpulse(49000)
elseif key == "r" then
objects.fixtures = nil
objects.bodys.player:destroy()
for a=1,11 do
objects.bodys.bricks[a]:destroy()
end
for a = 1, builder.blocks do
objects.bodys.built[a]:destroy()
end
builder.load()
objects.load()
elseif key == "1" then
builder.selected = 1
elseif key == "2"then
builder.selected = 2
elseif key == "3" then
builder.selected = 3
end
end
end


function wallload()
for a = 1,11 do
if a <= 5 then
objects.bodys.bricks[a] = love.physics.newBody(world, 500, 650 - a * 50, "dynamic")
objects.fixtures.brickfixs[a] = love.physics.newFixture(objects.bodys.bricks[a], objects.shapes.rect, 3)
elseif a <= 10 then
objects.bodys.bricks[a] = love.physics.newBody(world, 600, 650 - (a - 5) * 50, "dynamic")
objects.fixtures.brickfixs[a] = love.physics.newFixture(objects.bodys.bricks[a], objects.shapes.rect, 3)
else
objects.bodys.bricks[a] = love.physics.newBody(world, 550, 650 - 300, "dynamic")
objects.fixtures.brickfixs[a] = love.physics.newFixture(objects.bodys.bricks[a], objects.shapes.longrect, 3)
end
end
end

function walldraw()
for a = 1, 11 do
love.graphics.setColor(50,50,50)
if a <= 10 then
love.graphics.polygon("fill", objects.bodys.bricks[a]:getWorldPoints(objects.shapes.rect:getPoints()))
else
love.graphics.polygon("fill", objects.bodys.bricks[a]:getWorldPoints(objects.shapes.longrect:getPoints()))
end
end
end

