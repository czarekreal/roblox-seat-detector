local core = require(script.Parent.Core)

local callback = core.sit.callback(
	
	--function when player sits
	function(plr)
		print(plr.Name..' has sitted')
	end, 
	
	--function when player exit seat
	function(plr)
	    print(plr.Name..' has exited')
	end
	
	,script.Parent.Parent)


local callback2 = core.sit.callback(

	--function when player sits
	function(plr)
		print('wow second function on a single detector')
	end, 

	--function when player exit seat
	function(plr)
		print('exited wow thats crazy')
	end

	,script.Parent.Parent)

wait(5)

--clear all functions from one callback
core.sit.cancel_task(callback, function() --this function is optional and not required
	print('cancelled')
end)
