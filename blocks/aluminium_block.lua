-- Configure aluminium blocks
dofile(
	minetest.get_modpath("material_science") ..
	"/blocks/aluminium_block_configs.lua"
)

local function register_aluminium_block(block_name, name, texture)
		minetest.register_node(block_name, {
			description = name,
			tiles = {texture},
			paramtype2 = "facedir",
			groups = { cracky = 1 },
			sounds = default.node_sound_metal_defaults(),
		})
end

-- Register aluminium blocks
for _, block_conf in pairs(material_science.block_configs) do
  register_aluminium_block(
		block_conf["block"],
		block_conf["name"],
		block_conf["tex"]
	)
end

-- Register aluminium blocks for a circular saw
if minetest.get_modpath("moreblocks") then
		for _, block_conf in pairs(material_science.block_configs) do
			stairsplus:register_all(
				"material_science",
				string.gsub(block_conf["block"], 'material_science:', ''),
				block_conf["block"],
				{
					description=block_conf["name"],
					groups={cracky=1, not_in_creative_inventory=1},
					tiles={block_conf["tex"]},
				}
			)
		end
end

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


	-- local dyes = {"white", "grey", "black", "red", "yellow", "green", "cyan",
	--               "blue", "magenta", "orange", "violet", "brown", "pink",
	--               "dark_grey", "dark_green"}
	-- for _, name in pairs(dyes) do
	-- end

-- TODO dyes
-- https://github.com/minetest-mods/moreblocks/blob/master/stairsplus/registrations.lua
