
minetest.register_node(":minecraft:stone", {
	description = "Stone",
	drop = "",
	tiles = { terrain(1) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:grass", {
	description = "Grass",
	drop = "",
	tiles = {
		terrain(0),
		terrain(2),
		{name = terrain(3), tileable_vertical = false}
	},
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:dirt", {
	description = "Dirt",
	drop = "",
	tiles = { terrain(2) },
	groups = { instantly = 3 },
	sounds = block_sound('gravel'),
})

minetest.register_node(":minecraft:cobblestone", {
	description = "Cobblestone",
	drop = "",
	tiles = { terrain(16) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:wood", {
	description = "Wood",
	drop = "",
	tiles = { terrain(4) },
	groups = { instantly = 3 },
	sounds = block_sound('wood'),
})

minetest.register_node(":minecraft:sapling", {
	description = "Sapling",
	drop = "",
	drawtype = "plantlike",
	tiles = { terrain(15) },
	inventory_image = terrain(15),
	wield_image = terrain(15),
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:bedrock", {
	description = "Bedrock",
	drop = "",
	tiles = { terrain(17) },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:water", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = { terrain(14) },
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "minecraft:water",
	liquid_alternative_source = "minecraft:water",
	liquid_viscosity = WATER_VISC,
	liquid_range = 0,
	post_effect_color = {a = 128, r = 0, g = 0, b = 255},
	groups = {water = 3, liquid = 3},
	waving = 3
})

minetest.register_node(":minecraft:sand", {
	description = "Sand",
	drop = "",
	tiles = { terrain(18) },
	groups = { instantly = 3 },
	sounds = block_sound('sand'),
})

minetest.register_node(":minecraft:gravel", {
	description = "Gravel",
	drop = "",
	tiles = { terrain(19) },
	groups = { instantly = 3 },
	sounds = block_sound('gravel'),
})

minetest.register_node(":minecraft:gold_ore", {
	description = "Gold Ore",
	drop = "",
	tiles = { terrain(32) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:iron_ore", {
	description = "Iron Ore",
	drop = "",
	tiles = { terrain(33) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:coal_ore", {
	description = "Coal Ore",
	drop = "",
	tiles = { terrain(34) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:log", {
	description = "Log",
	drop = "",
	tiles = {
		"terrain.png^[sheet:16x16:5,1",
		"terrain.png^[sheet:16x16:5,1",
		"terrain.png^[sheet:16x16:4,1"
	},
	groups = { instantly = 3 },
	sounds = block_sound('wood'),
})

minetest.register_node(":minecraft:leaves", {
	description = "Leaves",
	drop = "",
	drawtype = "allfaces_optional",
	tiles = { terrain(22) },
	paramtype = "light",
	groups = { instantly = 3 },
	waving = 2,
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:sponge", {
	description = "Sponge",
	drop = "",
	tiles = { terrain(48) },
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:glass", {
	description = "Glass",
	drop = "",
	drawtype = "glasslike",
	tiles = { terrain(49) },
	paramtype = "light",
	sunlight_propagates = true,
	groups = { instantly = 3 },
	sounds = block_sound('glass'),
})

wool_colors = {
	{
		id = "red",
		name = "Red"
	}, {
		id = "orange",
		name = "Orange"
	}, {
		id = "yellow",
		name = "Yellow"
	}, {
		id = "lime",
		name = "Lime"
	}, {
		id = "green",
		name = "Green"
	}, {
		id = "teal",
		name = "Teal"
	}, {
		id = "aqua",
		name = "Aqua"
	}, {
		id = "cyan",
		name = "Cyan"
	}, {
		id = "blue",
		name = "Blue"
	}, {
		id = "indigo",
		name = "Indigo"
	}, {
		id = "violet",
		name = "Violet"
	}, {
		id = "magenta",
		name = "Magenta"
	}, {
		id = "pink",
		name = "Pink"
	}, {
		id = "black",
		name = "Black"
	}, {
		id = "gray",
		name = "Gray"
	}, {
		id = "white",
		name = "White"
	},
}

i = 64
for k, v in pairs(wool_colors) do
	minetest.register_node(":minecraft:"..v['id'].."_wool", {
		description = v['name'].." Wool",
		drop = "",
		tiles = { terrain(i) },
		groups = { instantly = 3 },
		sounds = block_sound('cloth'),
	})
	i = i + 1
end

minetest.register_node(":minecraft:red_flower", {
	description = "Red Flower",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(13) },
	inventory_image = terrain(13),
	waving = 1,
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:yellow_flower", {
	description = "Yellow Flower",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(12) },
	inventory_image = terrain(12),
	waving = 1,
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:brown_mushroom", {
	description = "Brown Mushroom",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(29) },
	inventory_image = terrain(29),
	waving = 1,
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:red_mushroom", {
	description = "Red Mushroom",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(28) },
	inventory_image = terrain(28),
	waving = 1,
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:gold_block", {
	description = "Block of Gold",
	drop = "",
	tiles = {
		terrain(24),
		terrain(56),
		terrain(40),
		terrain(40),
		terrain(40),
		terrain(40),
	},
	groups = { instantly = 3 },
	sounds = block_sound('metal'),
})

minetest.register_node(":minecraft:iron_block", {
	description = "Block of Iron",
	drop = "",
	tiles = {
		terrain(23),
		terrain(55),
		terrain(39),
		terrain(39),
		terrain(39),
		terrain(39),
	},
	groups = { instantly = 3 },
	sounds = block_sound('metal'),
})

minetest.register_node(":minecraft:stone_slab", {
	description = "Stone Slab",
	tiles = {
		terrain(6),
		terrain(6),
		terrain(5),
		terrain(5),
		terrain(5),
		terrain(5),
	},
	is_ground_content = false,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	},
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:bricks", {
	description = "Bricks",
	drop = "",
	tiles = { terrain(7) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:tnt", {
	description = "TNT",
	drop = "",
	tiles = {
		terrain(9),
		terrain(10),
		terrain(8),
	},
	groups = { instantly = 3 },
	sounds = block_sound('grass'),
})

minetest.register_node(":minecraft:bookshelf", {
	description = "Bookshelf",
	drop = "",
	tiles = {
		terrain(4),
		terrain(4),
		terrain(35),
	},
	groups = { instantly = 3 },
	sounds = block_sound('wood'),
})

minetest.register_node(":minecraft:mossy_cobblestone", {
	description = "Mossy Cobblestone",
	drop = "",
	tiles = { terrain(36) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node(":minecraft:obsidian", {
	description = "Obsidian",
	drop = "",
	tiles = { terrain(37) },
	groups = { instantly = 3 },
	sounds = block_sound('stone'),
})
