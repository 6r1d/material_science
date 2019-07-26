minetest.register_node("material_science:flame_fusion_injector", {
	tiles = {
		"aluminium_block_dark_grey.png",
		"aluminium_block_dark_grey.png",
		"aluminium_block_dark_grey.png",
		"aluminium_block_dark_grey.png",
		"aluminium_block_dark_grey.png",
		"aluminium_block_dark_grey.png"
	},
	groups = {
    dig_immediate = 2, tubedevice = 1, tubedevice_receiver = 1,
    technic_machine = 1, technic_hv = 1,
  },
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.25, -0.5, 0.375, 0.25, -0.375}, -- Front
			{-0.375, -0.25, 0.375, 0.375, 0.25, 0.5}, -- Back
			{-0.5, -0.25, -0.375, -0.375, 0.25, 0.375}, -- Left
			{0.375, -0.25, -0.375, 0.5, 0.25, 0.375}, -- Right
			{-0.375, 0, -0.375, 0.375, 0.125, 0.375}, -- Hat
			{-0.1875, -0.5, -0.1875, 0.1875, 0.375, 0.1875}, -- Tube
			{-0.5, -0.5, -0.5, -0.375, 0.25, -0.375}, -- A
			{-0.5, -0.5, 0.375, -0.375, 0.25, 0.5}, -- B
			{0.375, -0.5, 0.375, 0.5, 0.25, 0.5}, -- C
			{0.375, -0.5, -0.5, 0.5, 0.25, -0.375}, -- D
			{-0.125, 0.3125, -0.125, 0.125, 0.5, 0.125}, -- NodeBox11
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
		}
	}
})
