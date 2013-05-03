gfx = love.graphics
fsy = love.filesystem
key = love.keyboard
mou = love.mouse
defColor={255,255,255}

require("constant")
require("resources")
require("loader")
require("log")
require("map")
require("editor")
require("ghost")
require("keyEvent")
require("camera")
require("save")

function love.load( )
	fant = Ghost:new(50,50)
	Loader:loadEsentials( )
	Editor:init( )
	gfx.setBackgroundColor(255,255,255)
end

function love.update( dt )
	logUpdate( dt )
	fant:update(dt)

	if editorMode then
		Editor:update( dt )
	end

	Camera:update(dt)

end

function love.draw( )
	Camera:draw()
	gfx.setColor(255,255,255,150)
	fant:draw()
	gfx.setColor(defColor)
	if log then
		logDraw( )
	end

	if editorMode then
		Editor:draw( )
	end
end

function love.quit()
	Save:saveMap(Camera.thing, "mataTest")
	print("Gracias por jugar. ¡Que bueno que no se crasho!")
end