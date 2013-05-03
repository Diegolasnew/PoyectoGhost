Camera = {}

function Camera:init( x, y , w, h, thing)
	Camera.x = x 
	Camera.y = y
	Camera.w = w 
	Camera.h = h
	Camera.thing = thing
end

function Camera:update( dt )
	self.x = math.floor(fant.x - self.w/2)
	self.y = math.floor(fant.y - self.h/2)

	self.thing:update(dt)
	
end

function Camera:draw(  )
	self.thing:draw()
end