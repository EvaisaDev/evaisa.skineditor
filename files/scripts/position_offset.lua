local entity = GetUpdatedEntityID()
local spawn_x = 0
local spawn_y = 0
local variable_storage_comps = EntityGetComponent(entity, "VariableStorageComponent")
if variable_storage_comps ~= nil then
	for i, comp in ipairs(variable_storage_comps) do
		local name = ComponentGetValue2(comp, "name")
		if name == "spawn_x" then
			spawn_x = ComponentGetValue2(comp, "value_float")
		elseif name == "spawn_y" then
			spawn_y = ComponentGetValue2(comp, "value_float")
		end
	end
end

local offset_x = tonumber(ModSettingGet("evaisa.skineditor.offset_x")) or 95
local offset_y = tonumber(ModSettingGet("evaisa.skineditor.offset_y")) or 42

--print("offset_x: " .. tostring(offset_x))
--print("offset_y: " .. tostring(offset_y))
EntityApplyTransform(entity, spawn_x + offset_x, spawn_y + offset_y)