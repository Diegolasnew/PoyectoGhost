Guy = {}
Guy.__index = Guy

function Guy:new( x, y, w, h, sprite )
	local g = {}
	setmetatable(g, Guy)
	g.x = x
	g.y = y	
	g.w = w
	g.h = h
	g.vx = 0
	g.vy = 0
	g.mw = g.w/tileSize
	g.mh = g.h/tileSize
	g.state = state.normal
	g.jumping = false
	g.vect = 0

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
				return true, i,j
			end
		end
	end

	return false
end

function Guy:up(  )
	local nextY = self.y - guyMaxVy*self.dt
	if not self:findColison( self.x, nextY ) then
		self.y = math.floor(nextY)
	end
end
function Guy:down(  )
	local nextY = self.y + guyMaxVy*self.dt
	if not self:findColison( self.x, nextY ) then
		self.y = math.floor(nextY)
	end
end

function Guy:addGravity(  )
	local nextVy = math.min(self.vy + guyAcy * self.dt, guyMaxVy)
	local nextY = math.floor(self.y + nextVy * self.dt)

	local  colision, x, y = self:findColison(self.x, nextY)
	if not colision then
		self.vy = nextVy
		self.y = nextY
	else
		if nextVy<0 then
			self.y = y*tileSize + tileSize + 0.1
		else	
			self.y = y*tileSize - self.h - 0.1
		end
		self.vy = 0
		self.state = state.normal
	end
end

function Guy:addMovement(  )
	local nextVx = math.min(self.vx + guyAcx * self.dt, guyMaxVx)
	local nextX = math.floor(self.x + nextVx * self.dt)


end

function Guy:jump(  )
	self.vy = -800
end
function Guy:left(  )
	local nextVx = math.max(self.vx - guyAcx * self.dt, -guyMaxVx)
	local nextX = math.floor(self.x + nextVx * self.dt)
	local colision, x, y = self:findColison(nextX, self.y)

	if not colision then
		self.vx = nextVx
		self.x = nextX
	else
		self.vx = 0
	end

end

function Guy:right(	 )
	local nextVx = math.min(self.vx + guyAcx * self.dt, guyMaxVx)
	local nextX = math.floor(self.x + nextVx * self.dt)
	local colision, x, y = self:findColison(nextX, self.y)

	if not colision then
		self.vx = nextVx
		self.x = nextX
	else
		self.vx = 0
	end
end

function Guy:stop(  )
	if self.vx ~= 0 then
		
	end
end

function Guy:update( dt )
	self.dt = dt

	self:addGravity()

	if key.isDown("w") and self.state == state.normal then
		self:jump()
	end

	-- if key.isDown("down") or key.isDown("s")then
	-- 	self:down()
	-- end


	if key.isDown("left") or key.isDown("a")then
		self:left()
	elseif key.isDown("right") or key.isDown("d")then
		self:right()
	else
		self.vx = 0
	end

	self.batch:bind()
    self.batch:clear()
    self.batch:addq(self.sriteQ[0], self.x, self.y)
    self.batch:unbind()

end


function Guy:draw(  )
	gfx.draw(self.batch, -Camera.x, -Camera.y)
end