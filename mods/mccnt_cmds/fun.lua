
-- /hug
minetest.register_chatcommand("hug", {
	description = "Hug someone. ^.^",
	privs = { shout = true },
	func = function(name, param)
		local player = minetest.get_player_by_name(param)
		if not player then return end

		minetest.chat_send_all(green(name)..yellow(" gives ")..green(param)..yellow(" a big massive hug! ^.^"))
	end
})
