
data = {}

mg = {
	blocks = {
		grass = minetest.get_content_id("minecraft:grass"),
		dirt = minetest.get_content_id("minecraft:dirt"),
		bedrock = minetest.get_content_id("minecraft:bedrock"),
		water = minetest.get_content_id("minecraft:water"),
	},
	size = 256,
	depth = 64
}

minetest.register_on_generated(function(minp, maxp, blockseed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	vm:get_data(data)

	for z = 0, 79 do
		for y = 0, 79 do
			for x = 0, 79 do
				pos = {
					x = minp.x + x,
					y = minp.y + y,
					z = minp.z + z
				}

				posi = area:index(pos.x, pos.y, pos.z)

				if (pos.x >= -mg.size and pos.x <= mg.size) and (pos.z >= -mg.size and pos.z <= mg.size) then
					if pos.y >= -mg.depth and pos.y <= -1 then
						data[posi] = mg.blocks.dirt
					elseif pos.y == 0 then
						data[posi] = mg.blocks.grass
					elseif pos.y == -mg.depth -1 then
						data[posi] = mg.blocks.bedrock
					end
				elseif pos.y >= -mg.depth -1 and pos.y <= -3 then
					if	(pos.x == -mg.size -1 and (pos.z >= -mg.size -1 and pos.z <= mg.size +1))
					 or	(pos.x ==  mg.size +1 and (pos.z >= -mg.size -1 and pos.z <= mg.size +1))
					 or	(pos.z == -mg.size -1 and (pos.x >= -mg.size -1 and pos.x <= mg.size +1))
					 or	(pos.z ==  mg.size +1 and (pos.x >= -mg.size -1 and pos.x <= mg.size +1))
					 or (pos.y == -3 and (pos.x > mg.size +1 or pos.x < -mg.size -1 or pos.z > mg.size +1 or pos.z < -mg.size -1)) then
						data[posi] = mg.blocks.bedrock
					end
				elseif pos.y < 0 and pos.y > -3 then
					data[posi] = mg.blocks.water
				end
			end
		end
	end

	vm:set_data(data)
	vm:write_to_map()
end)
