function love.load() --此为love2d引擎的核心回调函数之一，在每次程序开始初始化时调用一次
  love.window.setMode(320,240) --此为gameshell设备在GBA模拟器环境下的默认显示分辨率
  rot_degree=0 --坐标旋转的角度
  len=50
  wid=50 --矩形的长宽
  startx=-25
  starty=-25  --矩形的左上角坐标
end

function degToArc(x) --角度值到弧度值的转换函数
  return x/360*math.pi*2
end

function love.draw() --此为love2d引擎的核心回调函数之一，每帧调用一次，主要用来绘制屏幕上的图像
  love.graphics.translate(160,120) --love2d默认坐标系统的原点在左上角，此处将其调整为屏幕正中央
  love.graphics.rotate(degToArc(rot_degree)) --此函数功能为以坐标原点为中心旋转整个坐标系
  love.graphics.rectangle("fill",startx,starty,len,wid) --参数分别为：绘制模式（绘制矩形是否填充颜色），左上角坐标x，左上角坐标y，x长度，y长度
end

function love.update(dt) --此为love2d引擎的核心回调函数之一，每帧调用一次，主要用来更新游戏逻辑，可选参数dt含义为每帧所经过的时间
  if(love.keyboard.isDown('e') or love.keyboard.isDown('right')) then --gameshell外设键盘上的上下左右方向键和PC端的按键ID一致，无需单独判断
    rot_degree=rot_degree+1
  end
  if(love.keyboard.isDown('q') or love.keyboard.isDown('left')) then
    rot_degree=rot_degree-1
  end  
end

function love.keypressed(k) --此为love2d引擎的核心回调函数之一，在任意按钮按下时调用，参数k即为该按下的按键
  if(k=='escape') then
    love.event.push('quit')
  end
  if(k=='w' or k=='up') then
    rot_degree=rot_degree+45
  end
  if(k=='s' or k=='down') then
    rot_degree=rot_degree-45
  end
end


