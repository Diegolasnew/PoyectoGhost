
logPolygon = {}

function logUpdate( dt )
	
end

function logDraw( )

	-- gfx.setColor( 0, 255, 0, 100 )
 -- 	gfx.rectangle("fill", 0, 480, 300, 120 )
 	gfx.setColor( 0, 0, 0)
 	gfx.print(love.timer.getFPS( ), 0, 0 )
 	gfx.print(Camera.x, 0, 10 )
 	gfx.print(Camera.y, 0, 20 )
	-- gfx.print("FPS: " .. love.timer.getFPS( ), 0, 0)
end
