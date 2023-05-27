pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

wells = {}

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

    function draw_well()
        sspr(24, 0, 16, 16, w.x, w.y, 32, 32) --64, 94
        pd_rotate(w.x+16, w.y+16, rot, 1, 1, 3, false, 2) --80, 110
    end

    function hold_well(w)
        player.state = 'hold'
        player.x = w.xcen() - 8
        player.y = w.ycen() - 10
        if x_btn.is_pressed then
            player.state = 'launch'
            player.cooldown = 30
        end
    end

    add(wells, w)
end
      
