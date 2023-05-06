pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

#include controller.p8
#include actors.p8
#include player.p8
#include util.p8

pal({[0]=0,130,141,2,1,129,140,12,14,7,137,10,139,6},1)
poke(0x5f2e,1)

function _init()
  make_player(40, 20)
  make_camera(0,0)
  rot=27/360
end

function _update60()
	
	rot-=2/360
	x_btn:update()
	if x_btn.is_pressed == true then
		print('yup', 16, 16, 4)
	end

	for x=1, #actors do
		actors[x].update_actor()
	end

	-- for actor in all(actors) do
	-- 	actor.update_actor()
	-- end
end

function _draw()

	cls()

	for x=1, #actors do
		actors[x].draw_actor()
	end
	-- for actor in all(actors) do
	-- 	actor.draw_actor()
	-- end

	if x_btn.is_pressed == true then
		print('yup', 16, 16, 4)
	end
	print(x_btn.ticks_down, 8, 8, 4)
	sspr(24, 0, 16, 16, 52, 52, 16, 16)

	pd_rotate(60, 60, rot, 1, 1, 3, false, 1)

	-- sspr(40, 0, 8, 8, 84, 44)
	-- sspr(56, 0, 16, 16, 80, 30)
	-- sspr(48, 0, 8, 8, 84, 26)
end

__gfx__
00aaa00a007000007000000000000055550000000003310000011033ee0000000000008800000000000000000000000000000000000000000000000000000000
00aaaaa0070000070007777000005566665500000003310000111383330000000000003300000000000000000000000000000000000000000000000000000000
0bbbaaa0070000700770000700056644446650000003311003333383d33300000000333d00000000000000000000000000000000000000000000000000000000
bbbbbaaa070007000000000000564455554465000003331003d3d383ddd3331111333ddd00000000000000000000000000000000000000000000000000000000
bbbb9baa070070000777000005644566665446500000331033c3c332ddddd333333ddddd00000000000000000000000000000000000000000000000000000000
bbb9bbaa007070007000700005645644446546500333331033333320dddddd3333dddddd00000000000000000000000000000000000000000000000000000000
bbbbbb00007070779700070056456445544654650313311021333200dddddd3333dddddd00000000000000000000000000000000000000000000000000000000
abbbb000700007999700007056456456654654650311110002222000dddddd3333dddddd00000000000000000000000000000000000000000000000000000000
00aaa00a0700007999700007564564566546546500000000000000000ddddd3333ddddd000000000000000000000000000000000000000000000000000000000
00aaaaa00070007977070700564564455446546500000000000000000ddddd3333ddddd000000000000000000000000000000000000000000000000000000000
0bb9aaa000070007000707000564564444654650000000000000000000dddd3333dddd0000000000000000000000000000000000000000000000000000000000
bb9bbaaa00007770000700700564456666544650000000000000000000dddd3333dddd0000000000000000000000000000000000000000000000000000000000
bbbbbbaa00000000007000700056445555446500000000000000000000ddd333333ddd0000000000000000000000000000000000000000000000000000000000
bbbbbbaa700007700700007000056644446650000000000000000000000d33111133d00000000000000000000000000000000000000000000000000000000000
bbbbbb00077770007000007000005566665500000000000000000000088310000001388000000000000000000000000000000000000000000000000000000000
abbbb000000000070000070000000055550000000000000000000000008000000000080000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56456456654654650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56456445544654650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05645644446546500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05644566665446500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00564455554465000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056644446650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00005566665500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000055550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00033100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00033100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00033110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00033310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00003310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03333310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03133110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011033000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111383000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03333383000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03d3d383000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33c3c333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88000000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33330000000033330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddd3333333333ddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddd33333333dddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dddd333333dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dddd333333dddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ddddd3333ddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ddddd3333ddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ddddd3333ddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ddddd3333ddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dddd3333dddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dddd3333dddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ddd333333ddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dd333333dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08833333333338800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00800000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0102000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
