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
	local bounds = 12
    local offset = 64
    --right bounds
    if (player.x+player.w-offset > cam.x + bounds) then cam.x = flr(player.x) + player.w - offset - bounds end
    --left bounds
    if (player.x-offset < cam.x - bounds) then cam.x = flr(player.x) - offset + bounds end
    --lower bounds
    if (player.y+player.h-offset > bounds + cam.y) then cam.y = flr(player.y) + player.h - offset - bounds end
    --upper bounds
    if (player.y-offset < cam.y - bounds) then cam.y = flr(player.y) - offset + bounds end
	end

	function cam.draw_camera()
		camera(cam.x, cam.y)
	end
end
