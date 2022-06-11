
local pending_mbs = {}

minetest.register_chatcommand("mb", {
	params = "<message>",
	description = "Add a message block.",
	func = function(name, param)
		minetest.chat_send_player(name, minetest.colorize("#ffff00", "Punch the block you want to turn into a message block."))
		pending_mbs[name] = param
	end
})

minetest.register_on_dignode(function(pos, oldnode, digger)
	local playername = digger:get_player_name()
	if pending_mbs[playername] then
		minetest.set_node(pos, oldnode)

		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", pending_mbs[playername])
		pending_mbs[playername] = nil
	end
end)
