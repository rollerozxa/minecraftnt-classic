
local inv_creative = minetest.create_detached_inventory("creative", {
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 1
	end,
	allow_put = function(inv, listname, index, stack, player)
		return 1
	end,
	allow_take = function(inv, listname, index, stack, player)
		return -1
	end,
	on_move = function(inv, from_list, from_index, to_list, to_index, count, player2)
	end,
	on_take = function(inv, listname, index, stack, player2)
	end,
})

local inventory_blocks = {}

function get_creative_formspec()
	local inv_formspec = [[
		formspec_version[4]
		size[14.45,10.9]
		box[0,0;14.45,10.9;#0000ff09]
		style[lbl_sel;border=false]
		button[0,0;14.45,1;lbl_sel;Select block]

		listcolors[#00000000;#888888]
		list[detached:creative;main;0.5,1;11,6;0]
		list[current_player;main;1.75,9.3;9,1;0]
	]]
	return inv_formspec
end

minetest.register_on_mods_loaded(function()
	local items = {}
	for itemstring, def in pairs(minetest.registered_nodes) do
		if def.groups.not_in_creative_inventory ~= 1 then
			table.insert(items, itemstring)
		end
	end
	-- poor man's sorting algo
	for i=1, #items do
		for j=1, #items do
			if minetest.registered_nodes[items[j]].order == i then
				table.insert(inventory_blocks, items[j])
				inv_creative:add_item("main", items[j])
			end
		end
	end
end)

minetest.register_on_joinplayer(function(player)
	player:set_inventory_formspec(get_creative_formspec())
end)

local reset_blockselect = function()
	inv_creative:set_size("main", 0)
	inv_creative:set_size("main", #inventory_blocks)
	for _,block in pairs(inventory_blocks) do
		inv_creative:add_item("main", block)
	end
end

minetest.register_on_joinplayer(reset_blockselect)
minetest.register_on_leaveplayer(reset_blockselect)
