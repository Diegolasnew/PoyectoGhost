log = true
editorMode = true

tileSize = 25
spriteRate = 500

guyMaxVx = 250
guyMaxVy = 800
guyAcx = 250
guyAcy = 3000

state = {
	normal = 0,
	jumping = 1,
	falling = 2,
	other = 3,
}


function string:split(delimiter) --source internet :D
	local result = {}
	local from  = 1
	local delim_from, delim_to = string.find( self, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( self, from , delim_from-1 ) )
		from = delim_to + 1
		delim_from, delim_to = string.find( self, delimiter, from  )
	end
	table.insert( result, string.sub( self, from  ) )
	return result
end

function getEmptyArr( w, h )
	local arr = {}
	for i=0, w-1 do
		arr[i] = {}
		for j=0, h-1 do
			arr[i][j] = 0	
		end
	end
	return arr
end