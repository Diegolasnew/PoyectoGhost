Loader = {}
Loader.source = "data/" --Carpeta donde cargamos todo!

Loader.menus = {}
Loader.pjs = {}
Loader.maps = {}
Loader.tileSet = {} 

function Loader:checkSource(  )
	done = true
	return done
end

function Loader:loadEsentials(  )
	Loader.tileSet.TileSetImg = gfx.newImage('data/gfx/tilesetGra.png')
	Loader.tileSet.TileQuads = {}
	local wImg = Loader.tileSet.TileSetImg:getWidth()/tileSize
	local hImg = Loader.tileSet.TileSetImg:getHeight()/tileSize

	local k = 1
	for i=0, wImg-1 do
		for j=0, hImg-1 do
			local quad = gfx.newQuad( i*tileSize, j*tileSize, tileSize, tileSize, Loader.tileSet.TileSetImg:getWidth(), Loader.tileSet.TileSetImg:getHeight() )
			Loader.tileSet.TileQuads[k] = quad
			print(i .. ":" .. j .. "-"  .. k)
			k = k+1
		end
	end

	local tileEmpty = self:loadMap("mataTest")

	local mapEmpty = Map:new(tileEmpty, 0, 0, 50, 50)

	local spritePj = gfx.newImage('data/gfx/guy1.png')

	local PJ = Guy:new(400, 50, 43, 71, spritePj)

	table.insert(self.maps, mapEmpty)
	self.pjs[0] = PJ

	Camera:init(0, 0, 800, 600, mapEmpty)
		
end

function Loader:loadMap( mapName )
	if fsy.exists(mapName..".mep") then

		local data = fsy.read(mapName..".mep")
		local split1 = data:split("?")
		local split2 = split1[1]:split("-")
		local split3 = split1[2]:split("/")

		local w = tonumber(split2[1])
		local h = tonumber(split2[2])
		local arr = getEmptyArr(w, h)

		for i, v in pairs(split3) do
			local tile = v:split("-")
			if table.getn(tile) == 3 then
				local i = tonumber(tile[1])
				local j = tonumber(tile[2])
				local t = tonumber(tile[3])

				arr[i][j] = t
			end
		end
		return arr
	else
		return getEmptyArr(50, 50)
	end

end

function Loader:loadPj ( PjName )

end

