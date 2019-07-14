-- Look up craft examples there:
-- https://github.com/minetest/minetest/blob/b298b0339c79db7f5b3873e73ff9ea0130f05a8a/games/minimal/mods/default/init.lua

-- Make a glass from SiO2 dust
minetest.register_craft({
	type = "cooking",
	output = "material_science:quartz_glass",
	recipe = "material_science:silicon_dioxide_dust",
})

-- Makes lye from sodium
-- TODO add sides
minetest.register_craft({
	output = 'material_science:lye',
	recipe = {
		{'bucket:bucket_water'},
		{'material_science:sodium'}
	}
})
minetest.register_craft({
	output = 'material_science:lye',
	recipe = {
		{'material_science:sodium'},
    {'bucket:bucket_water'}
	}
})

-- Makes phosphorus bar from phosphorus dust
minetest.register_craft({
	type = "cooking",
	output = "material_science:phosphorus_bar",
	recipe = "material_science:phosphorus_dust",
})

-- Makes phosphorus block from phosphorus bars
minetest.register_craft({
	output = 'material_science:phosphorus_block',
	recipe = {
		{'material_science:phosphorus_bar', 'material_science:phosphorus_bar', 'material_science:phosphorus_bar'},
		{'material_science:phosphorus_bar', 'material_science:phosphorus_bar', 'material_science:phosphorus_bar'},
		{'material_science:phosphorus_bar', 'material_science:phosphorus_bar', 'material_science:phosphorus_bar'},
	}
})

technic = rawget(_G, "technic") or {}
local have_technic = minetest.get_modpath("technic")
if have_technic and technic.register_recipe_type then
	technic.register_alloy_recipe({
		input = {
				"material_science:rust", "technic:coal_dust"
		},
		output="technic:wrought_iron_dust",
		time = 3
	})
	-- Carbothermal reduction of silicon
	technic.register_alloy_recipe({
		input = {
				"material_science:silicon_dioxide_dust", "technic:coal_dust"
		},
		output="material_science:silicon_dust",
		time = 9
	})
end



-- TODO electric arc furnace recipes
-- technic.register_recipe_type("grinding", { description = S("Grinding") })
-- https://github.com/minetest-mods/technic/blob/e1a71a8fb0bf052358cdb6b197a5bf5b20341205/technic/machines/register/grinder_recipes.lua
