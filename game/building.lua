builder = {}

function builder.load()
builder.blocks = 0
builder.selected = 1
builder.types = {
objects.shapes.rect,
objects.shapes.longrect,
objects.shapes.circle
}
builder.actshapes = {}
end

function builder.update()

end

function builder.draw()
love.graphics.setColor(125,125,125)
for x = 1, builder.blocks do
if builder.actshapes[x] == 1 then
love.graphics.setColor(125,125,125)
love.graphics.polygon("fill", objects.bodys.built[x]:getWorldPoints(objects.shapes.rect:getPoints()))
elseif builder.actshapes[x] == 2 then
love.graphics.setColor(125,125,125)
love.graphics.polygon("fill", objects.bodys.built[x]:getWorldPoints(objects.shapes.longrect:getPoints()))
else
love.graphics.setColor(235, 10, 10) 
 love.graphics.circle("fill", objects.bodys.built[x]:getX(), objects.bodys.built[x]:getY(), objects.shapes.circle:getRadius())
end
end
end

function love.mousepressed(x, y, button)
if button == "r" then
builder.blocks = builder.blocks + 1
objects.bodys.built[builder.blocks] = love.physics.newBody(world, x, y, "static")
objects.fixtures.builtfixs[builder.blocks] = love.physics.newFixture(objects.bodys.built[builder.blocks], builder.types[builder.selected], 1)
builder.actshapes[builder.blocks] = builder.selected
elseif button == "l" then
builder.blocks = builder.blocks + 1
objects.bodys.built[builder.blocks] = love.physics.newBody(world, x, y, "dynamic")
objects.fixtures.builtfixs[builder.blocks] = love.physics.newFixture(objects.bodys.built[builder.blocks], builder.types[builder.selected], 1)
builder.actshapes[builder.blocks] = builder.selected
end
end


