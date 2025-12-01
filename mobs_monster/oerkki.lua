local ent_name, ent_def = advanced_fight_lib.get_entity({"mobs_monster:oerkki"})

local oerkki_get_armor = function(self, hit_data, armor)
	local coefs = self.axis_armors[hit_data.details.hit_axis]
	for group, coef in pairs(coefs or {}) do
		armor[group] = armor[group] * coef
	end
	print("Oerkki armor: "..dump(armor))
	return armor
end

local parts = {
	head = {
		box = {x_min = -0.2, y_min = 0.35, z_min = -0.2,
					 x_max = 0.2, y_max = 0.9, z_max = 0.2},
		part_of_health = 0.8,
		damage_multiplier = 1.25,
		miss_chance = 0.7,
		miss_chance_angles = {
			[0] = 0.7,
			[60] = 0.7,
			[90] = 0.3,
			[135] = 0.1,
			[180] = 0.1,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		axis_armors = {
			["x-"] = {fleshy=0.5},
			["x+"] = {fleshy=0.5},
			["y+"] = {fleshy=0.5},
			["z-"] = {fleshy=0.5},
		},
		values = {
			["mobs:walk_chance"] = {
					name = "head",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.4,
					over_value = 0.1,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:stand_chance"] = {
					name = "head",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 1.5,
					over_value = 2.0,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:attack_chance"] = {
					name = "head",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 3.0,
					over_value = 9.0,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:attack_patience"] = {
					name = "head",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.5,
					over_value = 0.25,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
		},
		effects = {
			["eye_hit"] = advanced_fight_lib.create_point_hit_effect({
					points = {
						{x=0.4, y=0.35},
						{x=0.6, y=0.35},
					},
					points_size = 3/16,
					points_axis = "z+",
					points_max_health = 0.5,
					part_damage_key = "eyes_damage",
					name = "head",
					values = {
						["mobs:view_range"] = {
								name = "head",
								part_damage_key = "eyes_damage",
								cb_calculate_damage = advanced_fight_lib.point_hit_effect_view_range_calculate_damage,
								threshold_start = 1,
								threshold_peak = 2,
								base_value = 1.0,
								peak_value = 0.3,
								over_value = 0.2,
								curve = 1,
								value = 1,
								rule = "multiply",
								priority = 100,
						},
				},
				effects_group_label = "advanced_fight_eye_hit_effects",
			}),
		},
		cb_get_armor = oerkki_get_armor,
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	torso = {
		box = {x_min = -0.15, y_min = -0.2, z_min = -0.2,
					 x_max = 0.15, y_max = 0.35, z_max = 0.15},
		part_of_health = 1,
		damage_multiplier = 1,
		axis_armors = {
			["x-"] = {fleshy=0.5},
			["x+"] = {fleshy=0.5},
			["z-"] = {fleshy=0.5},
		},
		values = {},
		cb_get_armor = oerkki_get_armor,
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	hand_left = {
		box = {x_min = -0.32, y_min = -0.4, z_min = -0.08,
					 x_max = -0.15, y_max = 0.35, z_max = 0.08},
		part_of_health = 0.4,
		damage_multiplier = 0.5,
		miss_chance = 0.5,
		miss_chance_angles = {
			[0] = 0.5,
			[60] = 0.5,
			[90] = 0.4,
			[135] = 0.3,
			[180] = 0.3,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		axis_armors = {
			["x-"] = {fleshy=0.5},
			["z-"] = {fleshy=0.5},
		},
		values = {
			["mobs:damage"] = {
					name = "hand_left",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.5,
					over_value = 0.25,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:reach"] = {
					name = "hand_left",
					threshold_start = 0.6,
					threshold_peak = 0.9,
					base_value = 1.0,
					peak_value = 0.8,
					over_value = 0.5,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
		},
		cb_get_armor = oerkki_get_armor,
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	hand_right = {
		box = {x_min = 0.15, y_min = -0.4, z_min = -0.08,
					 x_max = 0.32, y_max = 0.35, z_max = 0.08},
		part_of_health = 0.4,
		damage_multiplier = 0.5,
		miss_chance = 0.5,
		miss_chance_angles = {
			[0] = 0.5,
			[60] = 0.5,
			[90] = 0.4,
			[135] = 0.3,
			[180] = 0.3,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		axis_armors = {
			["x+"] = {fleshy=0.5},
			["z-"] = {fleshy=0.5},
		},
		values = {
			["mobs:damage"] = {
					name = "hand_right",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.5,
					over_value = 0.25,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:reach"] = {
					name = "hand_right",
					threshold_start = 0.6,
					threshold_peak = 0.9,
					base_value = 1.0,
					peak_value = 0.8,
					over_value = 0.5,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
		},
		cb_get_armor = oerkki_get_armor,
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	legs = {
		box = {x_min = -0.15, y_min = -1, z_min = -0.15,
					 x_max = 0.15, y_max = -0.2, z_max = 0.15},
		part_of_health = 0.7,
		damage_multiplier = 0.7,
		axis_armors = {
			["x-"] = {fleshy=0.5},
			["z+"] = {fleshy=0.5},
			["z-"] = {fleshy=0.5},
		},
		values = {},
		cb_get_armor = oerkki_get_armor,
		on_hit = advanced_fight_lib.entity_on_hit,
	}
}

local parts_attack = {
	hand_left = {
		box = {x_min = -0.32, y_min = -0.0, z_min = -0.08,
					 x_max = -0.15, y_max = 0.3, z_max = 0.65},
		miss_chance = 0.6,
	},
	hand_right = {
		box = {x_min = 0.15, y_min = -0.0, z_min = -0.08,
					 x_max = 0.32, y_max = 0.3, z_max = 0.65},
		miss_chance = 0.6,
	},
}

local parts_walk = {
	head = {
		box = {x_min = -0.2, y_min = 0.35, z_min = -0.2,
					 x_max = 0.2, y_max = 0.9, z_max = 0.4},
		miss_chance = 0.8,
	},
	hand_left = {
		box = {x_min = -0.32, y_min = -0.4, z_min = -0.08,
					 x_max = -0.15, y_max = 0.35, z_max = 0.22},
		miss_chance = 0.6,
	},
	hand_right = {
		box = {x_min = 0.15, y_min = -0.4, z_min = -0.08,
					 x_max = 0.32, y_max = 0.35, z_max = 0.22},
		miss_chance = 0.6,
	},
}

if ent_def then
	local hitgroup_name = "mobs_monster:oerkki"
	hitboxes_lib.register_hitboxes(hitgroup_name, parts)
	parts_walk = hitboxes_lib.update_hitgroup_parts(parts, parts_walk)
	hitboxes_lib.register_hitboxes(hitgroup_name.."_walk", parts_walk)
	hitboxes_lib.register_hitboxes(hitgroup_name.."_attack",
			hitboxes_lib.update_hitgroup_parts(parts_walk, parts_attack))

	ent_def.get_hitgroup_name = function(self)
		print("Current animation: "..self.animation.current)
		if self.animation.current == "run" 
				or self.animation.current == "punch" then
			return hitgroup_name.."_attack"
		elseif self.animation.current == "walk" then
			return hitgroup_name.."_walk"
		end
		return hitgroup_name
	end
	advanced_fight_lib.mobs.replace_do_punch(ent_def)

	ent_def.attack_offsets = {
		punch_offset = vector.new(0, 0.5, 0),
		target_offset = vector.new(0, 1.2, 0),
	}
	ent_def._hit_range = ent_def.reach
end