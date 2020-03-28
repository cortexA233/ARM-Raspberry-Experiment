function love.load()
  love.window.setMode(320,240) 
  rot_degree=0
  ima=love.graphics.newImage("example.jpg")
end

function degToArc(x)
  return x/360*math.pi*2
end

function love.draw()
  love.graphics.draw(ima,120,80,degToArc(rot_degree),0.3,0.3,110,110) --参数分别为：待绘制对象，起始坐标x，起始坐标y，旋转角度（弧度制），x轴缩放，y轴缩放，旋转中心x坐标，旋转中心y坐标
end

function love.update(dt)
  if(love.keyboard.isDown('e') or love.keyboard.isDown('right')) then
    rot_degree=rot_degree+1
  end
  if(love.keyboard.isDown('q') or love.keyboard.isDown('left')) then
    rot_degree=rot_degree-1
  end  
end

