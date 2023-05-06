pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

function make_player(x,y)
	a = make_actor('player',x,y,16,16)

	function a.draw_actor()
		sspr(40, 0, 8, 8, a.x, a.y+18) --84, 44
		sspr(56, 0, 16, 16, a.x-4, a.y+4) --80, 30
		sspr(48, 0, 8, 8, a.x, a.y) --84, 26
	end

	add_actor(a)
end