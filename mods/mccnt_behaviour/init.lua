
minetest.register_abm({
	label = "Turn dirt into grass",
	nodenames = {"minecraft:dirt"},
	neighbors = {"air"},
	interval = 2,
	chance = 2,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		minetest.set_node(pos, {name = "minecraft:grass"})
	end
})
