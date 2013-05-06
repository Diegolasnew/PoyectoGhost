Camera = {}

function Camera:init( x, y , w, h, thing)
	Camera.x = x 
	Camera.y = y
	Camera.w = w 
	Camera.h = h
	Camera.thing = thing
end

function Camera:update( dt )
	self.x = math.floor(Loader.pjs[0].x - self.w/2)
	self.y = math.floor(Loader.pjs[0].y - self.h/2)
	self.thing:update(dt)
end

function Camera:draw(  )
	self.thing:draw()
end

