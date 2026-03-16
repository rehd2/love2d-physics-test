---@diagnostic disable: lowercase-global

-- load | init on start
function love.load()
  wf = require("libraries/windfield")

  world = wf.newWorld(0, 100)

  player = world:newRectangleCollider(400, 50, 25, 25)
  ground = world:newRectangleCollider(80, 300, 675, 25)
  circle = world:newCircleCollider(375, 190, 75)
  -- circle:setType('static')

  ground:setType('static')
  
  button = {
    x = 80,
    y = 200,
    w = 50,
    h = 25
  }

  
  buttonLeft = {
    x = 700,
    y = 200,
    w = 50,
    h = 25
  }
end

-- called for every frame
function love.update(dt)
  world:update(dt)

  function love.touchpressed(id, x, y)
    local px, py = player:getLinearVelocity()

    -- check for left button press
    if x > button.x and x < button.x + button.w and
        y > button.y and y < button.y + button.h and px > -300 then
       player:applyForce(-5000, 0)
    end

    -- check for right button press
    if x > buttonLeft.x and x < buttonLeft.x + buttonLeft.w and
      y > buttonLeft.y and y < buttonLeft.y + buttonLeft.h and px < 300 then
      player:applyForce(5000, 0)
    end
  end

end

-- draw
function love.draw()
  world:draw()
  love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
  love.graphics.rectangle("fill", buttonLeft.x, buttonLeft.y, buttonLeft.w, buttonLeft.h)
end
