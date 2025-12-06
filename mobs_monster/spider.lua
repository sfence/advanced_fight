local ent_name, ent_def = advanced_fight_lib.get_entity({"mobs_monster:spider"})

local parts = {
	head = {
		box = {x_min = -0.25, y_min = -0.5, z_min = 0.0,
					 x_max = 0.25, y_max = -0.25, z_max = 0.55},
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
		effects_group_label = "advanced_fight_head_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	torso = {
		box = {x_min = -0.25, y_min = -0.5, z_min = -0.5,
					 x_max = 0.25, y_max = 0, z_max = 0.0},
		part_of_health = 1,
		damage_multiplier = 1,
		values = {},
		effects_group_label = "advanced_fight_torso_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	right_legs = {
		box = {x_min = 0.25, y_min = -0.5, z_min = -0.25,
					 x_max = 0.75, y_max = -0.25, z_max = 0.75},
		part_of_health = 0.35,
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
					name = "right_legs",
					threshold_start = 0.4,
					threshold_peak = 1.0,
					base_value = 1.0,
					peak_value = 0.5,
					over_value = 0.25,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:run_velocity"] = {
					name = "right_legs",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.3,
					over_value = 0.15,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
		},
		effects_group_label = "advanced_fight_right_legs_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	left_legs = {
		box = {x_min = -0.75, y_min = -0.5, z_min = -0.25,
					 x_max = -0.25, y_max = -0.25, z_max = 0.75},
		part_of_health = 0.35,
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
					name = "left_legs",
					threshold_start = 0.4,
					threshold_peak = 1.0,
					base_value = 1.0,
					peak_value = 0.5,
					over_value = 0.25,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
			["mobs:run_velocity"] = {
					name = "left_legs",
					threshold_start = 0.2,
					threshold_peak = 0.8,
					base_value = 1.0,
					peak_value = 0.3,
					over_value = 0.15,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
				},
		},
		effects_group_label = "advanced_fight_left_legs_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	}
}

local parts_2_top_eyes = {
	head = {
		effects = {
			["eye_hit"] = advanced_fight_lib.create_point_hit_effect({
					points = {
						{x=0.35, z=0.85},
						{x=0.65, z=0.85},
					},
					points_radius = 2/24,
					points_area = 4/220,
					points_axis = "y+",
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
				texture_hit_point = "advanced_fight_spider_2_top_hit_eye_%s.png",
				effects_group_label = "advanced_fight_eye_hit_effects",
				cb_on_update = advanced_fight_lib.mobs.point_hit_effects_group_on_update,
			}),
		},
	},
}

local parts_4_top_eyes = {
	head = {
		effects = {
			["eye_hit"] = advanced_fight_lib.create_point_hit_effect({
					points = {
						{x=0.15, z=0.85},
						{x=0.35, z=0.85},
						{x=0.65, z=0.85},
						{x=0.85, z=0.85},
					},
					points_radius = 1/16,
					points_area = 1/64,
					points_axis = "y+",
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
				texture_hit_point = "advanced_fight_spider_4_top_hit_eye_%s.png",
				effects_group_label = "advanced_fight_eye_hit_effects",
				cb_on_update = advanced_fight_lib.mobs.point_hit_effects_group_on_update,
			}),
		},
	},
}

local parts_4_front_eyes = {
	head = {
		effects = {
			["eye_hit"] = advanced_fight_lib.create_point_hit_effect({
					points = {
						{x=0.85, y=0.90},
						{x=0.65, y=0.80},
						{x=0.35, y=0.80},
						{x=0.15, y=0.90},
					},
					points_radius = 1/32,
					points_area = 1/200,
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
				texture_hit_point = "advanced_fight_spider_4_front_hit_eye_%s.png",
				effects_group_label = "advanced_fight_eye_hit_effects",
				cb_on_update = advanced_fight_lib.mobs.point_hit_effects_group_on_update,
			}),
		},
	},
}

if ent_def then
	local hitgroup_name = "mobs_monster:spider"

	parts_2_top_eyes = hitboxes_lib.update_hitgroup_parts(parts, parts_2_top_eyes)
	parts_4_top_eyes = hitboxes_lib.update_hitgroup_parts(parts, parts_4_top_eyes)
	parts_4_front_eyes = hitboxes_lib.update_hitgroup_parts(parts, parts_4_front_eyes)

	hitboxes_lib.register_hitboxes(hitgroup_name.."_2_top_eyes", parts_2_top_eyes)
	hitboxes_lib.register_hitboxes(hitgroup_name.."_4_top_eyes", parts_4_top_eyes)
	hitboxes_lib.register_hitboxes(hitgroup_name.."_4_front_eyes", parts_4_front_eyes)

	ent_def.get_hitgroup_name = function(self)
		print("Current texture: "..self.base_texture[1])
		if self.base_texture[1]:find("spider_snowy", 1, true) then
			print("Returning snowy eyes hitgroup")
			return hitgroup_name.."_2_top_eyes"
		elseif self.base_texture[1]:find("spider_orange", 1, true) then
			return hitgroup_name.."_2_top_eyes"
		elseif self.base_texture[1]:find("spider_grey", 1, true) then
			return hitgroup_name.."_2_top_eyes"
		elseif self.base_texture[1]:find("spider_mese", 1, true) then
			return hitgroup_name.."_4_top_eyes"
		elseif self.base_texture[1]:find("spider_crystal", 1, true) then
			return hitgroup_name.."_4_front_eyes"
		else
			return hitgroup_name.."_2_top_eyes"
		end
	end
	advanced_fight_lib.mobs.replace_do_punch(ent_def)

	ent_def._attack_data = {
		hit_range = ent_def.reach,
		hit_box = hitboxes_lib.collisionbox_to_box({-0.25, -0.05, -0.25, 0.25, 0.05, 0.25}),
		hit_area = 0.5*0.1,
		punch_offset = vector.new(0, -0.3, 0),
		target_offset = vector.new(0, 0.25, 0),
		horizontal_inaccuracy = 4,
		vertical_inaccuracy = 5,
	}
end