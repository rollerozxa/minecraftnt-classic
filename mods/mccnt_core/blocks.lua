
local blocks = {
	stone = {
		order = 1,
		description = "Stone",
		tiles = { terrain(1) },
		sounds = block_sound('stone'),
	},
	grass = {
		order = 2,
		description = "Grass",
		tiles = {
			terrain(0),
			terrain(2),
			terrain(3),
		},
		sounds = block_sound('grass'),
	},
	dirt = {
		order = 3,
		description = "Dirt",
		tiles = { terrain(2) },
		sounds = block_sound('gravel'),
	},
	cobblestone = {
		order = 4,
		description = "Cobblestone",
		tiles = { terrain(16) },
		sounds = block_sound('stone'),
	},
	wood = {
		order = 5,
		description = "Wood",
		tiles = { terrain(4) },
		sounds = block_sound('wood'),
	},
	sapling = {
		order = 6,
		description = "Sapling",
		drawtype = "plantlike",
		tiles = { terrain(15) },
		inventory_image = terrain(15),
		wield_image = terrain(15),
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		sounds = block_sound('grass'),
	},
	bedrock = {
		order = 7,
		description = "Bedrock",
		tiles = { terrain(17) },
		sounds = block_sound('stone'),
	},
	water = {
		order = 8,
		description = "Water",
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
	},
	lava = {
		order = 10,
		description = "Lava",
		drawtype = "liquid",
		tiles = { terrain(30) },
		use_texture_alpha = "blend",
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drowning = 1,
		liquidtype = "source",
		liquid_alternative_flowing = "minecraft:lava",
		liquid_alternative_source = "minecraft:lava",
		liquid_viscosity = WATER_VISC,
		liquid_range = 0,
		post_effect_color = {a = 128, r = 0, g = 0, b = 255},
		groups = {water = 3, liquid = 3},
		waving = 3
	},

	sand = {
		order = 12,
		description = "Sand",
		tiles = { terrain(18) },
		sounds = block_sound('sand'),
	},
	gravel = {
		order = 13,
		description = "Gravel",
		tiles = { terrain(19) },
		sounds = block_sound('gravel'),
	},
	gold_ore = {
		order = 14,
		description = "Gold Ore",
		tiles = { terrain(32) },
		sounds = block_sound('stone'),
	},
	iron_ore = {
		order = 15,
		description = "Iron Ore",
		tiles = { terrain(33) },
		sounds = block_sound('stone'),
	},
	coal_ore = {
		order = 16,
		description = "Coal Ore",
		tiles = { terrain(34) },
		sounds = block_sound('stone'),
	},
	log = {
		order = 17,
		description = "Log",
		tiles = {
			"terrain.png^[sheet:16x16:5,1",
			"terrain.png^[sheet:16x16:5,1",
			"terrain.png^[sheet:16x16:4,1"
		},
		sounds = block_sound('wood'),
	},
	leaves = {
		order = 18,
		description = "Leaves",
		drawtype = "allfaces_optional",
		tiles = { terrain(22) },
		paramtype = "light",
		waving = 2,
		sounds = block_sound('grass'),
	},
	sponge = {
		order = 19,
		description = "Sponge",
		tiles = { terrain(48) },
		sounds = block_sound('grass'),
	},
	glass = {
		order = 20,
		description = "Glass",
		drawtype = "glasslike",
		tiles = { terrain(49) },
		paramtype = "light",
		sunlight_propagates = true,
		sounds = block_sound('glass'),
	},

	red_wool = {
		order = 21,
		description = "Red Wool",
		tiles = { terrain(64) },
		sounds = block_sound('cloth'),
	},
	orange_wool = {
		order = 22,
		description = "Orange Wool",
		tiles = { terrain(65) },
		sounds = block_sound('cloth'),
	},
	yellow_wool = {
		order = 23,
		description = "Yellow Wool",
		tiles = { terrain(66) },
		sounds = block_sound('cloth'),
	},
	lime_wool = {
		order = 24,
		description = "Lime Wool",
		tiles = { terrain(67) },
		sounds = block_sound('cloth'),
	},
	green_wool = {
		order = 25,
		description = "Green Wool",
		tiles = { terrain(68) },
		sounds = block_sound('cloth'),
	},
	teal_wool = {
		order = 26,
		description = "Teal Wool",
		tiles = { terrain(69) },
		sounds = block_sound('cloth'),
	},
	aqua_wool = {
		order = 27,
		description = "Aqua Wool",
		tiles = { terrain(70) },
		sounds = block_sound('cloth'),
	},
	cyan_wool = {
		order = 28,
		description = "Cyan Wool",
		tiles = { terrain(71) },
		sounds = block_sound('cloth'),
	},
	blue_wool = {
		order = 29,
		description = "Blue Wool",
		tiles = { terrain(72) },
		sounds = block_sound('cloth'),
	},
	indigo_wool = {
		order = 30,
		description = "Indigo Wool",
		tiles = { terrain(73) },
		sounds = block_sound('cloth'),
	},
	violet_wool = {
		order = 31,
		description = "Violet Wool",
		tiles = { terrain(74) },
		sounds = block_sound('cloth'),
	},
	magenta_wool = {
		order = 32,
		description = "Magenta Wool",
		tiles = { terrain(75) },
		sounds = block_sound('cloth'),
	},
	pink_wool = {
		order = 33,
		description = "Pink Wool",
		tiles = { terrain(76) },
		sounds = block_sound('cloth'),
	},
	black_wool = {
		order = 34,
		description = "Black Wool",
		tiles = { terrain(77) },
		sounds = block_sound('cloth'),
	},
	gray_wool = {
		order = 35,
		description = "Gray Wool",
		tiles = { terrain(78) },
		sounds = block_sound('cloth'),
	},
	white_wool = {
		order = 36,
		description = "White Wool",
		tiles = { terrain(79) },
		sounds = block_sound('cloth'),
	},

	red_flower = {
		order = 37,
		description = "Red Flower",
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		sunlight_propagates = true,
		tiles = { terrain(13) },
		inventory_image = terrain(13),
		waving = 1,
		sounds = block_sound('grass'),
	},

	yellow_flower = {
		order = 38,
		description = "Yellow Flower",
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		sunlight_propagates = true,
		tiles = { terrain(12) },
		inventory_image = terrain(12),
		waving = 1,
		sounds = block_sound('grass'),
	},

	brown_mushroom = {
		order = 39,
		description = "Brown Mushroom",
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		sunlight_propagates = true,
		tiles = { terrain(29) },
		inventory_image = terrain(29),
		waving = 1,
		sounds = block_sound('grass'),
	},

	red_mushroom = {
		order = 40,
		description = "Red Mushroom",
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		sunlight_propagates = true,
		tiles = { terrain(28) },
		inventory_image = terrain(28),
		waving = 1,
		sounds = block_sound('grass'),
	},

	gold_block = {
		order = 41,
		description = "Block of Gold",
		tiles = {
			terrain(24),
			terrain(56),
			terrain(40),
			terrain(40),
			terrain(40),
			terrain(40),
		},
		sounds = block_sound('metal'),
	},

	iron_block = {
		order = 42,
		description = "Block of Iron",
		tiles = {
			terrain(23),
			terrain(55),
			terrain(39),
			terrain(39),
			terrain(39),
			terrain(39),
		},
		sounds = block_sound('metal'),
	},

	stone_slab = {
		order = 44,
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
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			}
		},
		sounds = block_sound('stone'),
	},

	bricks = {
		order = 45,
		description = "Bricks",
		tiles = { terrain(7) },
		sounds = block_sound('stone'),
	},
	tnt = {
		order = 46,
		description = "TNT",
		tiles = {
			terrain(9),
			terrain(10),
			terrain(8),
		},
		sounds = block_sound('grass'),
	},
	bookshelf = {
		order = 47,
		description = "Bookshelf",
		tiles = {
			terrain(4),
			terrain(4),
			terrain(35),
		},
		sounds = block_sound('wood'),
	},
	mossy_cobblestone = {
		order = 48,
		description = "Mossy Cobblestone",
		tiles = { terrain(36) },
		sounds = block_sound('stone'),
	},
	obsidian = {
		order = 49,
		description = "Obsidian",
		tiles = { terrain(37) },
		sounds = block_sound('stone'),
	},
}

local i = 1
for name, def in pairs(blocks) do
	if not def.groups then def.groups = {} end
	def.groups.instantly = 3

	def.drop = ""

	def._mccnt_order = i
	i = i + 1

	minetest.register_node(":minecraft:"..name, def)
end
