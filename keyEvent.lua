function love.keypressed(key)   
   if key == "f2" then
   		editorMode = not editorMode
   end

   if key == "escape" then
   		love.event.quit()
   end

   if key == "f4" then
   		Camera.thing.tileArray = getEmptyArr( Camera.thing.w, Camera.thing.h)
   end

end

function love.mousereleased( x, y, button )
	if editorMode then
		Editor:mouse( x, y, button )
	end
end