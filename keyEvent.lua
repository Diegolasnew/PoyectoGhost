function love.keyreleased(key)

end

function doKeyEvent(  )
	
    if key.isDown("escape") then
    	love.event.quit()
    end
end