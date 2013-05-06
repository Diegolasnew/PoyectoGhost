Map = {}
Map.__index = Map


function Map:new( tileArray, x, y, w, h, elements, camera)
	local mp = {}
	setmetatable(mp, Map)
	mp.tileArray = tileArray
	mp.w = w
	mp.h = h
	mp.elements = elements or {}
	mp.camera = camera or {}
	mp.batch = gfx.newSpriteBatch(Loader.tileSet.TileSetImg, (mp.w * mp.h))
	mp.batch:setColor(255,255,255)
	return mp
end

function Map:addTile( x, y, tile )
	if x>=0 and x<self.w and y>=0 and y<self.h then
		self.tileArray[x][y] = tile
	end
end


function Map:update( dt )	
	self.batch:bind()
    self.batch:clear()
    local inix = math.max(0, math.floor(Camera.x/tileSize))
    local iniy = math.max(0, math.floor(Camera.y/tileSize))
    local finx = math.min(math.floor((Camera.w+Camera.x)/tileSize), self.w-1)
    local finy = math.min(math.floor((Camera.h+Camera.y)/tileSize), self.h-1)

	for i=inix, finx do
		for k=iniy, finy do
			local tile = self.tileArray[i][k]
			if(tile ~= 0) then
				self.batch:addq(Loader.tileSet.TileQuads[tile], i*tileSize, k*tileSize)
			end
		end
	end
	self.batch:unbind()
end

function Map:draw(  )
	gfx.draw(self.batch, -Camera.x, -Camera.y)
	gfx.setColor(255,0,0)
	gfx.rectangle( "line", -Camera.x, -Camera.y, self.w*tileSize, self.h*tileSize )
	gfx.setColor(defColor)
end