pico-8 cartridge // http://www.pico-8.com
version 39
__lua__

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