
local blocks = {
	cobblestone_slab = {
		order = 50,
		description = "Cobblestone Slab",
		tiles = { terrain(16) },
		drawtype = "nodebox",
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
			}
		},
		sound = 'stone',
	},
	rope = {
		order = 51,
		description = "Rope",
		tiles = { terrain(11) },
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		climbable = true,
		sunlight_propagates = true,
		sound = 'wood',
	},
	sandstone = {
		order = 52,
		description = "Sandstone",
		tiles = {
			terrain(25),
			terrain(57),
			terrain(41)},
		sound = 'stone',
	},
	snow = {
		order = 53,
		description = "Snow",
		tiles = { terrain(50) },
		drawtype = "nodebox",
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- NodeBox1
			}
		},
		sound = 'snow',
	},
	fire = {
		order = 54,
		description = "Fire",
		tiles = { terrain(38) },
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		sunlight_propagates = true,
		sound = 'stone',
	},
	-- cpe wools
	light_pink_wool = {
		order = 55,
		description = "Light Pink Wool",
		tiles = { terrain(80) },
		sound = 'cloth',
	},
	forest_green_wool = {
		order = 56,
		description = "Forest Green Wool",
		tiles = { terrain(81) },
		sound = 'cloth',
	},
	brown_wool = {
		order = 57,
		description = "Brown Wool",
		tiles = { terrain(82) },
		sound = 'cloth',
	},
	deep_blue_wool = {
		order = 58,
		description = "Deep Blue Wool",
		tiles = { terrain(83) },
		sound = 'cloth',
	},
	turquoise_wool = {
		order = 59,
		description = "Turquoise Wool",
		tiles = { terrain(84) },
		sound = 'cloth',
	},
	ice = {
		order = 60,
		description = "Ice",
		drawtype = "glasslike",
		tiles = { terrain(51) },
		paramtype = "light",
		sound = 'stone',
	},
	ceramic_tile = {
		order = 61,
		description = "Ceramic Tile",
		tiles = { terrain(54) },
		sound = 'stone',
	},
	magma_block = {
		order = 62,
		description = "Magma Block",
		tiles = { terrain(86) },
		sound = 'stone',
	},
	pillar = {
		order = 63,
		description = "Pillar",
		tiles = {
			terrain(26),
			terrain(58),
			terrain(42)
		},
		sound = 'stone',
	},
	crate = {
		order = 64,
		description = "Crate",
		tiles = { terrain(53) },
		sound = 'wood',
	},
	stone_brick = {
		order = 65,
		description = "Stone Brick",
		tiles = { terrain(52) },
		sound = 'stone',
	},
}

for name, def in pairs(blocks) do
	if not def.groups then def.groups = {} end
	if not def.unbreakable then
		def.groups.instantly = 3
	end

	def.drop = ""

	def.stack_max = 1

	if def.sound then
		def.sounds = block_sound(def.sound)
		def.sound = nil
	end

	minetest.register_node(":minecraft:"..name, def)
end
