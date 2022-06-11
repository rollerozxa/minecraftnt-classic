
local painters = {}

minetest.register_chatcommand("paint", {
	description = "Paint with your currently held block when breaking.",
	func = function(name, param)
		if painters[name] then
			minetest.chat_send_player(name, minetest.colorize("#ffff00", "Paint mode disabled"))
			painters[name] = false
		else
			minetest.chat_send_player(name, minetest.colorize("#ffff00", "Paint mode enabled"))
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
