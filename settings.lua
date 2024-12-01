---@diagnostic disable: lowercase-global, undefined-global
dofile("data/scripts/lib/mod_settings.lua")



local mod_id = "evaisa.skineditor" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings =
{
	{
		category_id = "skineditor_settings",
		ui_name = "",
		ui_description = "",
		settings = {
			{
				id = "offset_x",
				ui_name = "X Offset",
				ui_description = "The X offset of the wardrobe in the holy mountain.",
				value_default = "-95",
				text_max_length = 6,
				allowed_characters = "0123456789-.",
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "offset_y",
				ui_name = "Y Offset",
				ui_description = "The Y offset of the wardrobe in the holy mountain.",
				value_default = "42",
				text_max_length = 6,
				allowed_characters = "0123456789-.",
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
