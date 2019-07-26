-- This block provides a machine, giving anodizing coatings for aluminium

local load_time_start = minetest.get_us_time()

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("dst") and inv:is_empty("src")
end

--
-- local function decomposer_process(pos)
-- 	local meta = minetest.get_meta(pos)
-- 	local inv = meta:get_inventory()
-- 	local dust_content = tonumber(meta:get_string("dust_content"))
--   local input = meta:get_int("HV_EU_input")
--   local demand = meta:get_int("HV_EU_demand")
--   -- Give players stuff when we have stuff AND energy to give items
--   if dust_content > 0 and input >= demand then
--     dust_content = dust_content - 1
--     meta:set_string("dust_content", tostring(dust_content))
--     item = get_random_item()
--     if string.len(item) >= 1 then
--       inv:add_item("dst", item)
--     end
--   end
-- end

-- function get_decomposer_formspec()
-- 	return "size[8.2,8]"..
-- 	  "label[0.1,0;Source]"..
-- 		"list[context;src;0.1,0.6;8,1;]"..
-- 	  "label[0.1,1.6;Output]"..
-- 		"list[context;dst;0.1,2.2;8,2;]"..
-- 	  "label[0.1,3.2;Inventory]"..
-- 		"list[current_player;main;0.1,3.8;8,1;]"..
-- 		"list[current_player;main;0.1,5;8,3;8]"..
-- 		"listring[context;dst]"..
-- 		"listring[current_player;main]"..
-- 		"listring[context;src]"..
-- 		"listring[current_player;main]"
-- end

local function after_inventory_change(pos)
-- 	minetest.get_node_timer(pos):start(1.0)
end

local function run(pos, node)
--   local meta = minetest.get_meta(pos)
--   local dust_content = tonumber(meta:get_string("dust_content"))
--   -- Set demand depending on contained source material
--   if dust_content > 0 then
--     power_requirement = 100000
--   else
--     power_requirement = 0
--   end
--   meta:set_int("HV_EU_demand", power_requirement)
--   -- Recharge decomposer
--   decomposer_recharge(pos)
--   -- Process source material
-- 	decomposer_process(pos)
end

minetest.register_node("material_science:e_coater", {
	description = "MV E-coating machine",
	tiles = {
	  	"coater.png",
      "coater.png",
      "coater_side.png",
      "coater_side.png",
      "coater_side_empty.png",
      "coater_side_empty.png"
	},
	paramtype2 = "facedir",
	groups = {
    dig_immediate = 2, tubedevice = 1, tubedevice_receiver = 1,
    technic_machine = 1, technic_mv = 1,
  },
  tube = {
    insert_object = function(pos, node, stack, direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			-- local added = inv:add_item("src", stack)
			-- after_inventory_change(pos)
			return added
		end,
		can_insert = function(pos, node, stack, direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:room_for_item("src", stack)
		end,
		input_inventory = "dst",
		connect_sides = {
        left = 0, right = 0,
        front = 1, back = 1,
        top = 1, bottom = 1
    }
  },

	legacy_facedir_simple = true,
	is_ground_content = false,

	sounds = default.node_sound_metal_defaults(),

	can_dig = can_dig,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)

    -- meta:set_string("formspec", get_decomposer_formspec())
		meta:set_string("infotext", "Aluminium paint coater")
		-- meta:set_string("dust_content", "0")

    local inv = meta:get_inventory()
		inv:set_size('src', 8)
		inv:set_size('dst', 8)

    meta:set_int("MV_EU_input", 0)
		meta:set_int("MV_EU_demand", 0)
	end,

	on_metadata_inventory_move = function(pos)
		-- minetest.get_node_timer(pos):start(1.0)
	end,

	on_metadata_inventory_put = function(pos)
		-- minetest.get_node_timer(pos):start(1.0)
	end,

  technic_run = run,

  -- TODO
	-- allow_metadata_inventory_put = allow_metadata_inventory_put,
	-- allow_metadata_inventory_move = allow_metadata_inventory_move,
	-- allow_metadata_inventory_take = allow_metadata_inventory_take,
})

if minetest.get_modpath("technic") then
	technic.register_machine(
    "MV", "material_science:e_coater", technic.receiver
  )
end

-- TODO sounds
-- https://freesound.org/people/copyc4t/sounds/235659/
-- https://freesound.org/people/DrMaysta/sounds/349697/

print(
  string.format(
    "[coater] loaded after ca. %.2fs",
    os.clock() - load_time_start
  )
)
