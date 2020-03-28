function love.load()
  love.window.setMode(320,240) 
  losing=0
  speed=10
  gamescore=0
  dir=1
  addfl=0
  conable=0
  Object=require("class")
  require("play")
  require("food")
  gameshell_keys=require("gameshell_keymap")
  p1={}
  f1={}
  f1[1]=food(math.random(2,13)*20,math.random(1,10)*20)
  changetime=0
  turntime=0
  p1[1]=play(160,80)
  p1[2]=play(160,80+2*p1[1].r)
  p1[3]=play(160,80+4*p1[1].r)
  p1[4]=play(160,80+6*p1[1].r)
  p1[5]=play(160,80+8*p1[1].r)
  p1[6]=play(160,80+10*p1[1].r)
  p1[7]=play(160,80+12*p1[1].r)
  p1[8]=play(160,80+14*p1[1].r)
end

function love.draw()
  love.graphics.rectangle("line",15,15,295,215)
  if(conable==0) then
    if(losing==0) then
      love.graphics.print("Press SPACE button to start",77,77,0,1,1)
    else
      love.graphics.print("You lost!\nPress SPACE button to retry",77,77,0,1,1)
    end
  end
  love.graphics.print("Your score:"..gamescore,2,2,0,1,1)
  for i=1,#p1 do
    p1[i]:draw()
  end
  for i=1,#f1 do
    f1[i]:draw()
  end
end

function love.update(dt)
  changetime=changetime+dt
  turntime=turntime+dt
  if(changetime>=0.3) then
    changetime=0
    updat()
  end
  if(p1[1]:overf()==1) then
    conable=0
    losing=1
  end
end

function eatself()
  for i=3,#p1 do
    if(pointdis(p1[1].sx,p1[1].sy,p1[i].sx,p1[i].sy)<2*p1[1].r) then
      conable=0
      losing=1
    end
  end
end

function eat()
  if(pointdis(p1[1].sx,p1[1].sy,f1[1].sx,f1[1].sy)<=p1[1].r+f1[1].r) then
    table.remove(f1,1)
    addlen()
    gamescore=gamescore+1
  end
end

function pointdis(x1,y1,x2,y2)
  disx=(x1-x2)*(x1-x2)
  disy=(y1-y2)*(y1-y2)
  return math.sqrt(disx+disy)
end

function updat()
  if(p1[1]:overf()==1) then
    conable=0
    losing=1
  end
  eatself()
  eat()
  if(#f1==0 and conable==1) then
    f1[1]=food(math.random(2,13)*20,math.random(1,10)*20)
  end
  
  if(conable==1) then
    t1=p1[1].sx
    t2=p1[1].sy
    t3=t1
    t4=t2
    if(dir==1) then
      t4=t4-speed
    end
    if(dir==2) then
      t4=t4+speed
    end
    if(dir==3) then
      t3=t3-speed
    end
    if(dir==4) then
      t3=t3+speed
    end
    p1[1].sx=t3
    p1[1].sy=t4
    for i=2,#p1 do
      t3=t1
      t4=t2
      t1=p1[i].sx
      t2=p1[i].sy
      p1[i].sx=t3
      p1[i].sy=t4
      if(addfl==1 and i==#p1) then
        addfl=0
        p1[i].sx=t1
        p1[i].sy=t2
      end
    end
  end
end


function love.keypressed(s)
  -------胜负及初始化判定------------
  --if(s=="space") then
  if(s==gameshell_keys.Select) then
    if(conable==1) then
      conable=0
    else
      conable=1
    end
    if(losing==1) then
      losing=0
      gameini()
    end
  end
  -----------操控----------------
  if(s==gameshell_keys.Menu) then
    love.event.push("quit")
  end
  
  if((s=="s" or s=="down") and dir~=1 and turntime>=0.15) then
    dir=2
    turntime=0
  end
  if((s=="w" or s=="up") and dir~=2 and turntime>=0.15) then
    dir=1
    turntime=0
  end
  if((s=="a" or s=="left") and dir~=4 and turntime>=0.15) then
    dir=3
    turntime=0
  end
  if((s=="d" or s=="right") and dir~=3 and turntime>=0.15) then
    dir=4
    turntime=0
  end
  -------------------------------
end

function addlen()
  p1[#p1+1]=play(p1[#p1].sx,p1[#p1].sy)
  addfl=1
end


function gameini()
  gamescore=0
  changetime=0
  n=#p1
  for i=1,n do
    table.remove(p1,1)
  end
  p1[1]=play(160,80)
  losing=0
  dir=1
  conable=0
end
