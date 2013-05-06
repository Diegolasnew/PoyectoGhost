Guy = {}
Guy.__index = Guy

function Guy:new( x, y, w, h, sprite )
	local g = {}
	setmetatable(g, Guy)
	g.x = x
	g.y = y	
	g.w = w
	g.h = h
	g.mw = g.w/tileSize
	g.mh = g.h/tileSize

	g.dt = 0
	g.batch = gfx.newSpriteBatch(sprite, 100)
	g.sriteQ = {}
	g.sriteQ[0] = gfx.newQuad(0,0, 43, 71, sprite:getWidth(), sprite:getHeight())

	return g
end

function Guy:findColison( x, y )
	local map = Camera.thing
	local inix = math.max(0, x/tileSize)
	local iniy = math.max(0, y/tileSize)
	local finx = math.min(inix + self.mw, map.w-1)
	local finy = math.min(iniy + self.mh, map.h-1)

	for i= math.floor(inix), finx do
		for j=math.floor(iniy), finy do
			if map.tileArray[i][j] ~= 0 then
				return true
			end
		end
	end

	return false
end

function Guy:up(  )
	local nexty = self.y - guyVy*self.dt
	if not self:findColison( self.x, nexty ) then
		self.y = math.floor(nexty)
	end
end
function Guy:down(  )
	local nexty = self.y + guyVy*self.dt
	if not self:findColison( self.x, nexty ) then
		self.y = math.floor(nexty)
	end
end
function Guy:left(  )
	local nextx = self.x - guyVx*self.dt
	if not self:findColison( nextx, self.y ) then
		self.x = math.floor(nextx)
	end
end
function Guy:right(  )
	local nextx = self.x + guyVx*self.dt
	if not self:findColison( nextx, self.y ) then
		self.x = math.floor(nextx)
	end
end

function Guy:update( dt )
	self.dt = dt

	if key.isDown("up") or key.isDown("w")then
		self:up()
	end
	if key.isDown("down") or key.isDown("s")then
		self:down()
	end
	if key.isDown("left") or key.isDown("a")then
		self:left()
	end
	if key.isDown("right") or key.isDown("d")then
		self:right()
	end

	self.batch:bind()
    self.batch:clear()
    self.batch:addq(self.sriteQ[0], self.x, self.y)
    self.batch:unbind()


end

function Guy:draw(  )
	gfx.draw(self.batch, -Camera.x, -Camera.y)
end