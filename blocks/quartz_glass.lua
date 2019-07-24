minetest.register_node("material_science:quartz_glass", {
	description = "Quartz glass",
  drawtype = "glasslike",
	alpha = 200,
	inventory_image = "glass_cube.png",
	wield_image = "glass_block_wield.png",
	tiles = {"quartz_glass.png"},
  paramtype = "light",
  sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	-- sounds = default.node_sound_glass_defaults(),
})
