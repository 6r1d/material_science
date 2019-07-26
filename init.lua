material_science = {}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Settings
dofile(modpath .. "/settings.lua")
-- Materials
dofile(modpath .. "/materials.lua")
-- Recipes
dofile(modpath .. "/recipes.lua")
-- Machines
dofile(modpath .. "/blocks/alkali_metal_extractor.lua")
dofile(modpath .. "/blocks/decomposer.lua")
dofile(modpath .. "/blocks/coater.lua")
dofile(modpath .. "/blocks/flame_fusion_injector.lua")
dofile(modpath .. "/blocks/water_splitter.lua")
-- Blocks
dofile(modpath .. "/blocks/quartz_glass.lua")
dofile(modpath .. "/blocks/phosphorus.lua")
dofile(modpath .. "/blocks/aluminium_block.lua")
