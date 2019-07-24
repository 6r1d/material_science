local function register_aluminium_block(block_name, name, texture)
		minetest.register_node(block_name, {
			description = name,
			tiles = {texture},
			paramtype2 = "facedir",
			groups = { cracky = 1 },
			sounds = default.node_sound_metal_defaults(),
		})
end

-- Configure aluminium blocks
local block_configs = {
  {
    block = "material_science:aluminium_block",
    name = "Aluminium block",
    tex = "aluminium_block.png"
  },
  {
    block = "material_science:aluminium_block_black",
    name = "Aluminium block (black)",
    tex = "aluminium_block_black.png"
  },
  {
    block = "material_science:aluminium_block_blue",
    name = "Aluminium block (blue)",
    tex = "aluminium_block_blue.png"
  },
  {
    block = "material_science:aluminium_block_brown",
    name = "Aluminium block (brown)",
    tex = "aluminium_block_brown.png"
  },
  {
    block = "material_science:aluminium_block_cyan",
    name = "Aluminium block (cyan)",
    tex = "aluminium_block_cyan.png"
  },
  {
    block = "material_science:aluminium_block_dark_green",
    name = "Aluminium block (dark green)",
    tex = "aluminium_block_dark_green.png"
  },
  {
    block = "material_science:aluminium_block_dark_grey",
    name = "Aluminium block (dark_grey)",
    tex = "aluminium_block_dark_grey.png"
  },
  {
    block = "material_science:aluminium_block_green",
    name = "Aluminium block (green)",
    tex = "aluminium_block_green.png"
  },
  {
    block = "material_science:aluminium_block_grey",
    name = "Aluminium block (grey)",
    tex = "aluminium_block_grey.png"
  },
  {
    block = "material_science:aluminium_block_magenta",
    name = "Aluminium block (brown)",
    tex = "aluminium_block_magenta.png"
  },
  {
    block = "material_science:aluminium_block_orange",
    name = "Aluminium block (orange)",
    tex = "aluminium_block_orange.png"
  },
  {
    block = "material_science:aluminium_block_pink",
    name = "Aluminium block (pink)",
    tex = "aluminium_block_pink.png"
  },
  {
    block = "material_science:aluminium_block_red",
    name = "Aluminium block (red)",
    tex = "aluminium_block_red.png"
  },
  {
    block = "material_science:aluminium_block_violet",
    name = "Aluminium block (violet)",
    tex = "aluminium_block_violet.png"
  },
  {
    block = "material_science:aluminium_block_white",
    name = "Aluminium block (white)",
    tex = "aluminium_block_white.png"
  },
  {
    block = "material_science:aluminium_block_yellow",
    name = "Aluminium block (yellow)",
    tex = "aluminium_block_yellow.png"
  }
}

-- Register aluminium blocks
for _, block_conf in pairs(block_configs) do
  register_aluminium_block(
		block_conf["block"],
		block_conf["name"],
		block_conf["tex"]
	)
end

-- Register aluminium blocks for a circular saw
if minetest.get_modpath("moreblocks") then
		for _, block_conf in pairs(block_configs) do
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
