
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
	on_take = function(inv, listname, index, stack, player)
		inv:set_stack(listname, index, stack)
	end
})

function get_creative_formspec(page)
	local inv_formspec = [[
		formspec_version[4]
		size[12.1,10.9]
		box[0,0;12.1,10.9;#0000ff09]
		style[lbl_sel;border=false]
		button[0,0;12.1,1;lbl_sel;Select block]

		listcolors[#00000000;#888888]
		list[detached:creative;main;0.5,1;9,6;0]
		list[current_player;main;0.5,9.3;9,1;0]
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
	inv_creative:set_size("main", #items)
	max_page = math.ceil(#items / 54)
	-- poor man's sorting algo
	for i=1, #items do
		for j=1, #items do
			if minetest.registered_nodes[items[j]].order == i then
				inv_creative:add_item("main", items[j])
			end
		end
	end
end)

minetest.register_on_joinplayer(function(player)
	player:set_inventory_formspec(get_creative_formspec(1))
end)
