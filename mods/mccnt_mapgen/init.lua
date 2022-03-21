
local data = {}

minetest.register_node("mccnt_mapgen:invisible_bedrock", {
	description = "Invisible Bedrock",
	drawtype = "airlike",
	paramtype = "light",
	pointable = false,
	diggable = false,
	buildable_to = false,
	sunlight_propagates = true,
	groups = { not_in_creative_inventory = 1 },
})

minetest.register_node("mccnt_mapgen:solid_water", {
	description = "Solid Water",
	drawtype = "glasslike",
	tiles = { terrain(14) },
	use_texture_alpha = "blend",
	paramtype = "light",
	pointable = false,
	diggable = false,
	buildable_to = false,
	sunlight_propagates = true,
	groups = { not_in_creative_inventory = 1 },
})

local mg = {
	blocks = {
		grass = minetest.get_content_id("minecraft:grass"),
		dirt = minetest.get_content_id("minecraft:dirt"),
		stone = minetest.get_content_id("minecraft:stone"),
		bedrock = minetest.get_content_id("minecraft:bedrock"),
		invisible_bedrock = minetest.get_content_id("mccnt_mapgen:invisible_bedrock"),
		solid_water = minetest.get_content_id("mccnt_mapgen:solid_water"),
		water = minetest.get_content_id("minecraft:water"),
	},
	size = 128,
	depth = 64,
	small_depth = 8,
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

				-- inside the border
				if (pos.x >= -mg.size and pos.x <= mg.size) and (pos.z >= -mg.size and pos.z <= mg.size) then
					if pos.y > 0 then
						-- air, leave as-is
					elseif pos.y == 0 then
						data[posi] = mg.blocks.grass
					elseif pos.y >= -mg.small_depth then
						data[posi] = mg.blocks.dirt
					elseif pos.y >= -mg.depth then
						data[posi] = mg.blocks.stone
					elseif pos.y == -mg.depth -1 then
						data[posi] = mg.blocks.bedrock
					-- else pos.y < -mg.depth -1 then -- air, leave as-is
					end

				-- the border
				elseif (
					    (pos.x == -mg.size -1)
					 or	(pos.x ==  mg.size +1)
					 or	(pos.z == -mg.size -1)
					 or	(pos.z ==  mg.size +1)
				) then
					if pos.y > 0 then
						data[posi] = mg.blocks.invisible_bedrock
					elseif pos.y >= -mg.depth-1 then
						data[posi] = mg.blocks.solid_water
					else -- pos.y < -mg.depth-1
						data[posi] = mg.blocks.invisible_bedrock
					end

				-- outside the border
				-- infinite ocean
				else -- (pos.x < -mg.size-1 or pos.x > mg.size+1) or (pos.z < -mg.size-1 or pos.z > mg.size+1)
					if pos.y > 0 then
						-- air, leave as-is
					elseif pos.y >= -mg.depth-1 then
						data[posi] = mg.blocks.solid_water
					-- else pos.y < -mg.depth-1 then -- air, leave as-is
					end
				end
			end
		end
	end

	vm:set_data(data)
	vm:write_to_map()
	minetest.fix_light(minp, maxp)
end)

end
