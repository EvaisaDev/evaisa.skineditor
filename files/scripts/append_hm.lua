local old_spawn_hp = spawn_hp
function spawn_hp(x, y)
	old_spawn_hp(x, y)

	local wardrobe = EntityLoad("mods/evaisa.skineditor/files/entities/wardrobe.xml", x - 95, y + 42)

	EntityAddComponent2(wardrobe, "VariableStorageComponent", {
		name = "spawn_x",
		value_float = x
	})

	EntityAddComponent2(wardrobe, "VariableStorageComponent", {
		name = "spawn_y",
		value_float = y
	})

	EntityAddComponent2(wardrobe, "LuaComponent",
	{
		script_source_file = "mods/evaisa.skineditor/files/scripts/position_offset.lua",
		execute_every_n_frame = 1
	})
end
