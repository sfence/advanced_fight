

local brain_concussion = players_effects.brain_concussion

local parts = {
	head = {
		box = {x_min = -0.25, y_min = 1.25, z_min = -0.25,
					 x_max = 0.25, y_max = 1.7, z_max = 0.22},
		part_of_health = 0.8,
		damage_multiplier = 1.5,
		heal_multiplier = 0.4,
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
		},
		effects = {
			["right_eye_hit"] = advanced_fight_lib.create_point_hit_effect({
					points = {
						{x=0.65, y=0.415},
					},
					points_size = 1/8,
					points_axis = "z+",
					points_max_health = 0.5,
					part_damage_key = "right_eye_damage",
					name = "head",
					values = {
						["player:right_eye_vision"] = {
								name = "head",
								part_damage_key = "right_eye_damage",
								cb_calculate_damage = advanced_fight_lib.point_hit_effect_view_range_calculate_damage,
								threshold_start = 1,
								threshold_peak = 2,
								base_value = 1.0,
								peak_value = 0.3,
								over_value = 0.05,
								curve = 1,
								value = 1,
								rule = "multiply",
								priority = 100,
						},
				},
				effects_group_label = "advanced_fight_right_eye_hit_effects",
				cb_on_update = advanced_fight_lib.point_hit_effects_group_on_update,
			}),
			["left_eye_hit"] = advanced_fight_lib.create_point_hit_effect({
					points = {
						{x=0.35, y=0.415},
					},
					points_size = 1/8,
					points_axis = "z+",
					points_max_health = 0.5,
					part_damage_key = "left_eye_damage",
					name = "head",
					values = {
						["player:left_eye_vision"] = {
								name = "head",
								part_damage_key = "left_eye_damage",
								cb_calculate_damage = advanced_fight_lib.point_hit_effect_view_range_calculate_damage,
								threshold_start = 1,
								threshold_peak = 2,
								base_value = 1.0,
								peak_value = 0.3,
								over_value = 0.05,
								curve = 1,
								value = 1,
								rule = "multiply",
								priority = 100,
						},
				},
				effects_group_label = "advanced_fight_left_eye_hit_effects",
				cb_on_update = advanced_fight_lib.point_hit_effects_group_on_update,
			}),
			["brain_concussion"] = {
				effects = {
					["visual_snaking"] = {
						 mean_interval = {
							base_value = 20.0,
							peak_value = 10.5,
							over_value = 3.8,
							curve = 1.2,
							threshold_start = 0.2,
							threshold_peak  = 0.7,
							value = 1,
						},
						std_interval = {
							base_value = 5.5,
							peak_value = 3.0,
							over_value = 1.5,
							curve = 1.0,
							threshold_start = 0.3,
							threshold_peak  = 0.8,
							value = 1,
						},
						mean_duration = {
							base_value = 1.5,
							peak_value = 3.0,
							over_value = 4.0,
							curve = 1.0,
							threshold_start = 0.2,
							threshold_peak  = 0.6,
							value = 1,
						},
						std_duration = {
							base_value = 1.3,
							peak_value = 1.6,
							over_value = 2.0,
							curve = 1.0,
							threshold_start = 0.3,
							threshold_peak  = 0.7,
							value = 1,
						},
						mean_intensity = {
							base_value = 0.2,
							peak_value = 0.5,
							over_value = 0.8,
							curve = 1.5,
							threshold_start = 0.1,
							threshold_peak  = 0.6,
							value = 1,
						},
						std_intensity = {
							base_value = 0.1,
							peak_value = 0.2,
							over_value = 0.3,
							curve = 1.0,
							threshold_start = 0.2,
							threshold_peak  = 0.7,
							value = 1,
						},
						horizontal_intensity_coef = 0.7,
						vertical_intensity_coef = 0.5,
						cb_next_time = brain_concussion.effect_visual_shaking.cb_next_time,
						cb_apply_effect = brain_concussion.effect_visual_shaking.cb_apply_effect,
					},
					["visual_sensitivity"] = {
						mean_interval = {
								base_value = 15.0,
								peak_value = 8.0,
								over_value = 4.0,
								curve = 1.2,
								threshold_start = 0.2,
								threshold_peak  = 0.7,
								value = 1,
						},
						std_interval = {
								base_value = 4.0,
								peak_value = 2.0,
								over_value = 1.0,
								curve = 1.0,
								threshold_start = 0.3,
								threshold_peak  = 0.8,
								value = 1,
						},
						mean_duration = {
								base_value = 2.0,
								peak_value = 4.0,
								over_value = 6.0,
								curve = 1.0,
								threshold_start = 0.2,
								threshold_peak  = 0.6,
								value = 1,
						},
						std_duration = {
								base_value = 0.5,
								peak_value = 1.0,
								over_value = 1.5,
								curve = 1.0,
								threshold_start = 0.3,
								threshold_peak  = 0.7,
								value = 1,
						},
						mean_intensity = {
								base_value = 0.3,
								peak_value = 0.6,
								over_value = 0.9,
								curve = 1.5,
								threshold_start = 0.1,
								threshold_peak  = 0.6,
								value = 1,
						},
						std_intensity = {
								base_value = 0.1,
								peak_value = 0.2,
								over_value = 0.3,
								curve = 1.0,
								threshold_start = 0.2,
								threshold_peak  = 0.7,
								value = 1,
						},
						opacity_coef = 255,
						cb_next_time = brain_concussion.effect_visual_sensitivity.cb_next_time,
						cb_apply_effect = brain_concussion.effect_visual_sensitivity.cb_apply_effect,
					},
					["drop_item"] = {
						mean_interval = {
							base_value = 60.0,
							peak_value = 30.0,
							over_value = 10.0,
							curve = 1.2,
							threshold_start = 0.4,
							threshold_peak  = 0.8,
							value = 1,
						},
						std_interval = {
							base_value = 10.0,
							peak_value = 6.0,
							over_value = 3.0,
							curve = 1.0,
							threshold_start = 0.4,
							threshold_peak  = 0.8,
							value = 1,
						},
						mean_duration = {
							base_value = 0.5,
							peak_value = 1.0,
							over_value = 1.5,
							curve = 1.0,
							threshold_start = 0.4,
							threshold_peak  = 0.8,
							value = 1,
						},
						std_duration = {
							base_value = 0.2,
							peak_value = 0.3,
							over_value = 0.5,
							curve = 1.0,
							threshold_start = 0.4,
							threshold_peak  = 0.8,
							value = 1,
						},
						mean_intensity = {
							base_value = 0.1,
							peak_value = 0.4,
							over_value = 0.8,
							curve = 1.5,
							threshold_start = 0.4,
							threshold_peak  = 0.8,
							value = 1,
						},
						std_intensity = {
							base_value = 0.05,
							peak_value = 0.1,
							over_value = 0.2,
							curve = 1.0,
							threshold_start = 0.4,
							threshold_peak  = 0.8,
							value = 1,
						},
						cb_next_time = brain_concussion.effects_next_time_default,
						cb_apply_effect = function(self, group_data, player, brain_data, time_data, add_value)
							if math.random() < time_data.intensity then
								advanced_fight_lib.player.effect_disarm_right(self, player, nil)
								advanced_fight_lib.player.effect_disarm_left(self, player, nil)
							end
						end,
					},
					["slowmotion"] = {
						mean_interval = {
							base_value = 40.0,
							peak_value = 20.0,
							over_value = 8.0,
							curve = 1.2,
							threshold_start = 0.3,
							threshold_peak  = 0.8,
							value = 1,
						},
						std_interval = {
							base_value = 8.0,
							peak_value = 5.0,
							over_value = 2.0,
							curve = 1.0,
							threshold_start = 0.3,
							threshold_peak  = 0.8,
							value = 1,
						},
						mean_duration = {
							base_value = 3.0,
							peak_value = 6.0,
							over_value = 10.0,
							curve = 1.0,
							threshold_start = 0.3,
							threshold_peak  = 0.8,
							value = 1,
						},
						std_duration = {
							base_value = 1.0,
							peak_value = 2.0,
							over_value = 3.0,
							curve = 1.0,
							threshold_start = 0.3,
							threshold_peak  = 0.8,
							value = 1,
						},
						mean_intensity = {
							base_value = 0.2,
							peak_value = 0.5,
							over_value = 0.9,
							curve = 1.5,
							threshold_start = 0.3,
							threshold_peak  = 0.8,
							value = 1,
						},
						std_intensity = {
							base_value = 0.05,
							peak_value = 0.1,
							over_value = 0.2,
							curve = 1.0,
							threshold_start = 0.3,
							threshold_peak  = 0.8,
							value = 1,
						},
						cb_next_time = brain_concussion.effects_next_time_default,
						cb_apply_effect = function(self, group_data, player, brain_data, time_data, add_value)
							local speed_modifier = 1.0 - time_data.intensity * 0.5
							add_value(player, "player:speed", {value = speed_modifier, rule = "multiply"})
						end,
					},
				},
				add_brain_concussion_factor = 0.3,
				time_per_damage = 31,
				add_brain_concussion = brain_concussion.add_brain_concussion_default,
				cb_add_effect = brain_concussion.add_effects_group_brain_concussion,
				cb_load_effect = brain_concussion.load_effects_group_brain_concussion,
				cb_on_respawn = brain_concussion.respawn_brain_concussion_default,
			},
		},
		effects_group_label = "advanced_fight_head_hit_effects",
		on_hit = advanced_fight_lib.player.on_hit,
		on_load = advanced_fight_lib.parts.on_load,
	},
	torso = {
		box = {x_min = -0.22, y_min = 0.65, z_min = -0.12,
					 x_max = 0.22, y_max = 1.25, z_max = 0.12},
		part_of_health = 1,
		damage_multiplier = 1,
		values = {},
		effects_group_label = "advanced_fight_torso_hit_effects",
		on_hit = advanced_fight_lib.player.on_hit,
	},
	arm_left = {
		box = {x_min = -0.44, y_min = 1.0, z_min = -0.12,
					 x_max = -0.22, y_max = 1.27, z_max = 0.12},
		part_of_health = 0.4,
		damage_multiplier = 0.5,
		miss_chance = 0.4,
		miss_chance_angles = {
			[0] = 0.4,
			[60] = 0.4,
			[90] = 0.3,
			[135] = 0.1,
			[180] = 0.0,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
		},
		effects_group_label = "advanced_fight_hand_left_hit_effects",
		on_hit = advanced_fight_lib.player.on_hit,
	},
	arm_right = {
		box = {x_min = 0.22, y_min = 1.0, z_min = -0.12,
					 x_max = 0.44, y_max = 1.27, z_max = 0.12},
		part_of_health = 0.4,
		damage_multiplier = 0.5,
		miss_chance = 0.4,
		miss_chance_angles = {
			[0] = 0.4,
			[60] = 0.4,
			[90] = 0.3,
			[135] = 0.1,
			[180] = 0.0,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
		},
		effects_group_label = "advanced_fight_hand_right_hit_effects",
		on_hit = advanced_fight_lib.player.on_hit,
	},
	hand_left = {
		box = {x_min = -0.44, y_min = 0.6, z_min = -0.12,
					 x_max = -0.22, y_max = 1.0, z_max = 0.12},
		part_of_health = 0.4,
		damage_multiplier = 0.5,
		miss_chance = 0.8,
		miss_chance_angles = {
			[0] = 0.8,
			[60] = 0.8,
			[90] = 0.6,
			[135] = 0.2,
			[180] = 0.1,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
		},
		effects = {
			["player:disarm_left"] = {
				hit_area = {
					min = vector.new(-0.1, -0.1, -0.1),
					max = vector.new(1.1, 0.5, 1.1),
				},
				cb_add_effect = advanced_fight_lib.player.effect_disarm_left,
			},
		},
		effects_group_label = "advanced_fight_hand_left_hit_effects",
		on_hit = advanced_fight_lib.player.on_hit,
	},
	hand_right = {
		box = {x_min = 0.22, y_min = 0.6, z_min = -0.12,
					 x_max = 0.44, y_max = 1.0, z_max = 0.12},
		part_of_health = 0.4,
		damage_multiplier = 0.5,
		miss_chance = 0.8,
		miss_chance_angles = {
			[0] = 0.8,
			[60] = 0.8,
			[90] = 0.6,
			[135] = 0.2,
			[180] = 0.1,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
		},
		effects = {
			["player:disarm_right"] = {
				hit_area = {
					min = vector.new(-0.1, -0.1, -0.1),
					max = vector.new(1.1, 0.5, 1.1),
				},
				cb_add_effect = advanced_fight_lib.player.effect_disarm_right,
			},
		},
		effects_group_label = "advanced_fight_hand_right_hit_effects",
		on_hit = advanced_fight_lib.player.on_hit,
	},
	legs = {
		box = {x_min = -0.22, y_min = 0.3, z_min = -0.12,
					 x_max = 0.22, y_max = 0.65, z_max = 0.12},
		part_of_health = 0.5,
		damage_multiplier = 0.7,
		heal_multiplier = 0.25,
		armor_element = "legs",
		miss_chance = 0.5,
		miss_chance_angles = {
			[0] = 0.3,
			[60] = 0.3,
			[90] = 0.2,
			[135] = 0.1,
			[180] = 0.0,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
			["player:speed"] = {
					name = "legs",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.7,
					over_value = 0.5,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
		},
		effects_group_label = "advanced_fight_legs_hit_effects",
		cb_get_armor = advanced_fight_lib.player.get_armor,
		on_hit = advanced_fight_lib.player.on_hit,
		on_load = advanced_fight_lib.parts.on_load,
	},
	feet = {
		box = {x_min = -0.22, y_min = 0.0, z_min = -0.12,
					 x_max = 0.22, y_max = 0.3, z_max = 0.12},
		part_of_health = 0.2,
		damage_multiplier = 0.4,
		heal_multiplier = 0.09,
		armor_element = "feet",
		miss_chance = 0.5,
		miss_chance_angles = {
			[0] = 0.5,
			[60] = 0.5,
			[90] = 0.4,
			[135] = 0.15,
			[180] = 0.1,
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
			["player:speed"] = {
					name = "feet",
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
		effects_group_label = "advanced_fight_feet_hit_effects",
		cb_get_armor = advanced_fight_lib.player.get_armor,
		on_hit = advanced_fight_lib.player.on_hit,
		on_load = advanced_fight_lib.parts.on_load,
	}
}

parts_armor = {
	head = {
		box = {x_min = -0.22, y_min = 1.34, z_min = -0.25,
					 x_max = 0.22, y_max = 1.77, z_max = 0.22},
	},
	torso = {
		box = {x_min = -0.20, y_min = 0.7, z_min = -0.12,
					 x_max = 0.20, y_max = 1.34, z_max = 0.12},
	},
	arm_left = {
		box = {x_min = -0.42, y_min = 1.16, z_min = -0.12,
					 x_max = -0.20, y_max = 1.36, z_max = 0.10},
	},
	arm_right = {
		box = {x_min = 0.20, y_min = 1.16, z_min = -0.12,
					 x_max = 0.42, y_max = 1.36, z_max = 0.10},
	},
	hand_left = {
		box = {x_min = -0.42, y_min = 0.65, z_min = -0.12,
					 x_max = -0.20, y_max = 1.16, z_max = 0.10},
	},
	hand_right = {
		box = {x_min = 0.20, y_min = 0.65, z_min = -0.12,
					 x_max = 0.42, y_max = 1.16, z_max = 0.10},
	},
	legs = {
		box = {x_min = -0.22, y_min = 0.35, z_min = -0.12,
					 x_max = 0.22, y_max = 0.7, z_max = 0.12},
	},
	feet = {
		box = {x_min = -0.22, y_min = 0.0, z_min = -0.12,
					 x_max = 0.22, y_max = 0.35, z_max = 0.12},
	},
}

local parts_attack = {
	hand_right = {
		box = {x_min = 0.22, y_min = 0.35, z_min = -0.1,
					 x_max = 0.4, y_max = 0.6, z_max = 0.65},
	}
}

hitboxes_lib.get_player_hitgroup_name = function(self)
	return "player:player"
end

local have_3d_armor = core.get_modpath("3d_armor") ~= nil

local hitgroup_name = "player:player"

if have_3d_armor then
	parts = hitboxes_lib.update_hitgroup_parts(parts, parts_armor)
end

hitboxes_lib.register_hitboxes(hitgroup_name, parts)
hitboxes_lib.register_hitboxes(hitgroup_name.."_attack",
		hitboxes_lib.update_hitgroup_parts(parts, parts_attack))

