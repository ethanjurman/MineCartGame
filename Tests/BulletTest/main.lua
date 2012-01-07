function love.load()
    text = ""
    world = love.physics.newWorld(0,0,240*3,160*3) --create a world for the bodies to exist in with width of 240 and height of 160
        world:setCallbacks(add, persist, rem, result)

    player = {}
        player.b = love.physics.newBody(world, 180, 80, 10, 0)
        player.s = love.physics.newCircleShape(player.b, 0, 0, 50)
        player.s:setData("Player")
 
    bulletShot = false
    bullet = {}
        bullet.b = love.physics.newBody(world, player.b:getX()+player.s:getRadius(), player.b:getY()+player.s:getRadius(), 0, 0)
        bullet.s = love.physics.newCircleShape(bullet.b, 0, 0, 50)
        bullet.s:setData("Bullet")

    enemy = {}
        enemy.b = love.physics.newBody(world, 60, 80, 10, 0)
        enemy.s = love.physics.newCircleShape(enemy.b, 0, 0, 50)
        player.s:setData("Enemy")

    love.graphics.setMode(240*3, 160*3, false, true, 0)
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.circle("fill", player.b:getX(), player.b:getY(), player.s:getRadius())
    love.graphics.circle("fill", enemy.b:getX(), enemy.b:getY(), enemy.s:getRadius())
    if bulletShot then
        love.graphics.circle("fill", player.b:getX()+player.s:getRadius(), player.b:getY(), bullet.s:getRadius())
    end
end

function love.keypressed(key, unicode)
    if key == 'b' then
        bulletShot = true
    end
end

function add(a, b, coll)
    text = text..a.." colliding with "..b.." at an angle of "..coll:getNormal().."\n"
end

function persist(a, b, coll)
    text = text..a.." touching "..b.."\n"
end

function rem(a, b, coll)
    text = text..a.." uncolliding "..b.."\n"
end

function results(a, b, coll)
    text = text..a.." hit "..b.."resulting with "..coll:getNormal().."\n"
end
