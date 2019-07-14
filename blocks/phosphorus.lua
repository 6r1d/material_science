local function get_light_above(pos)
	local pos1 = {}
	pos1.y = pos.y + 1
	pos1.x = pos.x
	pos1.z = pos.z
	return minetest.get_node_light(pos1, nil)
end

local function phosphorus_node_timer(pos, elapsed)
	local meta = minetest.get_meta(pos)
	local power = tonumber(meta:get_string("power")) or 0
	local power_upd = power
	local charge = tonumber(meta:get_string("charge")) or 0
	local charge_step = 1
	local light = get_light_above(pos) or 0
	local time_of_day = minetest.get_timeofday()

	if light >= 12 and time_of_day >= 0.24 and time_of_day <= 0.76 then
		if charge >= 10 and power < 14 then
			power_upd = power + 1
		else
			charge = charge + charge_step
			meta:set_string("charge", tostring(charge))
		end
	else
		if charge <= 0 and power >= 1 then
			power_upd = power - 1
		else
			charge = charge - charge_step
			meta:set_string("charge", tostring(charge))
		end
	end

	if power_upd ~= power then
		minetest.set_node(pos, { name = "material_science:phosphorus_block_"..power_upd })
		meta:set_string("power", tostring(power_upd))
		meta:set_string("charge", "0")
	end

	return true
end

-- TODO sounds
for brightness_level = 0, 14 do
		minetest.register_node("material_science:phosphorus_block_"..brightness_level, {
				description = "Phosphorus block",
				light_source = brightness_level,
			  drawtype = "glasslike",
				alpha = 200,
				tiles = {"phosphorus_block.png"},
			  paramtype = "light",
			  sunlight_propagates = true,
				is_ground_content = false,
				groups = {cracky = 3, oddly_breakable_by_hand = 3},
				-- sounds = default.node_sound_glass_defaults(),
				on_timer = phosphorus_node_timer,
				after_place_node = function(pos, placer, itemstack, pointed_thing)
					local meta = minetest.get_meta(pos)
					meta:set_string("power", tonumber(brightness_level))
					meta:set_string("charge", "0")
					minetest.get_node_timer(pos):start(1.0)
				end,
		})
end

minetest.register_craftitem("material_science:phosphorus_block", {
	description = "Phosphorus block",
	inventory_image = "green_cube.png",
	wield_image = "green_cube.png",
	wield_scale = {x = 2, y = 2, z = 2},
  on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		if minetest.get_node(pos).name == "air" then
			minetest.set_node(pos, {name = "material_science:phosphorus_block_0"})
			local meta = minetest.get_meta(pos)
			meta:set_string("power", "0")
			meta:set_string("charge", "0")
			minetest.get_node_timer(pos):start(1.0)
			itemstack:take_item()
		end
		return itemstack
  end
})
