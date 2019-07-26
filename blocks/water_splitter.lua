minetest.register_node("material_science:water_splitter", {
	tiles = {
		"water_splitter_top.png",
		"water_splitter_bottom.png",
		"water_splitter_side.png",
		"water_splitter_side.png",
		"water_splitter_side_trans.png",
		"water_splitter_side_trans.png"
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
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- Bottom
			{-0.25, -0.375, -0.375, -0.1875, -0.1875, 0.375}, -- plate2
			{-0.125, -0.375, -0.375, -0.0625, -0.1875, 0.375}, -- plate3
			{0, -0.375, -0.375, 0.0625, -0.1875, 0.375}, -- plate4
			{0.125, -0.375, -0.375, 0.1875, -0.1875, 0.375}, -- plate5
			{0.25, -0.375, -0.375, 0.3125, -0.1875, 0.375}, -- plate6
			{-0.5, -0.4375, -0.5, -0.4375, 0.5, 0.5}, -- Left
			{0.4375, -0.4375, -0.5, 0.5, 0.5, 0.5}, -- Right
			{-0.5, 0.25, -0.5, 0.5, 0.4375, 0.5}, -- Top
			{-0.4375, -0.4375, 0.4375, 0.4375, 0.5, 0.5}, -- Front
			{-0.4375, -0.4375, -0.5, 0.4375, 0.5, -0.4375}, -- Back
			{-0.1875, 0.25, -0.1875, 0.1875, 0.5, 0.1875}, -- Tube
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
		}
	}
})
