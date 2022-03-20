dofile(minetest.get_modpath("mccnt_core") .. "/helpers.lua")
dofile(minetest.get_modpath("mccnt_core") .. "/blocks.lua")

dofile(minetest.get_modpath("mccnt_core") .. "/mapgen.lua")

minetest.register_item(":", {
	type = "none",
	wield_image = "hand.png",
	wield_scale = {x = 0.5, y = 1, z = 4},
	range = 10,
	tool_capabilities = {
		max_drop_level = 3,
		groupcaps = {
			instantly = {times = {[3] = 0}, uses = 0, maxlevel = 256}
		}
	}
})
