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

-- Simple formspec wrapper that does variable substitution.
function formspec_wrapper(formspec, variables)
	local retval = formspec

	for k,v in pairs(variables) do
		retval = retval:gsub("${"..k.."}", v)
	end

	return retval
end

minecraftnt = {}

function minecraftnt.register_block(name, def)
	if not def.groups then def.groups = {} end
	if not def.unbreakable then
		def.groups.instantly = 3
	end

	def.drop = ""

	def.stack_max = 1

	if def.inventory_image then
		def.tiles = def.tiles or { def.inventory_image }
		def.drawtype = "plantlike"
		def.paramtype = "light"
		def.walkable = false
		def.sunlight_propagates = true
	end

	if def.slab then
		def.drawtype = "nodebox"
		def.paramtype = "light"
		def.node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
			}
		}
	end

	if def.sound then
		def.sounds = block_sound(def.sound)
		def.sound = nil
	end

	if def.admin_block then
		def.on_place = function(itemstack, placer, pointed_thing)
			if not minetest.check_player_privs(placer, 'give') then
				minetest.chat_send_player(placer:get_player_name(), minetest.colorize("#FF0000", "You don't have permission to place this block!"))
				return itemstack
			end
			minetest.set_node(pointed_thing.above, { name = itemstack:get_name() })
			return itemstack
		end
	end

	minetest.register_node(":minecraft:"..name, def)
end
