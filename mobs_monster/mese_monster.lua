local ent_name, ent_def = advanced_fight_lib.get_entity({"mobs_monster:mese_monster"})

local function mese_monster_wing_on_update(self, obj, hit_data, value)
	local ent = obj:get_luaentity()
	local props = obj:get_properties()
	if ent.jump_height <= props.stepheight then
		value.value = 0.0
		if not ent._advanced_fight_no_fly then
			ent.animation.stand_start = ent.animation.run_start
			ent.animation.stand_end = ent.animation.run_end
			ent.animation.punch_start = ent.animation.run_start
			ent.animation.punch_end = ent.animation.run_end
			ent.animation.shoot_start = ent.animation.run_start
			ent.animation.shoot_end = ent.animation.run_end
			local collisionbox = props.collisionbox
			collisionbox[2] = 0.5
			obj:set_properties({collisionbox = collisionbox})
			ent._advanced_fight_no_fly = true
			print("Mese monster "..obj:get_guid().." can no longer fly")
		end
	end
end

local function mese_monster_inacuracy_on_update(self, obj, hit_data, value)
	local ent = obj:get_luaentity()
	if not ent._advanced_fight_arrow_override then
		advanced_fight_lib.mobs.replace_override_arrow(ent)
		ent._advanced_fight_arrow_override = true
		print("Mese monster "..obj:get_guid().." arrow override applied")
	end
end

local parts = {
	head = {
		box = {x_min = -0.45, y_min = 0.7, z_min = 0.1,
					 x_max = 0.45, y_max = 1.8, z_max = 1},
		part_of_health = 0.8,
		damage_multiplier = 1.25,
		miss_chance = 0.2,
		miss_chance_angles = {
			[0]=0.2,
			[60]=0.2,
			[90]=0.1,
			[135]=0.0,
			[180]=0.0
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
			["mobs:shoot_inaccuracy"] = {
					name = "head",
					threshold_start = 0.1,
					threshold_peak = 0.7,
					base_value = 0,
					peak_value = 10,
					over_value = 20,
					curve = 1,
					value = 1,
					rule = "pre_sum",
					priority = 100,
					cb_on_update = mese_monster_inacuracy_on_update,
				},
		},
		effects = {
			["eye_hit"] = advanced_fight_lib.create_point_hit_effect({
					points = {
						{y=0.7, z=0.5},
						{y=0.7, z=0.5},
					},
					points_size = 2/8,
					points_axis = {"x+", "x-"},
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
					["mobs:shoot_inaccuracy"] = {
								name = "head",
								part_damage_key = "eyes_damage",
								undamage_point_weight = 2,
								edge_point_damage = 2,
								cb_calculate_damage = advanced_fight_lib.point_hit_effect_inaccurate_calculate_damage,
								threshold_start = 0.25,
								threshold_peak = 2,
								base_value = 0,
								peak_value = 40,
								over_value = 60,
								curve = 1,
								value = 1,
								rule = "pre_sum",
								priority = 100,
						},
				},
				texture_hit_point = "advanced_fight_mese_monster_hit_eye_%s.png",
				effects_group_label = "advanced_fight_eye_hit_effects",
				cb_on_update = advanced_fight_lib.mobs.point_hit_effects_group_on_update,
			}),
		},
		effects_group_label = "advanced_fight_head_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	body_p1 = {
		box = {x_min = -0.3, y_min = 0.7, z_min = -0.4,
					 x_max = 0.3, y_max = 1.5, z_max = 0.1},
		part_of_health = 0.25,
		damage_multiplier = 1,
		values = {},
		effects_group_label = "advanced_fight_body_p1_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	body_p2 = {
		box = {x_min = -0.2, y_min = 0.5, z_min = -0.8,
					 x_max = 0.2, y_max = 1.2, z_max = -0.4},
		part_of_health = 0.25,
		damage_multiplier = 1,
		values = {},
		effects_group_label = "advanced_fight_body_p2_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	body_p3 = {
		box = {x_min = -0.2, y_min = 0.2, z_min = -1.0,
					 x_max = 0.2, y_max = 1.0, z_max = -0.8},
		part_of_health = 0.25,
		damage_multiplier = 1,
		values = {},
		effects_group_label = "advanced_fight_body_p3_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	body_p4 = {
		box = {x_min = -0.1, y_min = 0.0, z_min = -1.2,
					 x_max = 0.1, y_max = 0.8, z_max = -1.0},
		part_of_health = 0.25,
		damage_multiplier = 1,
		values = {},
		effects_group_label = "advanced_fight_body_p4_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	wing_left = {
		box = {x_min = -1.5, y_min = 0.9, z_min = -0.4,
					 x_max = -0.3, y_max = 1.7, z_max = 0.4},
		part_of_health = 0.3,
		damage_multiplier = 0.5,
		miss_chance = 0.6,
		miss_chance_angles = {
			[0]=0.6,
			[60]=0.6,
			[90]=0.5,
			[135]=0.4,
			[180]=0.4
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
			["mobs:can_leap_disable"] = {
					name = "wing_left",
					threshold_start = 0.1,
					threshold_peak = 0.25,
					base_value = 0.0,
					peak_value = 0.5,
					over_value = 1.0,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
			},
			["mobs:jump_height"] = {
					name = "wing_left",
					threshold_start = 0.05,
					threshold_peak = 0.5,
					base_value = 1.0,
					peak_value = 0.3,
					over_value = 0.0,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
					cb_on_update = mese_monster_wing_on_update,
			},
		},
		effects_group_label = "advanced_fight_wing_left_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	},
	wing_right = {
		box = {x_min = 0.3, y_min = 0.9, z_min = -0.4,
					 x_max = 1.5, y_max = 1.7, z_max = 0.4},
		part_of_health = 0.3,
		damage_multiplier = 0.5,
		miss_chance = 0.6,
		miss_chance_angles = {
			[0]=0.6,
			[60]=0.6,
			[90]=0.5,
			[135]=0.4,
			[180]=0.4
		},
		cb_get_miss_chance = advanced_fight_lib.calculate_get_miss_chance,
		values = {
			["mobs:can_leap_disable"] = {
					name = "wing_left",
					threshold_start = 0.1,
					threshold_peak = 0.25,
					base_value = 0.0,
					peak_value = 0.5,
					over_value = 1.0,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
			},
			["mobs:jump_height"] = {
					name = "wing_left",
					threshold_start = 0.05,
					threshold_peak = 0.5,
					base_value = 1.0,
					peak_value = 0.3,
					over_value = 0.0,
					curve = 1,
					value = 1,
					rule = "multiply",
					priority = 100,
					--it should be enough to call this callback only for one wing
					--cb_on_update = mese_monster_wing_on_update,
			},
		},
		effects_group_label = "advanced_fight_wing_right_hit_effects",
		on_hit = advanced_fight_lib.entity_on_hit,
	}
}

local parts_fly = {
	head = {
		box = {x_min = -0.45, y_min = 0.5, z_min = 0.1,
					 x_max = 0.45, y_max = 1.6, z_max = 1.1},
	},
	body_p1 = {
		box = {x_min = -0.3, y_min = 0.75, z_min = -0.4,
					 x_max = 0.3, y_max = 1.5, z_max = 0.1},
	},
	body_p2 = {
		box = {x_min = -0.2, y_min = 0.8, z_min = -0.8,
					 x_max = 0.2, y_max = 1.5, z_max = -0.4},
	},
	body_p3 = {
		box = {x_min = -0.2, y_min = 0.9, z_min = -1.2,
					 x_max = 0.2, y_max = 1.4, z_max = -0.8},
	},
	body_p4 = {
		box = {x_min = -0.1, y_min = 1.0, z_min = -1.8,
					 x_max = 0.1, y_max = 1.3, z_max = -1.2},
	},
}

if ent_def then
	local hitgroup_name = "mobs_monster:mese_monster"
	hitboxes_lib.register_hitboxes(hitgroup_name, parts)
	hitboxes_lib.register_hitboxes(hitgroup_name.."_fly",
			hitboxes_lib.update_hitgroup_parts(parts, parts_fly))

	ent_def.get_hitgroup_name = function(self)
		--print("Current animation: "..self.animation.current)
		if self._advanced_fight_no_fly or
				(self.animation.current == "walk"
					or self.animation.current == "run") then
			return hitgroup_name.."_fly"
		end
		return hitgroup_name
	end
	advanced_fight_lib.mobs.replace_do_punch(ent_def)

	ent_def.attack_offsets = {
		punch_offset = vector.new(0, 1.2, 0),
		target_offset = vector.new(0, 0.5, 0),
	}
	ent_def._hit_range = ent_def.reach
end
