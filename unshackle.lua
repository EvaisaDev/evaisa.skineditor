data = {
	cosmetics = {},
}


local parse_version_string = function(version_string)
	local major, minor, patch = version_string:match("(%d+)%.(%d+)%.(%d+)")
	return tonumber(major), tonumber(minor), tonumber(patch)
end

-- check if VERSION_UNSHACKLE is over or equal to 2.6.0
local major, minor, patch = parse_version_string(VERSION_UNSHACKLE)
if major < 2 or (major == 2 and minor < 6) then
	function OnWorldPreUpdate()
		GamePrint("Unshackle version is too old, please update to at least 2.6.0")
	end
else

	smallfolk = dofile("mods/evaisa.skineditor/lib/smallfolk.lua")
	bitser = require("bitser")
	delay = dofile("mods/evaisa.skineditor/files/scripts/utilities/delay.lua")
	popup = dofile("mods/evaisa.skineditor/files/scripts/popup.lua")

	dofile("mods/evaisa.skineditor/files/scripts/gui_utils.lua")
	dofile("mods/evaisa.skineditor/content/data.lua")
	dofile("mods/evaisa.skineditor/files/scripts/gamemode/cosmetics/cosmetics.lua")

	ModLuaFileAppend("data/scripts/biomes/temple_altar.lua", "mods/evaisa.skineditor/files/scripts/append_hm.lua")
	ModLuaFileAppend("data/scripts/biomes/boss_arena.lua", "mods/evaisa.skineditor/files/scripts/append_hm.lua")


	local steam_id = nil
	steam_utils = {}
	steam_utils.getSteamID = function()
		if (steam ~= nil and steam_id == nil) then
			steam_id = steam.user.getSteamID()
		end
		return steam_id
	end

	get_content = ModTextFileGetContent	
	set_content = ModTextFileSetContent

	function IsPaused()
		return GameHasFlagRun("game_paused_arena")
	end

	function OnPausedChanged(paused, is_wand_pickup)
		if (paused) then
			GameAddFlagRun("game_paused_arena")
			--GamePrint("paused")
		else
			GameRemoveFlagRun("game_paused_arena")
			--GamePrint("unpaused")
		end
	end

	function OnMagicNumbersAndWorldSeedInitialized()
		local nxml = dofile_once("mods/evaisa.unshackle/lib/nxml.lua") --- @type nxml

		for entity in nxml.edit_file("data/entities/player_base.xml") do
			for i = #entity.children, 1, -1 do
				if(entity.children[i]:get("image_file") == "data/enemies_gfx/player.xml")then
					entity.children[i]:set("image_file", "mods/evaisa.skineditor/files/gfx/player.xml")
					local _tags = entity.children[i]:get("_tags")
					if(_tags)then
						_tags = _tags .. ",skin_root"
					else
						_tags = "skin_root"
					end
					entity.children[i]:set("_tags", _tags)
				end
			end

			-- add the following
			--[[
			<HotspotComponent
				_tags="hat"
				sprite_hotspot_name="hat"
			/>
			]]
			local element = nxml.parse([[
				<HotspotComponent
					_tags="hat"
					sprite_hotspot_name="hat"
				/>
			]])
			entity:add_child(element)
		end
		skin_system = dofile("mods/evaisa.skineditor/files/scripts/gui/skins.lua").init()
	end


	function OnPlayerSpawned( player_entity )
		data.cosmetics = smallfolk.loads(GlobalsGetValue("player_cosmetics", "{}"))
		if(skin_system)then
			skin_system.load()

			if(not GameHasFlagRun("wardrobe_spawned"))then
				GameAddFlagRun("wardrobe_spawned")
				local x, y = EntityGetTransform(player_entity)
				local floor_hit, floor_x, floor_y = RaytracePlatforms(x, y, x, y + 1000)
				EntityLoad("mods/evaisa.skineditor/files/entities/wardrobe.xml", floor_x, floor_y)
			end

		end
	end

	function OnWorldPreUpdate()
		if(skin_system)then
			skin_system.editor_open = GameHasFlagRun("wardrobe_open") and not GameHasFlagRun("game_paused")
			skin_system.draw()
			cosmetics_handler.Update()
			if(not IsPaused())then
				popup.update()
			end
			delay.update()
		end
	end
end