
local data = {}

minetest.register_node("mccnt_mapgen:invisible_bedrock", {
	description = "Invisible Bedrock",
	drawtype = "airlike",
	pointable = true,
	diggable = false,
	buildable_to = false,
	sunlight_propagates = true,
	groups = { not_in_creative_inventory = 1 }
})

minetest.register_node("mccnt_mapgen:solid_water", {
	description = "Solid Water",
	drawtype = "glasslike",
	tiles = { terrain(14) },
	use_texture_alpha = "blend",
	paramtype = "light",
	pointable = true,
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
		water = minetest.get_content_id("minecraft:water"),
	},
	size = 128,
	depth = 64
}

if minetest.get_mapgen_setting('mg_name') == "singlenode" then

minetest.register_on_generated(function(minp, maxp, blockseed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	vm:get_data(data)

	for z = 0, 79 do
		for y = 0, 79 do
			for x = 0, 79 do
				local pos = {
					x = minp.x + x,
					y = minp.y + y,
					z = minp.z + z
				}

				local posi = area:index(pos.x, pos.y, pos.z)

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
				elseif	pos.y >= 0 and (
						(pos.x == -mg.size -1 and (pos.z >= -mg.size -1 and pos.z <= mg.size +1))
					 or	(pos.x ==  mg.size +1 and (pos.z >= -mg.size -1 and pos.z <= mg.size +1))
					 or	(pos.z == -mg.size -1 and (pos.x >= -mg.size -1 and pos.x <= mg.size +1))
					 or	(pos.z ==  mg.size +1 and (pos.x >= -mg.size -1 and pos.x <= mg.size +1))) then
					data[posi] = mg.blocks.invisible_bedrock
				elseif pos.y < 0 and pos.y > -3 then
					if	(pos.x == -mg.size -1 and (pos.z >= -mg.size -1 and pos.z <= mg.size +1))
					 or	(pos.x ==  mg.size +1 and (pos.z >= -mg.size -1 and pos.z <= mg.size +1))
					 or	(pos.z == -mg.size -1 and (pos.x >= -mg.size -1 and pos.x <= mg.size +1))
					 or	(pos.z ==  mg.size +1 and (pos.x >= -mg.size -1 and pos.x <= mg.size +1)) then
						data[posi] = mg.blocks.solid_water
					else
						data[posi] = mg.blocks.water
					end
				end
			end
		end
	end

	vm:set_data(data)
	vm:write_to_map()
end)

end
