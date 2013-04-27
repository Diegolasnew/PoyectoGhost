gfx = love.graphics
fsy = love.filesystem
key = love.keyboard
defColor={255,255,255}

require("resources")
require("loader")
require("log")
require("editor")
require("ghost")
require("keyEvent")


function love.load( )
	log = true;
	Editor:init()
	fant = Ghost:new(50,50)
	gfx.setBackgroundColor(255,255,255)
end

function love.update( dt )
	doKeyEvent()
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

function love.quit()
  print("Gracias por jugar. ¡Que bueno que no se crasho!")
end