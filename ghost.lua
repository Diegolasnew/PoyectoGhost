Ghost = {}
Ghost.__index = Ghost

function Ghost:new(x, y)
   local gst = {}            
   setmetatable(gst,Ghost)
   gst.x = x
   gst.y = y
   gst.vx = 200
   gst.vy = 200
   gst.sprite = gfx.newImage("img/ghost1.png")
   gst.dt = 0
   return gst
end

function Ghost:up(  )
	self.y = self.y - self.vy*self.dt
end
function Ghost:down(  )
	self.y = self.y + self.vy*self.dt
end
function Ghost:left(  )
	self.x = self.x - self.vx*self.dt
end
function Ghost:right(  )
	self.x = self.x + self.vx*self.dt
end



function Ghost:update( dt )
	self.dt = dt
	if key.isDown("up") or key.isDown("w")then
		self:up()
	end
	if key.isDown("down") or key.isDown("s")then
		self:down()
	end
	if key.isDown("left") or key.isDown("a")then
		self:left()
	end
	if key.isDown("right") or key.isDown("d")then
		self:right()
	end

end

function Ghost:draw()
	gfx.draw(self.sprite, self.x-Camera.x, self.y-Camera.y)
end