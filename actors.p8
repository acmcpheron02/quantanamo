pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

actors = {}

function make_actor(k,x,y,h,w)
  local a = {}
	a.kind = k
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
	function a.move_actor()
	end

	return a
end

function add_actor(a)
	add(actors, a)
end

function force_actor(a, vx, vy)
	a.vx += vx
	a.vy += vy
end


