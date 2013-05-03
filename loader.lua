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
	Loader.tileSet.TileSetImg = gfx.newImage('data/gfx/tileset.png')
	Loader.tileSet.TileQuads = {}
	local wImg = Loader.tileSet.TileSetImg:getWidth()/tileSize
	local hImg = Loader.tileSet.TileSetImg:getHeight()/tileSize

	local k = 1;
	for i=0, wImg-1 do
		for j=0, hImg-1 do
			local quad = gfx.newQuad( i*tileSize, j*tileSize, tileSize, tileSize, Loader.tileSet.TileSetImg:getWidth(), Loader.tileSet.TileSetImg:getHeight() )
			Loader.tileSet.TileQuads[k] = quad
			print(i .. ":" .. j .. "-"  .. k)
			k = k+1
		end
	end

	tileEmpty = {}
	for i = 0, 50-1 do
		tileEmpty[i]={}
		for j = 0, 50-1 do
			tileEmpty[i][j] = 0
		end
	end

	tileEmpty[0][0] = 2
	tileEmpty[5][10] = 1
	tileEmpty[6][10] = 1

	local mapEmpty = Map:new(tileEmpty, 0, 0, 50, 50)

	Camera:init(0, 0, 800, 600, mapEmpty)
		
end

function Loader:loadMap( mapName )
	
end

function Loader:loadPj ( PjName )

end

