local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

dofile (modpath .. "/materials.lua")
dofile (modpath .. "/recipes.lua")
dofile (modpath .. "/blocks/decomposer.lua")
dofile (modpath .. "/blocks/quartz_glass.lua")
dofile (modpath .. "/blocks/phosphorus.lua")
dofile (modpath .. "/blocks/aluminium_block.lua")
