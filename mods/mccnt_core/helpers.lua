--- Misc. Helper functions

function atlas_id(tex, id)
	local x = id % 16
	local y = math.floor(id / 16)

	return tex..".png^[sheet:16x16:"..x..","..y
end

function terrain(id)
	return atlas_id("terrain", id)
end

function block_sound(material)
	-- TODO
	return nil
end