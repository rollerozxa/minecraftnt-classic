
local register = minecraftnt.register_block

register('cobblestone_slab', {
	order = 50,
	description = "Cobblestone Slab",
	tiles = { terrain(16) },
	slab = true,
	sound = 'stone',
})
register('rope', {
	order = 51,
	description = "Rope",
	inventory_image = terrain(11),
	climbable = true,
	sound = 'wood',
})
register('sandstone', {
	order = 52,
	description = "Sandstone",
	tiles = {
		terrain(25),
		terrain(57),
		terrain(41)},
	sound = 'stone',
})
register('snow', {
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
})
register('fire', {
	order = 54,
	description = "Fire",
	inventory_image = terrain(38),
	sound = 'stone',
})
register('light_pink_wool', {
	order = 55,
	description = "Light Pink Wool",
	tiles = { terrain(80) },
	sound = 'cloth',
})
register('forest_green_wool', {
	order = 56,
	description = "Forest Green Wool",
	tiles = { terrain(81) },
	sound = 'cloth',
})
register('brown_wool', {
	order = 57,
	description = "Brown Wool",
	tiles = { terrain(82) },
	sound = 'cloth',
})
register('deep_blue_wool', {
	order = 58,
	description = "Deep Blue Wool",
	tiles = { terrain(83) },
	sound = 'cloth',
})
register('turquoise_wool', {
	order = 59,
	description = "Turquoise Wool",
	tiles = { terrain(84) },
	sound = 'cloth',
})
register('ice', {
	order = 60,
	description = "Ice",
	drawtype = "glasslike",
	tiles = { terrain(51) },
	use_texture_alpha = "blend",
	paramtype = "light",
	sound = 'stone',
})
register('ceramic_tile', {
	order = 61,
	description = "Ceramic Tile",
	tiles = { terrain(54) },
	sound = 'stone',
})
register('magma_block', {
	order = 62,
	description = "Magma Block",
	tiles = { terrain(86) },
	sound = 'stone',
})
register('pillar', {
	order = 63,
	description = "Pillar",
	tiles = {
		terrain(26),
		terrain(58),
		terrain(42)
	},
	sound = 'stone',
})
register('crate', {
	order = 64,
	description = "Crate",
	tiles = { terrain(53) },
	sound = 'wood',
})
register('stone_brick', {
	order = 65,
	description = "Stone Brick",
	tiles = { terrain(52) },
	sound = 'stone',
})
