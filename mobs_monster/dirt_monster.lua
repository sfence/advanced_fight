local ent_name, ent_def = advanced_fight_lib.get_entity({"mobs_monster:dirt_monster"})

local parts = {
	head = {
		box = {x_min = -0.25, y_min = 0.45, z_min = -0.25,
					 x_max = 0.25, y_max = 0.75, z_max = 0.2},
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
						{x=2/8, y=0.5},
						{x=6/8, y=0.5},
					},
					points_radius = 1/8,
					points_area = 1/12,
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
				texture_hit_point = "advanced_fight_dirt_monster_hit_eye_%s.png",
				effects_group_label = "advanced_fight_eye_hit_effects",
				cb_on_update = advanced_fight_lib.mobs.point_hit_effects_group_on_update,
			}),
		},
		effects_group_label = "advanced_fight_head_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	torso = {
		box = {x_min = -0.22, y_min = -0.2, z_min = -0.15,
					 x_max = 0.22, y_max = 0.45, z_max = 0.15},
		part_of_health = 1,
		damage_multiplier = 1,
		values = {},
		effects_group_label = "advanced_fight_torso_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	hand_left = {
		box = {x_min = -0.4, y_min = -0.2, z_min = -0.1,
					 x_max = -0.22, y_max = 0.45, z_max = 0.1},
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
		effects_group_label = "advanced_fight_hand_left_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	hand_right = {
		box = {x_min = 0.22, y_min = -0.2, z_min = -0.1,
					 x_max = 0.4, y_max = 0.45, z_max = 0.1},
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
		effects_group_label = "advanced_fight_hand_right_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	legs = {
		box = {x_min = -0.2, y_min = -1, z_min = -0.1,
					 x_max = 0.2, y_max = -0.2, z_max = 0.1},
		part_of_health = 0.7,
		damage_multiplier = 0.7,
		miss_chance = 0.4,
		miss_chance_angles = {
			[0] = 0.4,
			[60] = 0.4,
			[90] = 0.3,
			[135] = 0.2,
			[180] = 0.2,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
			["mobs:walk_velocity"] = {
					name = "legs",
					threshold_start = 0.4,
					threshold_peak = 1.0,
					base_value = 1.0,
					peak_value = 0.3,
					over_value = 0.15,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:run_velocity"] = {
					name = "legs",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.1,
					over_value = 0.05,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
		},
		effects_group_label = "advanced_fight_legs_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	}
}

local parts_attack = {
	hand_left = {
		box = {x_min = -0.4, y_min = 0.35, z_min = -0.1,
					 x_max = -0.22, y_max = 0.6, z_max = 0.65},
	},
	hand_right = {
		box = {x_min = 0.22, y_min = 0.35, z_min = -0.1,
					 x_max = 0.4, y_max = 0.6, z_max = 0.65},
	}
}

if ent_def then
	local hitgroup_name = "mobs_monster:dirt_monster"
	hitboxes_lib.register_hitboxes(hitgroup_name, parts)
	hitboxes_lib.register_hitboxes(hitgroup_name.."_attack",
			hitboxes_lib.update_hitgroup_parts(parts, parts_attack))

	ent_def.get_hitgroup_name = function(self)
		print("Current animation: "..self.animation.current)
		if self.animation.current == "run" 
				or self.animation.current == "punch" then
			return hitgroup_name.."_attack"
		end
		return hitgroup_name
	end
	advanced_fight_lib.mobs.replace_do_punch(ent_def)

	ent_def._attack_data = {
		hit_range = ent_def.reach,
		hit_box = hitboxes_lib.collisionbox_to_box({-0.09, -0.12, -0.09, 0.09, 0.12, 0.09}),
		hit_area = 0.18*0.24,
		punch_offset = vector.new(0, 0.5, 0),
		target_offset = vector.new(0, 1.4, 0),
		horizontal_inaccuracy = 3,
		vertical_inaccuracy = 5,
	}
end
