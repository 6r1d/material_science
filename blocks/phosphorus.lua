-- TODO dynamic glow
minetest.register_node("material_science:phosphorus_block", {
	description = "Phosphorus block",
  drawtype = "glasslike",
	alpha = 200,
	tiles = {"phosphorus_block.png"},
  paramtype = "light",
  sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	-- sounds = default.node_sound_glass_defaults(),
})

-- TODO glass alloy
