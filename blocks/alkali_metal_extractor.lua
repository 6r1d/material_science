local groups = {
	dig_immediate = 2, tubedevice = 1, tubedevice_receiver = 1,
	technic_machine = 1, technic_hv = 1,
}

minetest.register_node("material_science:alkali_extractor", {
	description = "HV alkali metal extractor",
	groups = groups,
	tiles = {
		"aluminium_tex.png",
		"aluminium_tex.png",
		"aluminium_tex.png",
		"aluminium_tex.png",
		"aluminium_tex.png",
		"aluminium_tex.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.4375, 0.5}, -- box_back
			{-0.4375, -0.5, -0.4375, -0.375, 0.4375, 0.4375}, -- box_left
			{0.375, -0.5, -0.4375, 0.4375, 0.4375, 0.4375}, -- box_right
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.4375}, -- box_bottom
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- box_top
			{-0.5, -0.1875, -0.1875, -0.4375, 0.125, -0.125}, -- box_io_tube_l_front
			{-0.375, -0.5, -0.4375, 0.375, -0.1875, -0.375}, -- front_wall
			{-0.1875, -0.3125, -0.125, -0.125, 0.4375, 0.125}, -- Wire_L
			{0.125, -0.3125, -0.125, 0.1875, 0.4375, 0.0625}, -- Wire_R
			{-0.5, -0.125, 0.125, -0.375, 0.125, 0.1875}, -- box_io_tube_l_deep
			{-0.5, 0.125, -0.1875, -0.4375, 0.1875, 0.1875}, -- box_io_tube_l_top
			{-0.5, -0.1875, -0.1875, -0.4375, -0.125, 0.1875}, -- box_io_tube_l_bottom
			{0.4375, 0.125, -0.125, 0.5, 0.1875, 0.1875}, -- box_io_tube_r_top
			{0.4375, -0.1875, 0.125, 0.5, 0.125, 0.1875}, -- box_io_tube_r_deep
			{0.4375, -0.1875, -0.1875, 0.5, -0.125, 0.1875}, -- box_io_tube_r_bottom
			{0.4375, -0.1875, -0.1875, 0.5, 0.1875, -0.125}, -- box_io_tube_r_front
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
		}
	},
	tube = {
    -- insert_object = function(pos, node, stack, direction)
		-- 	local meta = minetest.get_meta(pos)
		-- 	local inv = meta:get_inventory()
		-- 	local added = inv:add_item("src", stack)
		-- 	after_inventory_change(pos)
		-- 	return added
		-- end,
		-- can_insert = function(pos, node, stack, direction)
		-- 	local meta = minetest.get_meta(pos)
		-- 	local inv = meta:get_inventory()
		-- 	return inv:room_for_item("src", stack)
		-- end,
		-- input_inventory = "dst",
		connect_sides = {
        left = 1, right = 1,
        front = 0, back = 0,
        top = 0, bottom = 0
    }
  },
})
