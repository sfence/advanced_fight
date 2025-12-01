
advanced_fight = {}

local mod_path = core.get_modpath(core.get_current_modname())

dofile(mod_path.."/functions.lua")

dofile(mod_path.."/player/init.lua")

if core.get_modpath("mobs") then
	dofile(mod_path.."/mobs/init.lua")
end

if core.get_modpath("mobs_monster") then
	dofile(mod_path.."/mobs_monster/init.lua")
end