minetest.register_on_joinplayer(function(player)
	player:set_inventory_formspec([[
		formspec_version[4]
		size[17,10.5]
		position[0.5,0.45]
		label[7.5,0.7;Select block]
		listcolors[#ffffff00;#ffffff80]
		style_type[list;spacing=0.45,0.5;size=1.25,1.25]
		list[current_player;blockselect;1,1.6;9,5;]
	]])

	player:get_inventory():set_size("blockselect", 42)

	default_blocks = {
		"minecraft:stone",
		"minecraft:cobblestone",
		"minecraft:bricks",
		"minecraft:dirt",
		"minecraft:wood",
		"minecraft:log",
		"minecraft:leaves",
		"minecraft:glass",
		"minecraft:stone_slab",
		"minecraft:mossy_cobblestone",
		"minecraft:sapling",
		"minecraft:yellow_flower",
		"minecraft:red_flower",
		"minecraft:brown_mushroom",
		"minecraft:red_mushroom",
		"minecraft:sand",
		"minecraft:gravel",
		"minecraft:sponge",
		"minecraft:red_wool",
		"minecraft:orange_wool",
		"minecraft:yellow_wool",
		"minecraft:lime_wool",
		"minecraft:green_wool",
		"minecraft:teal_wool",
		"minecraft:aqua_wool",
		"minecraft:cyan_wool",
		"minecraft:blue_wool",
		"minecraft:indigo_wool",
		"minecraft:violet_wool",
		"minecraft:magenta_wool",
		"minecraft:pink_wool",
		"minecraft:black_wool",
		"minecraft:gray_wool",
		"minecraft:white_wool",
		"minecraft:coal_ore",
		"minecraft:iron_ore",
		"minecraft:gold_ore",
		"minecraft:iron_block",
		"minecraft:gold_block",
		"minecraft:bookshelf",
		"minecraft:tnt",
		"minecraft:obsidian",
	}

	i = 1
	for k, v in ipairs(default_blocks) do
		player:get_inventory():set_stack("blockselect", i, ItemStack(v))
		i = i + 1
	end
end)

