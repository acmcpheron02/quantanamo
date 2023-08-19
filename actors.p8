pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

wells = {}
qcorns = {}
well_sound = 0

function make_well(x,y)
    local w = {}
    w.x = x
    w.y = y
    w.wid = 32
    w.h = 32
    function w.xcen() 
        return w.x + w.wid/2
    end 
    function w.ycen() 
        return w.y + w.h/2
    end 

    function draw_well(w)
        sspr(24, 0, 16, 16, w.x, w.y, 32, 32) --64, 94
        pd_rotate(w.x+16, w.y+16, rot, 1, 1, 3, false, 2) --80, 110
    end

    function hold_well(w)
        if well_sound == 0 then
            sfx(10)
            well_sound = 1
        end
        player.state = 'hold'
        player.x = w.xcen() - 8
        player.y = w.ycen() - 10
        player.vx = 0
        player.vy = 0
        if x_btn.is_pressed then
            player.state = 'launch'
            player.cooldown = 14
            launch_player()
            
        end
    end

    add(wells, w)
end
      
function make_qcorn(x,y)
    local q = {}
    q.x = x
    q.y = y
    q.wid = 10
    q.h = 10
    function q.xcen() 
        return q.x + q.wid/2
    end 
    function q.ycen() 
        return q.y + q.h/2
    end 

    function draw_qcorn(q)
        sspr(0, 16, 10, 10, q.x, q.y, q.wid, q.h ) --64, 94
    end

    add(qcorns, q)
end

function draw_borders()
    for x = maplimits[1], maplimits[3] do
        spr(042, x*8, maplimits[2]*8)
    end
    for y = maplimits[2], maplimits[4] do
        spr(042, (maplimits[1]-.5)*8, y*8)
        spr(042, maplimits[3]*8, y*8)
    end
    for xwave = 0,2048, 16 do
        sspr(88,16,16,16, xwave, maplimits[4]*8)
    end
    rectfill(0, maplimits[4]*8+16, 2048, 2048, 5)
end

function make_tunnel(x,y)
    tunnel = {}
    tunnel.x = x
    tunnel.y = y
    tunnel.wid = 88
    tunnel.h = 88
    function tunnel.xcen() 
        return tunnel.x
    end 
    function tunnel.ycen() 
        return tunnel.y
    end 

    function draw_tunnel(tunnel)
        pd_rotate(tunnel.x, tunnel.y, rot/4, 1, 28, 3, false, 5) --80, 110
    end
end