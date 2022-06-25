
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
local max_page = 1
local items_per_page = 66

function get_creative_formspec(page)
	local prevbtn, nextbtn = '', ''
	local start = 0 + ( page - 1 ) * items_per_page

	if page ~= 1 then
		prevbtn = "button[0.5,8.5;1,1;inv_prev;\\<]"
	end

	if max_page ~= page then
		nextbtn = "button[13,8.5;1,1;inv_next;\\>]"
		--nextbtn = "button[14.44,1;1,7;inv_next;\\>]"
	end

	return formspec_wrapper([[
		formspec_version[4]
		size[14.45,10.9]
		box[0,0;14.45,10.9;#0000ff10]
		style[lbl_sel;border=false]
		style[inv_prev,inv_next;border=false;bgimg=mccnt_gui_btn.png;bgimg_pressed=mccnt_gui_btn_hover.png;bgimg_middle=1,1;font=bold;font_size=+4]
		button[0,0;14.45,1;lbl_sel;Select block]
		label[13.1,0.5;${pageind}]

		listcolors[#00000000;#888888]
		list[detached:creative;main;0.5,1;11,6;${start}]
		box[1.75,8.75;11,0.1;#88888844]
		list[current_player;main;1.75,9.3;9,1;0]

		${prevbtn}
		${nextbtn}
		field[-10,-10;0,0;internal_paginator;;${page}]
	]], {
		start = start,
		page = page,
		pageind = minetest.colorize("#aaaaaa", "("..page.."/"..max_page..")"),
		prevbtn = prevbtn,
		nextbtn = nextbtn
	})
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "" or fields.quit then return end

	local page = tonumber(fields.internal_paginator)
	-- check for sussy page input that some impostor has fucked with!! :flushed:
	if not page == tonumber(page) then return end

	if fields.inv_prev then page = page - 1
elseif fields.inv_next then page = page + 1 end

	local formspec = get_creative_formspec(page)
	player:set_inventory_formspec(formspec)
	minetest.show_formspec(player:get_player_name(), "", formspec)
end)

minetest.register_on_mods_loaded(function()
	local items = {}
	for itemstring, def in pairs(minetest.registered_nodes) do
		if def.groups.not_in_creative_inventory ~= 1 then
			table.insert(items, itemstring)
		end
	end

	max_page = math.ceil(#items / items_per_page)
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
	player:set_inventory_formspec(get_creative_formspec(1))
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
