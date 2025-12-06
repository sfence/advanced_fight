
local armor_sets = {
	"3d_armor:%s_admin",
	"3d_armor:%s_bronze",
	"3d_armor:%s_cactus",
	"3d_armor:%s_crystal",
	"3d_armor:%s_diamond",
	"3d_armor:%s_gold",
	"3d_armor:%s_mithril",
	"3d_armor:%s_nether",
	"3d_armor:%s_steel",
	"3d_armor:%s_wood",
}
local armor_elements = {
	["head"] = "helmet",
	["torso"] = "chestplate",
	["legs"] = "leggings",
	["feet"] = "boots"
}

local armor_shields = {
	"shields:shield_admin",
	"shields:shield_bronze",
	"shields:shield_cactus",
	"shields:shield_crystal",
	"shields:shield_diamond",
	"shields:shield_gold",
	"shields:shield_mithril",
	"shields:shield_nether",
	"shields:shield_steel",
	"shields:shield_wood",
	"shields:shield_enhanced_cactus",
	"shields:shield_enhanced_wood",
}

core.register_on_mods_loaded(function()
	-- update armors
	for _, set in pairs(armor_sets) do
		local sum_groups = {}
		for group, _ in pairs(armor.registered_groups) do
			sum_groups[group] = 0
		end
		for element, armor_name in pairs(armor_elements) do
			local item_name = string.format(set, armor_name)
			local def = core.registered_items[item_name]
			if def then
				if def.armor_groups then
					for group, level in pairs(def.armor_groups) do
						sum_groups[group] = sum_groups[group] + level
					end
				else
					sum_groups["fleshy"] = sum_groups["fleshy"] + def.groups["armor_"..element]
				end
			end
		end
		for _, element in pairs(armor_elements) do
			local item_name = string.format(set, element)
			local def = core.registered_items[item_name]
			if def then
				core.override_item(item_name, {
					full_armor_groups = sum_groups,
				})
			end
		end
	end
	-- update shields
	for _, shield_name in pairs(armor_shields) do
		local def = core.registered_items[shield_name]
		if def then
			core.override_item(shield_name, {
				use_chance = 0.9,
				use_chance_angles = {
					[0] = 0.9,
					[20] = 0.9,
					[45] = 0.7,
					[60] = 0.35,
					[95] = 0.0,
				},
				full_use_interval = 0.6,
				shield_speed = 45,
			})
		end
	end
	-- update helmets
	for _, set in pairs(armor_sets) do
		local item_name = string.format(set, "helmet")
		local def = core.registered_items[item_name]
		if def then
			local brain_concussion_coef = 0.95 * (1 - def.full_armor_groups / 100)
			core.override_item(item_name, {
				_brain_concussion_coef = brain_concussion_coef,
				axis_hit_tables = {
					helmet = {
						["z+"] = {
							width = 8,
							height = 8,
							data = {
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 1/6, 1/6, 0, 0, 1/6, 1/6, 0},
								{0, 1/6, 1/6, 0, 0, 1/6, 1/6, 0},
								{0, 1/6, 1/4, 1/6, 1/6, 1/4, 1/6, 0},
								{1/8, 1/4, 1/2, 1/4, 1/4, 1/2, 1/4, 1/8},
								{1/4, 1/2, 1/2, 1/2, 1/0, 1/2, 1/2, 1/4},
							}
						},
						["z-"] = {
							width = 8,
							height = 8,
							data = {
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{1/8, 0, 0, 0, 0, 0, 0, 1/8},
								{1/6, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/6},
							}
						},
						["x+"] = {
							width = 8,
							height = 8,
							data = {
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{1/4, 1/4, 1/4, 1/4, 1/4, 1/4, 1/4, 1/4},
								{1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8},
							}
						},
						["x-"] = {
							width = 8,
							height = 8,
							data = {
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{1/4, 1/4, 1/4, 1/4, 1/4, 1/4, 1/4, 1/4},
								{1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8},
							}
						},
						["y-"] = {
							width = 1,
							height = 1,
							data = {
								{1}
							}
						}
					}
				},
			})
		end
	end
	-- update torsos
	for _, set in pairs(armor_sets) do
		local item_name = string.format(set, "chestplate")
		local def = core.registered_items[item_name]
		if def then
			core.override_item(item_name, {
				axis_hit_tables = {
					torso = {
						["z+"] = {
							width = 8,
							height = 11,
							data = {
								{0, 0, 1/6, 1/3, 1/3, 1/6, 0, 0},
								{0, 0, 0, 1/6, 1/6, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
								{0, 0, 0, 0, 0, 0, 0, 0},
							}
						},
					}
				},
			})
		end
	end
end)