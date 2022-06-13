
local data = {}

minetest.register_node("mccnt_mapgen:invisible_bedrock", {
	description = "Invisible Bedrock",
	drawtype = "airlike",
	paramtype = "light",
	pointable = false,
	diggable = false,
	buildable_to = false,
	sunlight_propagates = true,
	groups = { not_in_creative_inventory = 1 }
})

minetest.register_node("mccnt_mapgen:solid_water", {
	description = "Solid Water",
	drawtype = "glasslike",
	tiles = { "solid_water.png" },
	paramtype = "light",
	pointable = false,
	diggable = false,
	buildable_to = false,
	sunlight_propagates = true,
	groups = { not_in_creative_inventory = 1 }
})

local mg = {
	blocks = {
		grass = minetest.get_content_id("minecraft:grass"),
		dirt = minetest.get_content_id("minecraft:dirt"),
		bedrock = minetest.get_content_id("minecraft:bedrock"),
		invisible_bedrock = minetest.get_content_id("mccnt_mapgen:invisible_bedrock"),
		solid_water = minetest.get_content_id("mccnt_mapgen:solid_water"),
	},
	size = 128,
	depth = 64
}

if minetest.get_mapgen_setting('mg_name') == "singlenode" then

minetest.register_on_generated(function(minp, maxp, blockseed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	vm:get_data(data)

	for z = minp.z, maxp.z do
	for y = minp.y, maxp.y do
		local posi = area:index(minp.x, y, z)
		for x = minp.x, maxp.x do
			if (x >= -mg.size and x <= mg.size) and (z >= -mg.size and z <= mg.size) then
				if y >= -mg.depth and y <= -1 then
					data[posi] = mg.blocks.dirt
				elseif y == 0 then
					data[posi] = mg.blocks.grass
				elseif y == -mg.depth -1 then
					data[posi] = mg.blocks.bedrock
				end
			elseif y >= -mg.depth -1 and y <= -3 then
				if		(x == -mg.size -1 and (z >= -mg.size -1 and z <= mg.size +1))
					or	(x ==  mg.size +1 and (z >= -mg.size -1 and z <= mg.size +1))
					or	(z == -mg.size -1 and (x >= -mg.size -1 and x <= mg.size +1))
					or	(z ==  mg.size +1 and (x >= -mg.size -1 and x <= mg.size +1))
					or (y == -3 and (x > mg.size +1 or x < -mg.size -1 or z > mg.size +1 or z < -mg.size -1)) then
					data[posi] = mg.blocks.bedrock
				end
			elseif y >= 0 and (
						(x == -mg.size -1 and (z >= -mg.size -1 and z <= mg.size +1))
					or	(x ==  mg.size +1 and (z >= -mg.size -1 and z <= mg.size +1))
					or	(z == -mg.size -1 and (x >= -mg.size -1 and x <= mg.size +1))
					or	(z ==  mg.size +1 and (x >= -mg.size -1 and x <= mg.size +1))) then
				data[posi] = mg.blocks.invisible_bedrock
			elseif y < 0 and y > -3 then
				data[posi] = mg.blocks.solid_water
			end

			posi = posi + 1
		end
	end end

	vm:set_data(data)
	vm:write_to_map()
end)

end
