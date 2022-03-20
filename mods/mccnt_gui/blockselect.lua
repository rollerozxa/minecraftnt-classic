local inv_blockselect = minetest.create_detached_inventory("blockselect", {
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	allow_put = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_take = function(inv, listname, index, stack, player)
		return -1
	end,
	on_take = function(inv, listname, index, stack, player)
	end
})

minetest.register_on_mods_loaded(function()
	inv_blockselect:set_size("main", 42)

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
		inv_blockselect:set_stack("main", i, ItemStack(v))
		i = i + 1
	end
end)

minetest.register_on_joinplayer(function(player)
	player:set_inventory_formspec([[
		formspec_version[4]
		size[17,10.5]
		position[0.5,0.45]
		label[7.5,0.7;Select block]
		listcolors[#ffffff00;#ffffff80]
		style_type[list;spacing=0.45,0.5;size=1.25,1.25]
		list[detached:blockselect;main;1,1.6;9,5;]
	]])
end)

