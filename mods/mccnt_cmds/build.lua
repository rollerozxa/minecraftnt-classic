
-- /paint
local painters = {}

minetest.register_chatcommand("paint", {
	description = "Paint with your currently held block when breaking.",
	privs = {interact=true},
	func = function(name, param)
		if painters[name] then
			minetest.chat_send_player(name, yellow("Paint mode disabled"))
			painters[name] = false
		else
			minetest.chat_send_player(name, yellow("Paint mode enabled"))
			painters[name] = true
		end
	end
})

minetest.register_on_dignode(function(pos, oldnode, digger)
	local playername = digger:get_player_name()
	if painters[playername] then
		minetest.set_node(pos, { name = digger:get_wielded_item():get_name() })
	end
end)


-- /place
minetest.register_chatcommand("place", {
	description = "Place a stone block at your current position, useful for building high up.",
	privs = { interact = true },
	func = function(name, param)
		local player = minetest.get_player_by_name(name)

		local pos = vector.new(player:get_pos())
		pos = vector.round(pos)

		if minetest.get_node(pos).name == "air" then
			minetest.place_node(pos, { name = "minecraft:stone" })
			minetest.chat_send_player(name, yellow("Successfully placed block at position."))
		end
	end
})
