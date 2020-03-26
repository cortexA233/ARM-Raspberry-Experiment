Object=require("class")
play=Object.extend(Object)

function play.new(self,x,y)
  self.sx=x
  self.sy=y
  self.r=5
end

function play.draw(self)
  love.graphics.circle("fill",self.sx,self.sy,self.r)
end

function play.overf(self)
  if self.sx-5<=15 or self.sy-5<=15 or self.sx+10>=310 or self.sy+10>=230 then
    return 1
  end
  return 0
end


