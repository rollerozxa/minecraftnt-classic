-- Code related to the GUI

minetest.register_on_joinplayer(function(player)
	player:hud_set_hotbar_itemcount(9)

	player:hud_set_hotbar_image("mccnt_gui_hotbar.png")
	player:hud_set_hotbar_selected_image("mccnt_gui_hotbar_selected.png")

	local default_blocks = {
		"minecraft:stone",
		"minecraft:cobblestone",
		"minecraft:bricks",
		"minecraft:dirt",
		"minecraft:wood",
		"minecraft:log",
		"minecraft:leaves",
		"minecraft:glass",
		"minecraft:stone_slab"
	}

	local i = 1
	for k, v in ipairs(default_blocks) do
		player:get_inventory():set_stack("main", i, ItemStack(v))
		i = i + 1
	end
end)

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	return true
end)

--dofile(minetest.get_modpath('mccnt_gui').."/blockselect.lua")
dofile(minetest.get_modpath('mccnt_gui').."/inventory.lua")