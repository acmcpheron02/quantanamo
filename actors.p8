pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

actors = {}

function make_actor(k,x,y,h,w)
  local a = {}
	a.kind = k or 'empty'
  a.x = x
	a.y = y
	a.h=h
  a.w=w
	a.vx = 0
	a.vy = 0
	a.xflipped = false
	function a.xCen() 
		return a.x + a.w/2
	end
	function a.yCen() 
		return a.y + a.h/2
	end 
	function a.draw_actor()
	end
	function a.update_actor()
	end

	return a
end

function add_actor(a)
	add(actors, a)
end

function make_camera(x, y)
	c = make_actor('camera',x,y,0,0)

	function c.update_actor()
		follow_player2()
	end

	function follow_player2()
		local a = actors[1]
		c.x = a.x-60
		c.y = a.y-60
	end

	function follow_player()
		local a = actors[1]
		local bounds = 24
    local offset = 64
    --right bounds
    if (a.x+a.w-offset > c.x + bounds) then c.x = flr(a.x) + a.w - offset - bounds end
    --left bounds
    if (a.x-offset < c.x - bounds) then c.x = flr(a.x) - offset + bounds end
    --lower bounds
    if (a.y+a.h-offset > bounds + c.y) then c.y = flr(a.y) + a.h - offset - bounds end
    --upper bounds
    if (a.y-offset < c.y - bounds) then c.y = flr(a.y) - offset + bounds end
	end

	function c.draw_actor()
		camera(flr(c.x), flr(c.y))
	end

	add_actor(c)
end
