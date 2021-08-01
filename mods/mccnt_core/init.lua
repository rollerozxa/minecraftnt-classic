dofile(minetest.get_modpath("mccnt_core") .. "/helpers.lua")
dofile(minetest.get_modpath("mccnt_core") .. "/blocks.lua")

dofile(minetest.get_modpath("mccnt_core") .. "/mapgen.lua")

local digtime = 42
local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

minetest.register_item(":", {
	type = "none",
	wield_image = "hand.png",
	wield_scale = {x = 0.5, y = 1, z = 4},
	range = 10,
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 3,
		groupcaps = {
			crumbly = caps,
			cracky  = caps,
			snappy  = caps,
			choppy  = caps,
			oddly_breakable_by_hand = caps,
			instantly = caps
		},
		damage_groups = {fleshy = 10},
	}
})

