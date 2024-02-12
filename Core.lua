--module init
local tasks_tab = {}

local module = {
	sit = {
		['callback'] = function(func1,func2,seat)
			local id = #tasks_tab + 1
			tasks_tab[id] = true
			spawn(function()
				local is_sit = false
				while tasks_tab[id] == true do
					if is_sit == true then
						repeat wait()
						until seat.Occupant == nil
						if tasks_tab[id] == false then
							return
						end
						is_sit = false
						func2()
					else
						repeat wait()
						until seat.Occupant
						if tasks_tab[id] == false then
							return
						end
						is_sit = true
						func1()
					end
			    end
			end)
			return id
		end,
		['cancel_task'] = function(taskid,...)
			local func = ...
			tasks_tab[taskid] = false
			func()
		end,
	}
}

return module
