--- Misc. Helper functions

function atlas_id(tex, id)
	local x = id % 16
	local y = math.floor(id / 16)

	return tex..".png^[sheet:16x16:"..x..","..y
end

function terrain(id)
	return atlas_id("terrain", id)
end

-- Returns a table with sounds for the given material.
function block_sound(material)
	-- TODO: metal sounds
	if material == "metal" then
		material = "stone"
	end

	local table = {
		footstep = {
			name = material,
			gain = 0.5
		},
		dig = {
			name = material,
			gain = 1.0
		},
		dug = {
			name = material,
			gain = 1.0
		},
		place = {
			name = material,
			gain = 1.0
		}
	}

	return table
end
