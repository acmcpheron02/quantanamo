pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

function make_player(x,y)
	player = {}
	player.x = x
	player.y = y
	player.h= 21
	player.w= 16
	player.dx = 0
	player.vx = 0
	player.vy = 0
	player.xflipped = false
	player.state = 'float'
	player.direction = 'side'
	player.cooldown = 0

	function player.xcen() 
		return player.x + 8
	end
	function player.ycen() 
		return player.y + 10
	end 

	function player.update()
		move_player()
		calc_forces()
		apply_forces()
		update_p_state()

	end

	function player.draw()
		--tail controls --84, 44
		--sspr(41, 4, 6, 12, player.x+5, player.y+13, 6, 12, false)
		local tailRot
		tailRot = (player.vx * 20) / 360
		if player.state != 'hold' then
			print(tailRot, cam.x + 8, cam.y + 8)
			print(player.vx, cam.x + 8, cam.y + 16)
			print(player.dx, cam.x + 8, cam.y + 24)
			pd_rotate(player.x+8, player.y+11, tailRot, 0.5, 21, 4, false, 1)
		end

		--body controls --80, 30
		if player.direction == 'neutral' and player.state == 'float' then
			sspr(56, 0, 16, 16, player.x, player.y+4, 16, 16, player.xflipped) 
		end
		if player.direction == 'side' and player.state == 'float' then
			sspr(24, 16, 16, 16, player.x, player.y+3, 16, 16, player.xflipped) 
		end
		if player.state == 'launch' then
			sspr(40, 16, 16, 16, player.x, player.y+7) 
		end
		if player.state == 'hold' then
			pd_rotate(player.x+8, player.y+8, rot, 2.5, 10, 10, false, 1)
		end

		--head controls --84, 26
		local headxFlip = false
		if player.dx < 0 then headxflip = false end
		if player.dx > 0 then headxflip = true end
		if player.state != 'hold' then
			if player.direction == 'side' or player.direction =='neutral' then
				sspr(48, 0, 8, 8, player.x+4, player.y, 8, 8, headxflip)
			end
			if player.direction == 'up' then
				sspr(48, 8, 8, 8, player.x+4, player.y, 8, 8, headxflip)
			end
		end
	end

	return 
end

function move_player()
	player.dx = direction_control()
	if player.state == 'float' then
		player.vx += player.dx/15
	end
	if player.state == 'launch' then
		player.vx += player.dx/50
	end
	if x_btn.is_pressed == true then
		player.vy -= 8.5
		player.state = 'launch'
	end
end

function calc_forces()
	player.vx /= 1.02 --air friction
	
	--adjust to 0 when near 0
	if player.vx < 0.01 and player.vx > -0.01 then player.vx = 0 end
	
	--if floating, reduce maximum gravity effect 
	if player.state == 'float' then
		player.vy += .20 --gravity
		player.vy = mid(.6, player.vy, -100) --flesh kite
	end

	--if launched use heavier gravity.
	if player.state == 'launch' then
		player.vy += .20 --gravity
		player.vy = mid(3, player.vy, -100) --flesh kite
	end
end
	
function apply_forces()
	player.x += player.vx
	player.y += player.vy
end

function update_p_state()
	if player.cooldown > 0 then player.cooldown -= 1 end

	if player.state == 'launch' and player.vy > 0 then
		player.state = 'float'
	end
	if player.state == 'float' and x_btn.is_down == true then
		player.state = 'launch' 
	end
	if player.vy > 0 then player.direction = 'neutral' end
	
	if player.dx > 0 then
		player.xflipped = true
		if player.vx > 0 then player.direction = 'side' end
	end
	if player.dx < 0 then
		player.xflipped = false
		if player.vx < 0 then player.direction = 'side' end
	end
	if player.vy < 0 then player.direction = 'up' end
	--If player is moving in the direction pressed, set flipped accordingly and direction = side
	--If player is changing directions (dx is opposite of vx) then set to neutral.
end



