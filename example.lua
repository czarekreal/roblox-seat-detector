local core = require(script.Parent.Core)

local callback = core.sit.callback(
	
	--function when player sits
	function()
		print('sitted')
	end, 
	
	--function when player exit seat
	function()
	    print('exited')
	end
	
	,script.Parent.Parent)


local callback2 = core.sit.callback(

	--function when player sits
	function()
		print('wow second function on a single detector')
	end, 

	--function when player exit seat
	function()
		print('exited wow thats crazy')
	end

	,script.Parent.Parent)

wait(5)

--clear all functions from one callback
core.sit.cancel_task(callback, function() --this function is optional and not required
	print('cancelled')
end)
