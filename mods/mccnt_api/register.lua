
-- register_node wrapper for minecraftn't classic

function minecraftnt.register_block(name, def)
	if not def.groups then def.groups = {} end
	if not def.unbreakable then
		def.groups.instantly = 3
	end

	def.drop = ""

	def.stack_max = 1

	if def.inventory_image then
		def.tiles = def.tiles or { def.inventory_image }
		def.drawtype = "plantlike"
		def.paramtype = "light"
		def.walkable = false
		def.sunlight_propagates = true
	end

	if def.slab then
		def.drawtype = "nodebox"
		def.paramtype = "light"
		def.node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
			}
		}
	end

	if def.sound then
		def.sounds = block_sound(def.sound)
		def.sound = nil
	end

	if def.admin_block then
		def.on_place = function(itemstack, placer, pointed_thing)
			if not minetest.check_player_privs(placer, 'give') then
				minetest.chat_send_player(placer:get_player_name(), red("You don't have permission to place this block!"))
				return itemstack
			end
			minetest.set_node(pointed_thing.above, { name = itemstack:get_name() })
			return itemstack
		end
	end

	minetest.register_node(":minecraft:"..name, def)
end
