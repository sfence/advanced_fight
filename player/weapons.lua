

core.register_on_mods_loaded(function()
	for item_name, item_def in pairs(core.registered_items) do
		if core.get_item_group(item_name, "shovel")>0 then
			if not item_def._attack_data then
				core.override_item(item_name, {
					_attack_data = {
						hit_range = item_def.range,
						hit_box = hitboxes_lib.collisionbox_to_box({-0.15, -0.05, -0.15, 0.15, 0.25, 0.15}),
						hit_area = 0.3*0.3,
					},
				})
			end
		end
		if core.get_item_group(item_name, "pickaxe")>0 then
			if not item_def._attack_data then
				core.override_item(item_name, {
					_attack_data = {
						hit_range = item_def.range,
						hit_box = hitboxes_lib.collisionbox_to_box({-0.05, 0.0, -0.05, 0.05, 0.10, 0.05}),
						hit_area = 0.1*0.1,
					},
				})
			end
		end
		if core.get_item_group(item_name, "axe")>0 then
			if not item_def._attack_data then
				core.override_item(item_name, {
					_attack_data = {
						hit_range = item_def.range,
						hit_box = hitboxes_lib.collisionbox_to_box({-0.05, -0.0, -0.05, 0.05, 0.15, 0.05}),
						hit_area = 0.1*0.15,
					},
				})
			end
		end
		if core.get_item_group(item_name, "sword")>0 then
			if not item_def._attack_data then
				core.override_item(item_name, {
					cb_set_hit_attributes = function(self, hit_data)
						hit_data.mode = "box"
						local random = math.random()
						if random < 0.5 then
							if random < 0.25 then
								hit_data.box = hitboxes_lib.collisionbox_to_box(
									{-0.05, -0.25, -0.05, 0.05, 0.25, 0.05})
							else
								hit_data.box = hitboxes_lib.collisionbox_to_box(
									{-0.25, -0.05, -0.05, 0.25, 0.05, 0.05})
							end
							hit_data.hit_area = 0.1*0.5
						else
							hit_data.box = hitboxes_lib.collisionbox_to_box(
								{-0.05, -0.05, -0.05, 0.05, 0.05, 0.05})
							hit_data.hit_area = 0.1*0.1
						end
						hit_data.box_rot = vector.new(0,
								hit_data.puncher:get_look_horizontal(), 0)
					end,
				})
			end
		end
		if item_name:sub(1, 7)=="spears:" then
			if not item_def._attack_data then
				core.override_item(item_name, {
					_attack_data = {
						hit_range = item_def.range,
						sphere_radius = 1/32,
						hit_area = math.pi*(1/32)^2,
					},
				})
			end
		end
	end
end)