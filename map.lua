Map = {}
Map.__index = Map

function Map:new( tileArray, camera, x, y)
	local mp = {}
	setmetatable(mp, Map)
	mp.tileArray = tileArray
	mp.camera = camera
	mp.x = x
	mp.y = y
end

function Map:update( dt )	
	
end

function Map:draw(  )
	
end