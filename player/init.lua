

local dir_path = core.get_modpath(core.get_current_modname()).."/player"

if core.get_modpath("3d_armor") then
	dofile(dir_path.."/3d_armor.lua")
end

dofile(dir_path.."/weapons.lua")

dofile(dir_path.."/player.lua")

core.register_on_punchplayer(advanced_fight_lib.player.on_punch)

core.register_on_joinplayer(advanced_fight_lib.player.on_join)

players_effects.register_on_heal_callback(advanced_fight_lib.player.on_heal)