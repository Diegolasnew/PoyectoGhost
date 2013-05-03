Save = {}

function Save:saveMap( map, name )
	cont = map.w .. "-" .. map.h .. "?"
	for i=0, map.w-1 do
		for j=0, map.h-1 do
			if map.tileArray[i][j] ~= 0 then
				cont = cont .. i .."-"..j.."-"..map.tileArray[i][j].."/"
			end
		end
	end
	love.filesystem.write(name ..".mep", cont)
end