local settings = {
	-- Decomposer options
	decomposer_power_requirement = 100000 / 2,
	decomposer_item_requirement = 10,
	enable_decomposer = true,
	-- Colors, dyeing unit, paints
  enable_colors_for_aluminium = true,
	-- Saw
  enable_saw_for_aluminium = true,
}

local modname = minetest.get_current_modname()
local prefix = modname.."_"

-- Scan settings
for name, value in pairs(settings) do
	local setting_type = type(value)
	if setting_type == "boolean" then
		material_science[name] = minetest.settings:get_bool(prefix..name)
		if material_science[name] == nil then
			material_science[name] = value
		end
	else
		material_science[name] = value
	end
end
