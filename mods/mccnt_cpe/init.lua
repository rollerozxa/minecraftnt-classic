--[[
minetest.register_node(":minecraft:cobblestone_slab", {
	description = "Cobblestone Slab",
	drop = "",
	tiles = { terrain(16) },
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	},
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:rope", {
	description = "Rope",
	drop = "",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	tiles = { terrain(11) },
	groups = { instantly = 3 },
	sounds = block_sound('wood'),
})

minetest.register_node(":minecraft:sandstone", {
	description = "Sandstone",
	drop = "",
	tiles = {
		terrain(25),
		terrain(57),
		terrain(41)
	},
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:snow", {
	description = "Snow",
	drop = "",
	tiles = { terrain(50) },
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- NodeBox1
		}
	},
	groups = { instantly = 3 },
	sounds = block_sound('snow'),
})

minetest.register_node(":minecraft:fire", {
	description = "Fire",
	drop = "",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(38) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

cpe_wool_colors = {
	{
		id = "light_pink",
		name = "Light Pink"
	}, {
		id = "forest_green",
		name = "Forest Green"
	}, {
		id = "brown",
		name = "Brown"
	}, {
		id = "deep_blue",
		name = "Deep Blue"
	}, {
		id = "turquoise",
		name = "Turquoise"
	},
}

i = 80
for k, v in pairs(cpe_wool_colors) do
	minetest.register_node(":minecraft:"..v['id'].."_wool", {
		description = v['name'].." Wool",
		drop = "",
		tiles = { terrain(i) },
		groups = { instantly = 3 },
		sounds = block_sound('cloth'),
	})
	i = i + 1
end

minetest.register_node(":minecraft:ice", {
	description = "Ice",
	drop = "",
	drawtype = "glasslike",
	tiles = { terrain(51) },
	paramtype = "light",
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:ceramic_tile", {
	description = "Ceramic Tile",
	drop = "",
	tiles = { terrain(54) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:magma_block", {
	description = "Magma Block",
	drop = "",
	tiles = { terrain(86) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:pillar", {
	description = "Pillar",
	drop = "",
	tiles = {
		terrain(26),
		terrain(58),
		terrain(42)
	},
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:crate", {
	description = "Crate",
	drop = "",
	tiles = { terrain(53) },
	groups = { instantly = 3 },
	sounds = block_sound('wood'),
})

minetest.register_node(":minecraft:stone_brick", {
	description = "Stone Brick",
	drop = "",
	tiles = { terrain(52) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})
]]