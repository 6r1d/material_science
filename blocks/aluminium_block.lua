minetest.register_node("material_science:aluminium_block", {
	description = "Aluminium block",
	tiles = {
	  	"aluminium_block.png"
	},
	paramtype2 = "facedir",
	groups = { cracky = 1 },
	sounds = default.node_sound_metal_defaults(),
})

-- technic = rawget(_G, "technic") or {}
-- local have_technic = minetest.get_modpath("technic")
-- if have_technic and technic.register_recipe_type then

-- TODO typecheck
-- if type(register_stair_and_slab_and_panel_and_micro) == "function" then
-- TODO gettext support
-- https://github.com/minetest-mods/moreblocks/blob/master/intllib.lua
-- Sources:
-- (USING)
-- https://notabug.org/TenPlus1/ethereal/src/master/stairs.lua
-- ..
-- https://sys4.fr/gitea/nalc/technic/src/branch/master/extranodes/init.lua


	local dyes = {"white", "grey", "black", "red", "yellow", "green", "cyan",
	              "blue", "magenta", "orange", "violet", "brown", "pink",
	              "dark_grey", "dark_green"}
	for _, name in pairs(dyes) do
	end

if minetest.get_modpath("moreblocks") then
		-- stairsplus.register_stair_and_slab_and_panel_and_micro(
		-- 	"",
		-- 	"",
		-- 	"",
		-- 	{
		-- 			snappy=1, bendy=2, cracky=1, melty=2, level=2,
		-- 			not_in_creative_inventory=1
		-- 	},
		-- 	{"aluminium_block.png"},
		-- 	"Aluminium Block Stairs",
		-- 	"Aluminium Block Corner",
		-- 	"Aluminium Block Slab",
		-- 	"Aluminium Block Wall",
		-- 	"Aluminium Block Panel",
		-- 	"Aluminium Microblock",
		-- 	"aluminium_block",
		-- 	default.node_sound_stone_defaults()
		-- )

		stairsplus:register_all("material_science", "aluminium_block", "material_science:aluminium_block", {
			description="Aluminium Block",
			groups={cracky=1, not_in_creative_inventory=1},
			tiles={"aluminium_block.png"},
		})
end

-- TODO dyes
-- https://github.com/minetest-mods/moreblocks/blob/master/stairsplus/registrations.lua
