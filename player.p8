pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

function make_player(x,y)
	player = {}
	player.x = x
	player.y = y
	player.h= 21
	player.w= 16
	player.vx = 0
	player.vy = 0
	player.xflipped = false
	player.state = 'float'

	function player.xcen() 
		return player.x + 8
	end
	function player.ycen() 
		return player.y + 10
	end 

	function player.update()
		move_player(player)
		calc_forces(player)
		apply_forces(player)
	end

	function player.draw()
		sspr(40, 0, 8, 8, flr(player.x)+4, flr(player.y)+18) --84, 44
		sspr(56, 0, 16, 16, flr(player.x), flr(player.y)+4) --80, 30
		sspr(48, 0, 8, 8, flr(player.x)+4, flr(player.y)) --84, 26
		--rect(player.x,player.y,player.x+15,player.y+20)
	end

	return 
end

function move_player(player)
	local dx = direction_control()
	player.vx += dx/10

	if x_btn.is_pressed == true then
		player.vy -= 7
	end
end

function calc_forces(player)
	player.vy += .20 --gravity
	player.vx /= 1.05 --air friction
	
	if player.vx < 0.01 and player.vx > -0.01 then player.vx = 0 end
	
	if player.state == 'float' then
		player.vy = mid(.6, player.vy, -100) --flesh kite
	end
end
	
function apply_forces(player)
	player.x += player.vx
	player.y += player.vy
end


