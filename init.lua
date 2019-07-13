local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

dofile (modpath .. "/materials.lua")
dofile (modpath .. "/recipes.lua")
dofile (modpath .. "/blocks/decomposer.lua")
dofile (modpath .. "/blocks/quartz_glass.lua")
dofile (modpath .. "/blocks/phosphorus.lua")

-- TODO electric arc furnace
-- TODO gas extraction unit
-- Gas extraction furnace, makes hydrogen fluoride and some silver sand from stone dust.
-- TODO aluminium preparation plant
-- The majority of aluminium fluoride is produced by treating alumina with hydrogen fluoride gas at 700 °C
-- TODO Verneuil furnace
-- TODO zone melting furnace
-- TODO fluorum bottle
-- TODO hydrogen bottle
-- TODO energy exhaust system (steam, CO2, heat?)
-- TODO aluminium production methods http://www.popadancev.net/poluchenie-alyuminiya/
