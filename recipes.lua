-- Look up craft examples there:
-- https://github.com/minetest/minetest/blob/b298b0339c79db7f5b3873e73ff9ea0130f05a8a/games/minimal/mods/default/init.lua

minetest.register_craft({
	output = 'material_science:wet_alumina 8',
	recipe = {
		{'material_science:alumina_dust', 'material_science:alumina_dust', 'material_science:alumina_dust'},
		{'material_science:alumina_dust', 'default:ice', 'material_science:alumina_dust'},
		{'material_science:alumina_dust', 'material_science:alumina_dust', 'material_science:alumina_dust'},
	}
})

minetest.register_craft({
	output = 'material_science:wet_alumina 8',
	recipe = {
		{'material_science:alumina_dust', 'material_science:alumina_dust', 'material_science:alumina_dust'},
		{'material_science:alumina_dust', 'bucket:bucket_water', 'material_science:alumina_dust'},
		{'material_science:alumina_dust', 'material_science:alumina_dust', 'material_science:alumina_dust'},
	},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

-- Make a glass from SiO2 dust
minetest.register_craft({
	type = "cooking",
	output = "material_science:quartz_glass",
	recipe = "material_science:silicon_dioxide_dust",
})

-- Unprocessed cryolite, the process I meant is making the sulfuric acid,
-- mixing it with fluorite, processing alumina dust with hydrogen fluoride
-- (not sure if it actually works)
minetest.register_craft({
	output = 'material_science:unprocessed_cryolite',
	recipe = {
		{'bucket:bucket_water', 'technic:sulfur_dust'},
		{'material_science:fluorite_dust', 'material_science:alumina_dust'}
	}
})

minetest.register_craft({
	type = "cooking",
	output = "material_science:cryolite_dust",
	recipe = "material_science:unprocessed_cryolite",
})

-- Make an aluminium bar
minetest.register_craft({
	type = "cooking",
	output = "material_science:aluminium_bar",
	recipe = "material_science:aluminium_granules",
})

-- Aluminium blocks
minetest.register_craft({
	output = 'material_science:aluminium_block',
	recipe = {
		{'material_science:aluminium_bar', 'material_science:aluminium_bar', 'material_science:aluminium_bar'},
		{'material_science:aluminium_bar', 'material_science:aluminium_bar', 'material_science:aluminium_bar'},
		{'material_science:aluminium_bar', 'material_science:aluminium_bar', 'material_science:aluminium_bar'},
	}
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
local have_charcoal = minetest.get_modpath("charcoal")
if have_technic and technic.register_recipe_type then
	-- Charcoal to coal dust
	if have_charcoal then
		technic.register_grinder_recipe({
			input = {"charcoal:charcoal_lump"},
			output = "technic:coal_dust 1"
		})
	end
	-- Making obsidian shards
	technic.register_alloy_recipe({
		input = {"default:flint", "technic:coal_dust"},
		output="default:obsidian_shard",
		time = 3
	})
	-- Smelting iron
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
	-- Aluminium preparation
	technic.register_alloy_recipe({
		input = {
				"material_science:cryolite_dust", "material_science:alumina_dust"
		},
		output={
				"material_science:cryolite_dust", "material_science:aluminium_granules"
		},
		time = 3
	})
end
