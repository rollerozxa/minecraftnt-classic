include('blocks')

minetest.register_item(":", {
	type = "none",
	wield_image = "hand.png",
	wield_scale = {x = 0.5, y = 1, z = 4},
	range = 10,
	tool_capabilities = {
		max_drop_level = 3,
		groupcaps = {
			instantly = {times = {[3] = 0}, uses = 0, maxlevel = 256}
		}
	}
})

minetest.register_on_newplayer(function(player)
	local playername = player:get_player_name()
	local pri = minetest.get_player_privs(playername)
	pri["fly"] = true
	pri["fast"] = true
	minetest.set_player_privs(playername, pri)
end)

minetest.override_item("", {
	on_place = function(itemstack, placer, pointed_thing)
		if minetest.is_creative_enabled(placer:get_player_name()) then
			local pointed_node = minetest.get_node(pointed_thing.under)
			return pointed_node
		end
	end
})

minetest.register_on_joinplayer(function(player)
	player:set_lighting({
		shadows = { intensity = 0.33 }
	})
end)
