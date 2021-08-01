minetest.register_alias("mapgen_stone", "minecraft:stone")
minetest.register_alias("mapgen_water_source", "minecraft:water")
minetest.register_alias("mapgen_river_water_source", "minecraft:water")

minetest.register_biome({
	name = "grasslands",
	node_top = "minecraft:grass",
	depth_top = 1,
	node_filler = "minecraft:dirt",
	depth_filler = 2,
	node_riverbed = "minecraft:sand",
	depth_riverbed = 20,
	y_max = 31000,
	y_min = -20,
	heat_point = 50,
	humidity_point = 12,
})