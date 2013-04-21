gfx = love.graphics
fsy = love.filesystem
defColor={255,255,255}


require("log")
require("ghost")


function love.load( )
	log = true;
	fant = Ghost:new(50,50)
	gfx.setBackgroundColor(255,255,255)
end

function love.update( dt )
	logUpdate( dt )
	fant:update(dt)
end

function love.draw( )
	gfx.setColor(defColor)
	fant:draw()
	if log then
		logDraw( )
	end

end