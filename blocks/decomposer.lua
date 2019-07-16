local load_time_start = minetest.get_us_time()

-- TODO try to move item randomizer to some other file
-- TODO support more material types

-- Amount of source material required to start processing
local item_amount = 5
local item_req = "technic:stone_dust " .. tostring(item_amount)

-- Init weights
local items = {}
items['material_science:silicon_dioxide_dust'] = 0.282
items['material_science:alumina_dust']         = 0.0823
items['material_science:rust']                 = 0.0563
items['material_science:calcium_oxide_dust']   = 0.0415
items['material_science:lye']                  = 0.0236
items['material_science:magnesium_oxide_dust'] = 0.0233
items['material_science:fluorite_dust']        = 0.022
items['material_science:potash']               = 0.0209
items['technic:coal_dust']                     = 0.0002
items['material_science:phosphorus_dust']      = 0.0002
items['technic:sulfur_dust']                   = 0.00035
items['technic:chromium_dust']                 = 0.000102
items['technic:copper_dust']                   = 0.00006
items['technic:zinc_dust']                     = 0.00007
items['technic:lead_dust']                     = 0.000014
items['technic:tin_dust']                      = 0.0000023
items['technic:uranium_dust']                  = 0.0000027
items['technic:silver_dust']                   = 0.000000075
items['technic:gold_dust']                     = 0.000000004

-- Increment element probabilities, since these are less than one
-- and we don't use most of the periodic table
local remainder = 1
local item_counter = 0
for item, _ in pairs( items ) do
    item_counter = item_counter + 1
    remainder = remainder - items[item]
end

-- Gives players only registered stuff, survival-style
items[""] = remainder

-- Gives players more stuff :-)
-- for item, _ in pairs( items ) do
--     items[item] = items[item] + remainder / item_counter
-- end

function get_random_item()
	-- Update random seed
	math.randomseed( os.time() )
	output_item = ""
  z = math.random()
  for item, _ in pairs( items ) do
			if z < items[item] then
			    output_item = item
			    break;
			else
		 	    z = z - items[item]
			end
  end
	return output_item
end

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("dst") and inv:is_empty("src")
end

local function decomposer_recharge(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local charge = tonumber(meta:get_string("charge"))
	if inv:contains_item("src", item_req) and charge < item_amount then
			inv:remove_item("src", item_req)
			charge = charge + item_amount
			meta:set_string("charge", tostring(charge))
	end
end

local function decomposer_process(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local charge = tonumber(meta:get_string("charge"))
  local input = meta:get_int("HV_EU_input")
  local demand = meta:get_int("HV_EU_demand")
  -- Give players stuff when we have stuff AND energy to give items
  if charge > 0 and input >= demand then
    charge = charge - 1
    meta:set_string("charge", tostring(charge))
    item = get_random_item()
    if string.len(item) >= 1 then
      inv:add_item("dst", item)
    end
  end
end

-- TODO do we need a node timer or everything is ok on Technic base anyway?!
-- local function decomposer_node_timer(pos, elapsed)
-- 	local meta = minetest.get_meta(pos)
-- 	decomposer_recharge(pos)
-- 	decomposer_process(pos)
-- 	local charge = tonumber(meta:get_string("charge"))
-- 	return charge > 0
-- end

function get_decomposer_formspec()
	return "size[8.2,8]"..
	  "label[0.1,0;Source]"..
		"list[context;src;0.1,0.6;8,1;]"..
	  "label[0.1,1.6;Output]"..
		"list[context;dst;0.1,2.2;8,2;]"..
	  "label[0.1,3.2;Inventory]"..
		"list[current_player;main;0.1,3.8;8,1;]"..
		"list[current_player;main;0.1,5;8,3;8]"..
		"listring[context;dst]"..
		"listring[current_player;main]"..
		"listring[context;src]"..
		"listring[current_player;main]"
end

local function after_inventory_change(pos)
	minetest.get_node_timer(pos):start(1.0)
end

local function run(pos, node)
  local meta = minetest.get_meta(pos)
  local charge = tonumber(meta:get_string("charge"))
  -- Set demand depending on contained source material
  if charge > 0 then
    power_requirement = 12000
  else
    power_requirement = 0
  end
  meta:set_int("HV_EU_demand", power_requirement)
  -- Recharge decomposer
  decomposer_recharge(pos)
  -- Process source material
	decomposer_process(pos)
end

minetest.register_node("material_science:decomposer", {
	description = "HV Material decomposer",
	tiles = {
	  	"decomposer.png"
	},
	paramtype2 = "facedir",
	groups = {
    dig_immediate = 2, tubedevice = 1, tubedevice_receiver = 1,
    technic_machine = 1, technic_hv = 1,
  },
  tube = {
    insert_object = function(pos, node, stack, direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local added = inv:add_item("src", stack)
			after_inventory_change(pos)
			return added
		end,
		can_insert = function(pos, node, stack, direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:room_for_item("src", stack)
		end,
		input_inventory = "dst",
		connect_sides = {
        left = 1, right = 1,
        front = 1, back = 1,
        top = 1, bottom = 1
    }
  },

	legacy_facedir_simple = true,
	is_ground_content = false,

	sounds = default.node_sound_metal_defaults(),

	on_timer = decomposer_node_timer,

	can_dig = can_dig,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_decomposer_formspec())
		meta:set_string("infotext", "Material decomposer")
		meta:set_string("charge", "0")
		local inv = meta:get_inventory()
		inv:set_size('src', 8)
		inv:set_size('dst', 8)

    meta:set_int("HV_EU_input", 0)
		meta:set_int("HV_EU_demand", 0)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,

	on_metadata_inventory_put = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,

  technic_run = run,

  -- TODO
	-- allow_metadata_inventory_put = allow_metadata_inventory_put,
	-- allow_metadata_inventory_move = allow_metadata_inventory_move,
	-- allow_metadata_inventory_take = allow_metadata_inventory_take,
})

if minetest.get_modpath("technic") then
	technic.register_machine(
    "HV", "material_science:decomposer", technic.receiver
  )
end

print(
  string.format(
    "[decomposer] loaded after ca. %.2fs",
    os.clock() - load_time_start
  )
)
