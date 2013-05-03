Editor = {}
Editor.source = ""

Editor.tileset = {}
Editor.options = {}
Editor.TileSelect = 1

function Editor:init(  )
	local tile = Loader.tileSet.TileSetImg
	local imgDim = (tile:getHeight()/tileSize) * (tile:getWidth()/tileSize)
	Editor.batch = gfx.newSpriteBatch(tile, imgDim)
end

function Editor:mouse( x, y, button )
	if button == "wu" then
		if Editor.TileSelect+1 > table.getn(Loader.tileSet.TileQuads) then
			Editor.TileSelect = 0
		else
			Editor.TileSelect = Editor.TileSelect +1
		end
	end
	if button == "wd" then
		if Editor.TileSelect-1 < 0 then
			Editor.TileSelect = table.getn(Loader.tileSet.TileQuads)		
		else
			Editor.TileSelect = Editor.TileSelect -1
		end
	end
	if button == "l" then
		
	end
	if button == "r" then
		
	end
end


function Editor:update( dt )

	local x, y = love.mouse.getPosition()
	--Posicion del mouse DENTRO del MAPA
	local mx = math.floor((Camera.x + x)/tileSize) 
	local my = math.floor((Camera.y + y)/tileSize)
	--Posición del mouse DENTRO de la CAMERA
	local cx = tileSize*(mx)-Camera.x
	local cy = tileSize*(my)-Camera.y

	Editor.batch:bind()
	Editor.batch:clear()

	if Editor.TileSelect ~= 0 then
		Editor.batch:setColor(255,255,255,200)
		Editor.batch:addq(Loader.tileSet.TileQuads[self.TileSelect], cx, cy)
	end

	Editor.batch:unbind()

	if mou.isDown("l") then
		Camera.thing:addTile( mx, my, self.TileSelect )
	end
	if mou.isDown("r") then
		Camera.thing:addTile( mx, my, 0 )
	end

end

function Editor:draw(  )
	gfx.draw(Editor.batch, 0, 0)
end