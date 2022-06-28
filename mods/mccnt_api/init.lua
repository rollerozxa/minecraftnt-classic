
minecraftnt = {}

-- Less verbose file include function taken from NodeCore
local include = rawget(_G, "include") or function(...)
	local parts = {...}
	table.insert(parts, 1, minetest.get_modpath(minetest.get_current_modname()))
	if parts[#parts]:sub(-4) ~= ".lua" then
		parts[#parts] = parts[#parts] .. ".lua"
	end
	return dofile(table.concat(parts, "/"))
end
rawset(_G, "include", include)

include('helpers')
include('register')

-- Shortened colour functions to do MCLawl-like coloured command messages
function yellow(msg)	return minetest.colorize("#ffff00", msg) end
function red(msg)		return minetest.colorize("#ff0000", msg) end
function green(msg)		return minetest.colorize("#00ff00", msg) end
