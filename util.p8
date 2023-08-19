pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

--97 tokens with Scaling and arbitrary size, credit to TheRoboZ
function pd_rotate(x,y,rot,mx,my,w,flip,scale)
  scale=scale or 1
  w*=scale*4

  local cs, ss = cos(rot)*.125/scale,sin(rot)*.125/scale
  local sx, sy = mx+cs*-w, my+ss*-w
  local hx = flip and -w or w

  local halfw = -w
  for py=y-w, y+w do
    tline(x-hx, py, x+hx, py, sx-ss*halfw, sy+cs*halfw, cs, ss)
    halfw+=1
  end
end

function direction_control()
	local dx = 0
	if(btn(0)) then dx = -1 end
	if(btn(1)) then dx = 1 end
	return dx
end

x_btn = {
	update=function(self)
			--start with assumption
			--that not a new press.
			self.is_pressed=false
			if btn(5) then
					if not self.is_down then
							self.is_pressed=true
					end
					self.is_down=true
					self.ticks_down+=1
			else
					self.is_down=false
					self.is_pressed=false
					self.ticks_down=0
			end
	end,
	--state
	is_pressed=false,--pressed this frame
	is_down=false,--currently down
	ticks_down=0,--how long down
}

function make_camera(x, y)
	cam = {}
	cam.x = x
	cam.y = y

	function follow_player()
	local bounds = 20
    local offset = 64
    --right bounds
    if (player.x+player.w-offset > cam.x + bounds) then cam.x = flr(player.x) + player.w - offset - bounds end
    --left bounds
    if (player.x-offset < cam.x - bounds) then cam.x = flr(player.x) - offset + bounds end
    --lower bounds
    if (player.y+player.h-offset > cam.y + bounds) then cam.y = flr(player.y) + player.h - offset - bounds end
    --upper bounds
    if (player.y-offset < cam.y - bounds) then cam.y = flr(player.y) - offset + bounds end
	end

	function center_well(w)
		cam.x = (cam.x*15 + player.x-58)/16
		cam.y = (cam.y*15 + player.y-68)/16 
	end

	function transition_cam()
		cam.x = (cam.x*20 + player.x-58)/21
		cam.y = (cam.y*20 + player.y-90)/21
	end

	function title_cam()
		cam.x = 248
		cam.y = player.y - 32
	end

	function cam.draw_camera()
		camera(cam.x, cam.y)
	end
end


function well_collisions()
	for w in all(wells) do
		well_collide(w)
	end
  end
  
  function well_collide(w)
	xdist = w.xcen() - player.xcen()
	ydist = w.ycen() - player.ycen()
	colldist = sqrt(xdist * 0x0.0001 * xdist + ydist * 0x0.0001 * ydist) * 0x100
	if colldist <= 16 then
		hold_well(w)
	end
	-- if colldist > 16 and colldist < 36 then
	-- 	player.vx += sgn(xdist) * 0.04 
	-- 	player.vy += sgn(ydist) * 0.04
	-- end
end

function qcorn_collisions()
	for q in all(qcorns) do
		qcorn_collide(q)
	end
  end

function qcorn_collide(q)
	xdist = q.xcen() - player.xcen()
	ydist = q.ycen() - player.ycen()
	tun_colldist = sqrt(xdist * 0x0.0001 * xdist + ydist * 0x0.0001 * ydist) * 0x100
	if tun_colldist <= 10 then
		sfx(13)
		del(qcorns, q)
	end
end

function tunnel_collide()
	xdist = tunnel.xcen() - player.xcen()
	ydist = tunnel.ycen() - player.ycen()
	colldist = sqrt(xdist * 0x0.0001 * xdist + ydist * 0x0.0001 * ydist) * 0x100
	if colldist <= 10 then
		gamestate = 'win'
	end
end

function draw_circle (orig)
 	length = 24
    angle = -rot
    angle_stepsize = 0.1

    -- go through all angles from 0 to 2 * PI radians
    --while (angle < 2 * 3.14) do
        -- calculate x, y from a vector with known length and angle
        x = orig.xcen() + (length * cos (angle))
        y = orig.ycen() + (length * sin (angle))
		xv = x + (20 * cos (angle+90/360)) 
		yv = y + (20 * sin (angle+90/360)) 
		pset(x, y, 10)
        --angle += angle_stepsize;
		pset(xv, yv, 9)
	--end
end

function launch_player()
	well_sound = 0
	sfx(10, -2)
	sfx(12)
	length = 24
	local x = player.xcen() + (length * cos (-rot))
	local y = player.ycen() + (length * sin (-rot))
	local vx = 20 * cos (-rot+90/360)
	local vy = 20 * sin (-rot+90/360)

	player.x = x
	player.y = y
	player.vx = vx/2.8
	player.vy = vy/2.8
end