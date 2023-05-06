pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

function make_player(x,y)
	local a = make_actor('player',x,y,16,16)
	a.state = 'float'
	
		function a.update_actor()
			move_player(a)
			calc_forces(a)
			apply_forces(a)
		end

	function a.draw_actor()
		sspr(40, 0, 8, 8, flr(a.x), a.y+18) --84, 44
		sspr(56, 0, 16, 16, flr(a.x-4), a.y+4) --80, 30
		sspr(48, 0, 8, 8, flr(a.x), a.y) --84, 26
	end

	add_actor(a)
end

function move_player(a)
	local dx = direction_control()
	a.vx += dx/10

	if x_btn.is_pressed == true then
		a.vy -= 7
	end
end

function calc_forces(a)
	a.vy += .2 --gravity
	a.vx /= 1.05 --air friction
	
	if a.vx < 0.01 and a.vx > -0.01 then a.vx = 0 end
	
	if a.state == 'float' then
		a.vy = mid(.6, a.vy, -100) --flesh kite
	end
end
	
function apply_forces(a)
	a.x += a.vx
	a.y += a.vy
end


