------ TRANSLATIONS -------

dofile("mods/evaisa.skineditor/lib/translations.lua")

register_localizations("mods/evaisa.skineditor/translations.csv", 2)

---------------------------

--ModMagicNumbersFileAdd("mods/evaisa.skineditor/magic.xml")

function OnWorldPreUpdate()
	if(not ModIsEnabled("evaisa.unshackle"))then
		GamePrint("Unshackle 2.6.2+ is required to run Skin Editor.")
	end
end