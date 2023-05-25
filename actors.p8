pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

wells = {}

function make_well(x,y)
    local w = {}
    w.x = x
    w.y = y

    function draw_well()
        sspr(24, 0, 16, 16, w.x, w.y, 32, 32) --64, 94
        pd_rotate(w.x+16, w.y+16, rot, 1, 1, 3, false, 2) --80, 110
    end

    add(wells, w)
end
