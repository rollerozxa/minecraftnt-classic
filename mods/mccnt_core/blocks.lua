
local register = minecraftnt.register_block

register('stone', {
	order = 1,
	description = "Stone",
	tiles = { terrain(1) },
	sound = 'stone',
})
register('grass', {
	order = 2,
	description = "Grass",
	tiles = {
		terrain(0),
		terrain(2),
		terrain(3),
	},
	sound = 'grass',
})
register('dirt', {
	order = 3,
	description = "Dirt",
	tiles = { terrain(2) },
	sound = 'gravel',
})
register('cobblestone', {
	order = 4,
	description = "Cobblestone",
	tiles = { terrain(16) },
	sound = 'stone',
})
register('wood', {
	order = 5,
	description = "Wood",
	tiles = { terrain(4) },
	sound = 'wood',
})
register('sapling', {
	order = 6,
	description = "Sapling",
	inventory_image = terrain(15),
	sound = 'grass',
})
register('bedrock', {
	order = 7,
	description = "Bedrock",
	tiles = { terrain(17) },
	sound = 'stone',
	unbreakable = true,
	admin_block = true
})
register('water', {
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
	liquid_viscosity = 1,
	liquid_range = 0,
	post_effect_color = {a = 128, r = 0, g = 0, b = 255},
	groups = {water = 3, liquid = 3},
	waving = 3,
	admin_block = true
})
register('still_water', {
	order = 9,
	description = "Still Water",
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
	liquid_viscosity = 7,
	liquid_range = 0,
	post_effect_color = {a = 128, r = 0, g = 0, b = 255},
	groups = {water = 3, liquid = 3},
	waving = 3,
	admin_block = true
})
register('lava', {
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
	liquid_viscosity = 1,
	liquid_range = 0,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {water = 3, liquid = 3},
	waving = 3,
	admin_block = true
})
register('still_lava', {
	order = 11,
	description = "Still Lava",
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
	liquid_viscosity = 7,
	liquid_range = 0,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {water = 3, liquid = 3},
	waving = 3,
	admin_block = true
})
register('sand', {
	order = 12,
	description = "Sand",
	tiles = { terrain(18) },
	sound = 'sand',
})
register('gravel', {
	order = 13,
	description = "Gravel",
	tiles = { terrain(19) },
	sound = 'gravel',
})
register('gold_ore', {
	order = 14,
	description = "Gold Ore",
	tiles = { terrain(32) },
	sound = 'stone',
})
register('iron_ore', {
	order = 15,
	description = "Iron Ore",
	tiles = { terrain(33) },
	sound = 'stone',
})
register('coal_ore', {
	order = 16,
	description = "Coal Ore",
	tiles = { terrain(34) },
	sound = 'stone',
})
register('log', {
	order = 17,
	description = "Log",
	tiles = {
		terrain(21),
		terrain(21),
		terrain(20)},
	sound = 'wood',
})
register('leaves', {
	order = 18,
	description = "Leaves",
	drawtype = "allfaces_optional",
	tiles = { terrain(22) },
	paramtype = "light",
	waving = 2,
	sound = 'grass',
})
register('sponge', {
	order = 19,
	description = "Sponge",
	tiles = { terrain(48) },
	sound = 'grass',
})
register('glass', {
	order = 20,
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = { terrain(49), "glass.png" },
	paramtype = "light",
	sunlight_propagates = true,
	sound = 'glass',
})

local wool_colors = {
	{ id = "red",		name = "Red" },
	{ id = "orange",	name = "Orange" },
	{ id = "yellow",	name = "Yellow" },
	{ id = "lime",		name = "Lime" },
	{ id = "green",		name = "Green" },
	{ id = "teal",		name = "Teal" },
	{ id = "aqua",		name = "Aqua" },
	{ id = "cyan",		name = "Cyan" },
	{ id = "blue",		name = "Blue" },
	{ id = "indigo",	name = "Indigo" },
	{ id = "violet",	name = "Violet" },
	{ id = "magenta",	name = "Magenta" },
	{ id = "pink",		name = "Pink" },
	{ id = "black",		name = "Black" },
	{ id = "gray",		name = "Gray" },
	{ id = "white",		name = "White" }
}

local i = 0
for k, v in pairs(wool_colors) do
	register(v['id'].."_wool", {
		order = 21+i,
		description = v['name'].." Wool",
		tiles = { terrain(i+64) },
		sound = 'cloth',
	})
	i = i + 1
end

register('red_flower', {
	order = 37,
	description = "Red Flower",
	inventory_image = terrain(13),
	waving = 1,
	sound = 'grass',
})
register('yellow_flower', {
	order = 38,
	description = "Yellow Flower",
	inventory_image = terrain(12),
	waving = 1,
	sound = 'grass',
})
register('brown_mushroom', {
	order = 39,
	description = "Brown Mushroom",
	inventory_image = terrain(29),
	waving = 1,
	sound = 'grass',
})
register('red_mushroom', {
	order = 40,
	description = "Red Mushroom",
	inventory_image = terrain(28),
	waving = 1,
	sound = 'grass',
})

register('gold_block', {
	order = 41,
	description = "Block of Gold",
	tiles = {
		terrain(24),
		terrain(56),
		terrain(40)},
	sound = 'metal',
})
register('iron_block', {
	order = 42,
	description = "Block of Iron",
	tiles = {
		terrain(23),
		terrain(55),
		terrain(39)},
	sound = 'metal',
})
register('double_stone_slab', {
	order = 43,
	description = "Double Stone Slab",
	tiles = {
		terrain(6),
		terrain(6),
		terrain(5)},
	sound = 'stone',
})
register('stone_slab', {
	order = 44,
	description = "Stone Slab",
	tiles = {
		terrain(6),
		terrain(6),
		terrain(5)},
	slab = true,
	sound = 'stone',
})
register('bricks', {
	order = 45,
	description = "Bricks",
	tiles = { terrain(7) },
	sound = 'stone',
})
register('tnt', {
	order = 46,
	description = "TNT",
	tiles = {
		terrain(9),
		terrain(10),
		terrain(8)},
	sound = 'grass',
})
register('bookshelf', {
	order = 47,
	description = "Bookshelf",
	tiles = {
		terrain(4),
		terrain(4),
		terrain(35)},
	sound = 'wood',
})
register('mossy_cobblestone', {
	order = 48,
	description = "Mossy Cobblestone",
	tiles = { terrain(36) },
	sound = 'stone',
})
register('obsidian', {
	order = 49,
	description = "Obsidian",
	tiles = { terrain(37) },
	sound = 'stone',
})
