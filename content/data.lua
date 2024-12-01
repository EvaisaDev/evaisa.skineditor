-- Keep this in sync with Noita Arena i guess.

cosmetics = {
    {
        id = "gold_dust",
        name = "$arena_cosmetics_gold_dust_name",
        description = "$arena_cosmetics_gold_dust_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/gold_dust.png",
        credits = "Evaisa",
        type = "particles",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 3000,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/particles/gold_dust.xml")
            EntityAddChild(entity, ent)

        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "gold_dust")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "blue_fire",
        name = "$arena_cosmetics_blue_fire_name",
        description = "$arena_cosmetics_blue_fire_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/blue_fire.png",
        credits = "Evaisa",
        type = "particles",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/particles/blue_fire.xml")
            EntityAddChild(entity, ent)

        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "fire_head")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "trans_glitter",
        name = "$arena_cosmetics_trans_glitter_name",
        description = "$arena_cosmetics_trans_glitter_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/trans_glitter.png",
        credits = "Evaisa",
        type = "particles",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            --[[local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561198032563991"]]
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/particles/trans_glitter.xml")
            EntityAddChild(entity, ent)

        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "trans_glitter")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "haunted",
        name = "$arena_cosmetics_haunted_name",
        description = "$arena_cosmetics_haunted_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/haunted.png",
        credits = "Evaisa",
        type = "particles",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 3000,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            --[[local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561198032563991"]]
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/particles/haunted.xml")
            EntityAddChild(entity, ent)

        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "haunted")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "shrek_mask",
        name = "$arena_cosmetics_ogre_mask_name",
        description = "$arena_cosmetics_ogre_mask_description ",
        icon = "mods/evaisa.skineditor/content/cosmetics/sprites/shrek/icon.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "mask",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = true,
        sprite_offset = {x = 1, y = 1},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/shrek/shrek_mask.png",
        sprite_z = 0.41,
        price = 10,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561197991801655"
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "tanksy_hat",
        name = "$arena_cosmetics_tanksy_hat_name",
        description = "$arena_cosmetics_tanksy_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/overlay/tanksy/icon.png",
        credits = "Evaisa",
        sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/overlay/tanksy/player_hat.xml",
        type = "hat",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        price = 0,
        try_unlock = function(self, lobby, data) -- runs every frame, if true, unlock flag is added
            local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561197995188444"
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "propeller_hat",
        name = "$arena_cosmetics_propeller_hat_name",
        description = "$arena_cosmetics_propeller_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/sprites/propeller/icon.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "hat",
        sprite_offset = {x = 3, y = 7},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/propeller/hat.xml",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 150,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "alias_mask",
        name = "$arena_cosmetics_alias_mask_name",
        description = "$arena_cosmetics_alias_mask_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/alias.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "mask",
        sprite_offset = {x = 10, y = 0},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/alias/sus.xml",
        sprite_scale = {x = 0.1, y = 0.1},
        sprite_only_inherit_position = true,
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        price = 0,
		try_unlock = function(self, lobby, data) -- runs every frame, if true, unlock flag is added
            local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561198014921778"
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
            -- get entity with id
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == self.id)then
                    -- update scale
                    local x, y, r, s, s2 = EntityGetTransform(entity)
                    local mask_x, mask_y, mask_r = EntityGetTransform(child)

                    EntitySetTransform(child, mask_x, mask_y, mask_r, s * self.sprite_scale.x, s2 * self.sprite_scale.y)

                end
            end
        end,
    },
    {
        id = "dunk_mask",
        name = "$arena_cosmetics_dunk_mask_name",
        description = "$arena_cosmetics_dunk_mask_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/dunk.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "mask",
        sprite_offset = {x = 2, y = 0},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/dunk.png",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        price = 0,
		try_unlock = function(self, lobby, data) -- runs every frame, if true, unlock flag is added
            local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561198048131368"
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
    },
    {
        id = "fury_hat",
        name = "$arena_cosmetics_fury_hat_name",
        description = "$arena_cosmetics_fury_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/fury.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "hat",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        price = 0,
		try_unlock = function(self, lobby, data) -- runs every frame, if true, unlock flag is added
            local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561198014887968"
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/fury_hat.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "fury_hat")then
                    EntityKill(child)
                end
            end
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn

        end,
    },
    {
        id = "fish_hat",
        name = "$arena_cosmetics_fish_hat_name",
        description = "$arena_cosmetics_fish_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/sprites/fish/icon.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "hat",
        sprite_offset = {x = 4, y = 9},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/fish/hat2.xml",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_kill_func = true, -- Run kill func even when not worn
        always_run_win_func = false, -- Run Win func even when not worn
        price = 0,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
            --[[self.rotation = self.rotation or 0
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == self.id)then
                    print("found fish")
                    -- simulate rotating the fish by changing the width of the sprite
                    self.rotation = self.rotation + 0.05
                    local width = math.sin(self.rotation)
                    local x, y, r = EntityGetTransform(entity)
                    EntitySetTransform(child, x, y, r, width, 1)
                    
                end
            end]]
        end,
        on_kill = function(self, entity, killed_entity) -- runs when player kills another player
            local unlock_flag = "cosmetic_unlocked_"..self.id
            if(not HasFlagPersistent(unlock_flag))then
                local children = EntityGetAllChildren(entity)
                for k, v in ipairs(children or {}) do
                    -- if has GameEffectComponent
                    local game_effect_comp = EntityGetFirstComponentIncludingDisabled(v, "GameEffectComponent")
                    if(game_effect_comp ~= nil)then
                        -- check if has wet effect
                        local effect = ComponentGetValue2(game_effect_comp, "effect")
                        if(effect == "WET")then
                            -- check if has killed 15 players
                            local kills = tonumber(ModSettingGet("ARENA_COSMETIC_JOEL_COUNTER")) or 0
                        
                            kills = kills + 1
                            if(kills >= 15)then
                                AddFlagPersistent(unlock_flag)
                                ModSettingRemove("ARENA_COSMETIC_JOEL_COUNTER")

                                GamePrintImportant("$arena_cosmetic_unlock", string.format(GameTextGetTranslatedOrNot("$arena_cosmetic_hidden_unlock"), GameTextGetTranslatedOrNot(self.name)))
                            end

                            ModSettingSet("ARENA_COSMETIC_JOEL_COUNTER", kills)
                        end

                    end
                end
            end

        end,
        on_win = function(self, entity, wins, winstreak) -- runs when player wins a round
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.

        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
            
        end,
    },
    {
        id = "dexter_joel",
        name = "$arena_cosmetics_dexter_joel_name",
        description = "$arena_cosmetics_dexter_joel_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/sprites/fish/iconx2.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "hat",
        sprite_offset = {x = 0, y = 9},
        --sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/fish/hat2.xml",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_kill_func = true, -- Run kill func even when not worn
        always_run_win_func = false, -- Run Win func even when not worn
        price = 0,
		try_unlock = function(self, lobby, data) -- runs every frame, if true, unlock flag is added
            local steam_id = steam_utils.getSteamID()
            
            local id = tostring(steam_id)

            return id == "76561198078340341"
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local cosmetic = self

            local offset_x, offset_y = 0, 0
            if(cosmetic.sprite_offset)then
                offset_x = cosmetic.sprite_offset.x or 0
                offset_y = cosmetic.sprite_offset.y or 0
            end

            -- joel 1
            local hat_entity = EntityCreateNew(cosmetic.id)
            local hotspot = "hat"
            if(cosmetic.hotspot)then
                hotspot = cosmetic.hotspot
            end
            EntityAddChild(entity, hat_entity)
            EntityAddComponent2(hat_entity, "SpriteComponent", {
                _tags="character",
                alpha=1, 
                image_file="mods/evaisa.skineditor/content/cosmetics/sprites/fish/hat2.xml", 
                next_rect_animation=cosmetic.sprite_animation or "", 
                offset_x=offset_x, 
                offset_y=offset_y, 
                rect_animation=cosmetic.sprite_animation or "",
                z_index=0.4,
            })
            EntityAddComponent2(hat_entity, "SpriteAnimatorComponent")
            --[[EntityAddComponent2(hat_entity, "InheritTransformComponent", {
                parent_hotspot_tag=hotspot,
                only_position=true
            })]]

            -- joel 2
            local hat_entity2 = EntityCreateNew(cosmetic.id)
            local hotspot2 = "hat"
            if(cosmetic.hotspot)then
                hotspot2 = cosmetic.hotspot
            end
            EntityAddChild(entity, hat_entity2)
            EntityAddComponent2(hat_entity2, "SpriteComponent", {
                _tags="character",
                alpha=1, 
                image_file="mods/evaisa.skineditor/content/cosmetics/sprites/fish/hat2.xml", 
                next_rect_animation=cosmetic.sprite_animation or "", 
                offset_x=offset_x+9, 
                offset_y=offset_y, 
                rect_animation=cosmetic.sprite_animation or "",
                z_index=0.4,
            })
            EntityAddComponent2(hat_entity2, "SpriteAnimatorComponent")
            --[[EntityAddComponent2(hat_entity2, "InheritTransformComponent", {
                parent_hotspot_tag=hotspot2,
                only_position=true
            })]]

            -- invert scale w on second joel
            local x, y, r = EntityGetTransform(hat_entity2)
            EntitySetTransform(hat_entity2, x, y, r, -1, 1)
    
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == self.id)then
                    EntityKill(child)
                end
            end
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
            local joels = {}
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == self.id)then
                    table.insert(joels, child)
                end
            end

            local x, y = EntityGetHotspot(entity, "hat", true, true)
            for k, v in ipairs(joels) do
                local offset = 0
                if(k == 2)then
                    offset = 9
                end
                EntitySetTransform(v, x + offset - 9, y, 0)
            end
        end,
    },
    {
        id = "fish_hat_red",
        name = "$arena_cosmetics_fish_hat_2_name",
        description = "$arena_cosmetics_fish_hat_2_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/sprites/fish2/icon.png",
        credits = "Evaisa",
        --sprite_sheet_overlay = "mods/evaisa.skineditor/content/cosmetics/sprites/dunce_hat/sprite_sheet_overlay.png",
        type = "hat",
        sprite_offset = {x = 4, y = 9},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/fish2/fish_02.xml",
        sprite_animation = "walk",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_kill_func = true, -- Run kill func even when not worn
        always_run_win_func = false, -- Run Win func even when not worn
        price = 0,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
            --[[self.rotation = self.rotation or 0
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == self.id)then
                    print("found fish")
                    -- simulate rotating the fish by changing the width of the sprite
                    self.rotation = self.rotation + 0.05
                    local width = math.sin(self.rotation)
                    local x, y, r = EntityGetTransform(entity)
                    EntitySetTransform(child, x, y, r, width, 1)
                    
                end
            end]]
        end,
        on_kill = function(self, entity, killed_entity) -- runs when player kills another player
            local unlock_flag = "cosmetic_unlocked_"..self.id
            if(not HasFlagPersistent(unlock_flag))then
                local children = EntityGetAllChildren(entity)
                for k, v in ipairs(children or {}) do
                    -- if has GameEffectComponent
                    local game_effect_comp = EntityGetFirstComponentIncludingDisabled(v, "GameEffectComponent")
                    if(game_effect_comp ~= nil)then
                        -- check if has wet effect
                        local effect = ComponentGetValue2(game_effect_comp, "effect")
                        if(effect == "WET")then
                            -- check if has killed 15 players
                            local kills = tonumber(ModSettingGet("ARENA_COSMETIC_JOEL_COUNTER2")) or 0
                        
                            kills = kills + 1
                            if(kills >= 30)then
                                AddFlagPersistent(unlock_flag)
                                ModSettingRemove("ARENA_COSMETIC_JOEL_COUNTER2")

                                GamePrintImportant("$arena_cosmetic_unlock", string.format(GameTextGetTranslatedOrNot("$arena_cosmetic_hidden_unlock"), GameTextGetTranslatedOrNot(self.name)))
                            end

                            ModSettingSet("ARENA_COSMETIC_JOEL_COUNTER2", kills)
                        end

                    end
                end
            end

        end,
        on_win = function(self, entity, wins, winstreak) -- runs when player wins a round
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.

        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
            
        end,
    },
    -- bithday
    {
        id = "birthday_hat",
        name = "$arena_cosmetics_birthday_hat_name",
        description = "$arena_cosmetics_birthday_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/birthday.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 5},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/birthday.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 150,
    },
    -- bowler
    {
        id = "bowler_hat",
        name = "$arena_cosmetics_bowler_hat_name",
        description = "$arena_cosmetics_bowler_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/bowler.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/bowler.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- bowler_brown
    {
        id = "bowler_hat_brown",
        name = "$arena_cosmetics_bowler_hat_brown_name",
        description = "$arena_cosmetics_bowler_hat_brown_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/bowler_brown.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/bowler_brown.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- bowler_green
    {
        id = "bowler_hat_green",
        name = "$arena_cosmetics_bowler_hat_green_name",
        description = "$arena_cosmetics_bowler_hat_green_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/bowler_green.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/bowler_green.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- bowler_pink
    {
        id = "bowler_hat_pink",
        name = "$arena_cosmetics_bowler_hat_pink_name",
        description = "$arena_cosmetics_bowler_hat_pink_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/bowler_pink.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/bowler_pink.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- bowler_red
    {
        id = "bowler_hat_red",
        name = "$arena_cosmetics_bowler_hat_red_name",
        description = "$arena_cosmetics_bowler_hat_red_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/bowler_red.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/bowler_red.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- construction
    {
        id = "construction_hat",
        name = "$arena_cosmetics_construction_hat_name",
        description = "$arena_cosmetics_construction_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/construction.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/construction.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 150,
    },
    -- construction_blue
    {
        id = "construction_hat_blue",
        name = "$arena_cosmetics_construction_hat_blue_name",
        description = "$arena_cosmetics_construction_hat_blue_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/construction_blue.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/construction_blue.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 150,
    },
    -- construction_white
    {
        id = "construction_hat_white",
        name = "$arena_cosmetics_construction_hat_white_name",
        description = "$arena_cosmetics_construction_hat_white_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/construction_white.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/construction_white.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 150,
    },
    -- crown
    {
        id = "crown_hat",
        name = "$arena_cosmetics_crown_hat_name",
        description = "$arena_cosmetics_crown_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/crown.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/crown.png",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_win_func = true,
        price = 0,
        on_win = function(self, entity, wins, winstreak) -- runs when player wins a round
            local unlock_flag = "cosmetic_unlocked_"..self.id
            if(not HasFlagPersistent(unlock_flag))then
                local wins = tonumber(ModSettingGet("ARENA_COSMETIC_CROWN_COUNTER")) or 0
                wins = wins + 1
                if(wins >= 10)then
                    AddFlagPersistent(unlock_flag)
                    GamePrintImportant("$arena_cosmetic_unlock", string.format(GameTextGetTranslatedOrNot("$arena_cosmetic_hidden_unlock"), GameTextGetTranslatedOrNot(self.name)))
                end

                ModSettingSet("ARENA_COSMETIC_CROWN_COUNTER", wins)
            end
        end,
    },
    -- crown tier 2
    {
        id = "crown_hat_2",
        name = "$arena_cosmetics_crown_hat_2_name",
        description = "$arena_cosmetics_crown_hat_2_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/crown_tier2.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/crown_tier2.png",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_win_func = true,
        price = 0,
        on_win = function(self, entity, wins, winstreak) -- runs when player wins a round
            local unlock_flag = "cosmetic_unlocked_"..self.id
            if(not HasFlagPersistent(unlock_flag))then
                print("win")
                local wins = tonumber(ModSettingGet("ARENA_COSMETIC_CROWN_COUNTER")) or 0
                wins = wins + 1
                if(wins >= 20)then
                    AddFlagPersistent(unlock_flag)
                    GamePrintImportant("$arena_cosmetic_unlock", string.format(GameTextGetTranslatedOrNot("$arena_cosmetic_hidden_unlock"), GameTextGetTranslatedOrNot(self.name)))
                end

                ModSettingSet("ARENA_COSMETIC_CROWN_COUNTER", wins)
            end
        end,
    },
    -- crown tier 3
    {
        id = "crown_hat_3",
        name = "$arena_cosmetics_crown_hat_3_name",
        description = "$arena_cosmetics_crown_hat_3_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/crown_tier3.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 3, y = 5},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/crown_tier3.png",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_win_func = true,
        price = 0,
        on_win = function(self, entity, wins, winstreak) -- runs when player wins a round
            local unlock_flag = "cosmetic_unlocked_"..self.id
            if(not HasFlagPersistent(unlock_flag))then
                local wins = tonumber(ModSettingGet("ARENA_COSMETIC_CROWN_COUNTER")) or 0
                wins = wins + 1
                if(wins >= 30)then
                    AddFlagPersistent(unlock_flag)
                    GamePrintImportant("$arena_cosmetic_unlock", string.format(GameTextGetTranslatedOrNot("$arena_cosmetic_hidden_unlock"), GameTextGetTranslatedOrNot(self.name)))
                end

                ModSettingSet("ARENA_COSMETIC_CROWN_COUNTER", wins)
            end
        end,
    },
    -- crown tier 4
    {
        id = "crown_hat_4",
        name = "$arena_cosmetics_crown_hat_4_name",
        description = "$arena_cosmetics_crown_hat_4_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/crown_tier4.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 3, y = 6},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/crown_tier4.png",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_win_func = true,
        price = 0,
        on_win = function(self, entity, wins, winstreak) -- runs when player wins a round
            local unlock_flag = "cosmetic_unlocked_"..self.id
            if(not HasFlagPersistent(unlock_flag))then
                local wins = tonumber(ModSettingGet("ARENA_COSMETIC_CROWN_COUNTER")) or 0
                wins = wins + 1
                if(wins >= 40)then
                    AddFlagPersistent(unlock_flag)
                    GamePrintImportant("$arena_cosmetic_unlock", string.format(GameTextGetTranslatedOrNot("$arena_cosmetic_hidden_unlock"), GameTextGetTranslatedOrNot(self.name)))
                end

                ModSettingSet("ARENA_COSMETIC_CROWN_COUNTER", wins)
            end
        end,
    },
    -- detective
    {
        id = "detective_hat",
        name = "$arena_cosmetics_detective_hat_name",
        description = "$arena_cosmetics_detective_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/detective.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 3, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/detective.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- detective_black
    {
        id = "detective_hat_black",
        name = "$arena_cosmetics_detective_hat_black_name",
        description = "$arena_cosmetics_detective_hat_black_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/detective_black.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 3, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/detective_black.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- detective_green
    {
        id = "detective_hat_green",
        name = "$arena_cosmetics_detective_hat_green_name",
        description = "$arena_cosmetics_detective_hat_green_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/detective_green.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 3, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/detective_green.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 300,
    },
    -- ears
    {
        id = "ears_hat",
        name = "$arena_cosmetics_ears_hat_name",
        description = "$arena_cosmetics_ears_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/ears.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 1, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/ears.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 200,
    },
    -- ears_black
    {
        id = "ears_hat_black",
        name = "$arena_cosmetics_ears_hat_black_name",
        description = "$arena_cosmetics_ears_hat_black_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/ears_black.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 1, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/ears_black.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 200,
    },
    -- ears_blue
    {
        id = "ears_hat_blue",
        name = "$arena_cosmetics_ears_hat_blue_name",
        description = "$arena_cosmetics_ears_hat_blue_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/ears_blue.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 1, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/ears_blue.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 200,
    },
    -- ears_brown
    {
        id = "ears_hat_brown",
        name = "$arena_cosmetics_ears_hat_brown_name",
        description = "$arena_cosmetics_ears_hat_brown_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/ears_brown.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 1, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/ears_brown.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 200,
    },
    -- ears_pink
    {
        id = "ears_hat_pink",
        name = "$arena_cosmetics_ears_hat_pink_name",
        description = "$arena_cosmetics_ears_hat_pink_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/ears_pink.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 1, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/ears_pink.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 200,
    },
    -- elk_boss
    {
        id = "elk_boss_hat",
        name = "$arena_cosmetics_elk_boss_hat_name",
        description = "$arena_cosmetics_elk_boss_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/elk_boss.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 5, y = 8},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/elk_boss.png",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        always_run_win_func = true,
        price = 0,
        on_win = function(self, entity, wins, winstreak) -- runs when player wins a round
            -- unlocks on a 5 winstreak
            if(winstreak >= 5)then
                local unlock_flag = "cosmetic_unlocked_"..self.id
                if(not HasFlagPersistent(unlock_flag))then
                    AddFlagPersistent(unlock_flag)
                    GamePrintImportant("$arena_cosmetic_unlock", string.format(GameTextGetTranslatedOrNot("$arena_cosmetic_hidden_unlock"), GameTextGetTranslatedOrNot(self.name)))
                end
            end
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/particles/elk_boss.xml")
            EntityAddChild(entity, ent)

        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "deer_sparkles")then
                    EntityKill(child)
                end
            end
        end,
    },
    -- elk
    {
        id = "elk_hat",
        name = "$arena_cosmetics_elk_hat_name",
        description = "$arena_cosmetics_elk_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/elk.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 5, y = 8},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/elk.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 400,
    },
    -- flatcap
    {
        id = "flatcap_hat",
        name = "$arena_cosmetics_flatcap_hat_name",
        description = "$arena_cosmetics_flatcap_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/flatcap.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/flatcap.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 250,
    },
    -- flatcap_black
    {
        id = "flatcap_hat_black",
        name = "$arena_cosmetics_flatcap_hat_black_name",
        description = "$arena_cosmetics_flatcap_hat_black_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/flatcap_black.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/flatcap_black.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 250,
    },
    -- flatcap_blue
    {
        id = "flatcap_hat_blue",
        name = "$arena_cosmetics_flatcap_hat_blue_name",
        description = "$arena_cosmetics_flatcap_hat_blue_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/flatcap_blue.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/flatcap_blue.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 250,
    },
    -- flatcap_grey
    {
        id = "flatcap_hat_grey",
        name = "$arena_cosmetics_flatcap_hat_grey_name",
        description = "$arena_cosmetics_flatcap_hat_grey_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/flatcap_grey.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/flatcap_grey.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 250,
    },
    -- grenade
    {
        id = "grenade_hat",
        name = "$arena_cosmetics_grenade_hat_name",
        description = "$arena_cosmetics_grenade_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/grenade.png",
        credits = "Evaisa",
        type = "mask",
        sprite_offset = {x = 1, y = 1},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/grenade.png",
        sprite_z = 0.41,
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 400,
    },
    -- healer
    {
        id = "healer_hat",
        name = "$arena_cosmetics_healer_hat_name",
        description = "$arena_cosmetics_healer_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/healer.png",
        credits = "Evaisa",
        type = "mask",
        sprite_offset = {x = 1, y = 1},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/healer.png",
        sprite_z = 0.41,
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
    },
    -- leprechaun
    {
        id = "leprechaun_hat",
        name = "$arena_cosmetics_leprechaun_hat_name",
        description = "$arena_cosmetics_leprechaun_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/leprechaun.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 9},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/leprechaun.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
    },
    -- plumber
    {
        id = "plumber_hat",
        name = "$arena_cosmetics_plumber_hat_name",
        description = "$arena_cosmetics_plumber_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/plumber.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/plumber.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 400,
    },
    -- plumber_green
    {
        id = "plumber_hat_green",
        name = "$arena_cosmetics_plumber_hat_green_name",
        description = "$arena_cosmetics_plumber_hat_green_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/plumber_green.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/plumber_green.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 400,
    },
    -- plumber_purple
    {
        id = "plumber_hat_purple",
        name = "$arena_cosmetics_plumber_hat_purple_name",
        description = "$arena_cosmetics_plumber_hat_purple_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/plumber_purple.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/plumber_purple.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 400,
    },
    -- plumber_yellow
    {
        id = "plumber_hat_yellow",
        name = "$arena_cosmetics_plumber_hat_yellow_name",
        description = "$arena_cosmetics_plumber_hat_yellow_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/plumber_yellow.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/plumber_yellow.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 400,
    },
    -- pylon
    {
        id = "pylon_hat",
        name = "$arena_cosmetics_pylon_hat_name",
        description = "$arena_cosmetics_pylon_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/pylon.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 5},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/pylon.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 600,
    },
    -- sheriff
    {
        id = "sheriff_hat",
        name = "$arena_cosmetics_sheriff_hat_name",
        description = "$arena_cosmetics_sheriff_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/sheriff.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 4, y = 7},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/sheriff.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 600,
    },
    -- sheriff_black
    {
        id = "sheriff_hat_black",
        name = "$arena_cosmetics_sheriff_hat_black_name",
        description = "$arena_cosmetics_sheriff_hat_black_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/sheriff_black.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 4, y = 7},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/sheriff_black.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 600,
    },
    -- sombrero
    {
        id = "sombrero_hat",
        name = "$arena_cosmetics_sombrero_hat_name",
        description = "$arena_cosmetics_sombrero_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/sombrero.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 4, y = 5 },
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/sombrero.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 600,
    },
    -- sombrero_alt
    {
        id = "sombrero_hat_alt",
        name = "$arena_cosmetics_sombrero_hat_alt_name",
        description = "$arena_cosmetics_sombrero_hat_alt_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/sombrero_alt.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 4, y = 5 },
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/sombrero_alt.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 600,
    },
    -- straw hat
    {
        id = "straw_hat",
        name = "$arena_cosmetics_straw_hat_name",
        description = "$arena_cosmetics_straw_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/strawhat.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 2},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/strawhat.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 150,
    },
    -- tiara
    {
        id = "tiara_hat",
        name = "$arena_cosmetics_tiara_hat_name",
        description = "$arena_cosmetics_tiara_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/tiara.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 3},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/tiara.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 1500,
    },
    -- toimari
    {
        id = "toimari_hat",
        name = "$arena_cosmetics_toimari_hat_name",
        description = "$arena_cosmetics_toimari_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/toimari.png",
        credits = "Evaisa",
        type = "mask",
        sprite_offset = {x = 6, y = 4},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/toimari.png",
        sprite_z = 0.41,
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2500,
    },
    -- tophat
    {
        id = "tophat",
        name = "$arena_cosmetics_tophat_name",
        description = "$arena_cosmetics_tophat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/tophat.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 4},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/tophat.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2000,
    },
    -- tophat_blue_band
    {
        id = "tophat_blue_band",
        name = "$arena_cosmetics_tophat_blue_band_name",
        description = "$arena_cosmetics_tophat_blue_band_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/tophat_blue_band.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 4},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/tophat_blue_band.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2000,
    },
    -- tophat_green_band
    {
        id = "tophat_green_band",
        name = "$arena_cosmetics_tophat_green_band_name",
        description = "$arena_cosmetics_tophat_green_band_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/tophat_green_band.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 4},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/tophat_green_band.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2000,
    },
    -- tophat_purple_band
    {
        id = "tophat_purple_band",
        name = "$arena_cosmetics_tophat_purple_band_name",
        description = "$arena_cosmetics_tophat_purple_band_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/tophat_purple_band.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 4},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/tophat_purple_band.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2000,
    },
    -- tophat_brown
    {
        id = "tophat_brown",
        name = "$arena_cosmetics_tophat_brown_name",
        description = "$arena_cosmetics_tophat_brown_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/tophat_brown.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 4},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/tophat_brown.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2000,
    },
    -- tophat_purple
    {
        id = "tophat_purple",
        name = "$arena_cosmetics_tophat_purple_name",
        description = "$arena_cosmetics_tophat_purple_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/tophat_purple.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 2, y = 4},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/tophat_purple.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 2000,
    },
    -- welder
    {
        id = "welder_hat",
        name = "$arena_cosmetics_welder_hat_name",
        description = "$arena_cosmetics_welder_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/welder.png",
        credits = "Evaisa",
        type = "mask",
        sprite_offset = {x = 1, y = 0},
        sprite_z = 0.41,
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/welder.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
    },
    -- wizard
    {
        id = "wizard_hat",
        name = "$arena_cosmetics_wizard_hat_name",
        description = "$arena_cosmetics_wizard_hat_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wizard.png",
        credits = "Evaisa",
        type = "hat",
        sprite_offset = {x = 3, y = 5},
        sprite = "mods/evaisa.skineditor/content/cosmetics/sprites/wizard.png",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 1000,
    },
    -- amulet
    {
        id = "amulet",
        name = "$arena_cosmetics_amulet_name",
        description = "$arena_cosmetics_amulet_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/amulet.png",
        credits = "Evaisa",
        sprite_sheet_overlay = "data/enemies_gfx/player_amulet.xml",
        overlay_z = 0.59,
        type = "amulet",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        price = 0,
        try_unlock = function() -- runs every frame, if true, unlock flag is added
            return HasFlagPersistent( "secret_amulet" )
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "amulet_gem",
        name = "$arena_cosmetics_amulet_gem_name",
        description = "$arena_cosmetics_amulet_gem_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/amulet_gem.png",
        credits = "Evaisa",
        sprite_sheet_overlay = "data/enemies_gfx/player_amulet_gem.xml",
        overlay_z = 0.58,
        type = "amulet",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        price = 0,
        try_unlock = function() -- runs every frame, if true, unlock flag is added
            return HasFlagPersistent( "secret_amulet_gem" )
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    {
        id = "crown_secret",
        name = "$arena_cosmetics_crown_secret_name",
        description = "$arena_cosmetics_crown_secret_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/crown_secret.png",
        credits = "Evaisa",
        sprite_sheet_overlay = "data/enemies_gfx/player_hat2.xml",
        overlay_z = 0.58,
        type = "hat",
        can_be_unlocked = true,
        can_be_purchased = false,
        unlocked_default = false,
        price = 0,
        try_unlock = function() -- runs every frame, if true, unlock flag is added
            return HasFlagPersistent( "secret_hat" )
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked
            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- cat_tail_black
    {
        id = "cat_tail_black",
        name = "$arena_cosmetics_cat_tail_black_name",
        description = "$arena_cosmetics_cat_tail_black_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/cat_tail_black.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/cat_tail/tail_black.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- cat_tail_black_white_tip
    {
        id = "cat_tail_black_white_tip",
        name = "$arena_cosmetics_cat_tail_black_white_tip_name",
        description = "$arena_cosmetics_cat_tail_black_white_tip_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/cat_tail_black_white_tip.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/cat_tail/tail_black_white_tip.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- cat_tail_blue
    {
        id = "cat_tail_blue",
        name = "$arena_cosmetics_cat_tail_blue_name",
        description = "$arena_cosmetics_cat_tail_blue_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/cat_tail_blue.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/cat_tail/tail_blue.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- cat_tail_green
    {
        id = "cat_tail_green",
        name = "$arena_cosmetics_cat_tail_green_name",
        description = "$arena_cosmetics_cat_tail_green_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/cat_tail_green.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/cat_tail/tail_green.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- cat_tail_red
    {
        id = "cat_tail_red",
        name = "$arena_cosmetics_cat_tail_red_name",
        description = "$arena_cosmetics_cat_tail_red_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/cat_tail_red.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/cat_tail/tail_red.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- cat_tail_pink
    {
        id = "cat_tail_pink",
        name = "$arena_cosmetics_cat_tail_pink_name",
        description = "$arena_cosmetics_cat_tail_pink_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/cat_tail_pink.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/cat_tail/tail_pink.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- cat_tail_white
    {
        id = "cat_tail_white",
        name = "$arena_cosmetics_cat_tail_white_name",
        description = "$arena_cosmetics_cat_tail_white_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/cat_tail_white.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/cat_tail/tail_white.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- wolf_tail_black_white_tip
    {
        id = "wolf_tail_black_white_tip",
        name = "$arena_cosmetics_wolf_tail_black_white_tip_name",
        description = "$arena_cosmetics_wolf_tail_black_white_tip_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wolf_tail_black_white_tip.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/wolf_tail/black_white_tip.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- wolf_tail_blue
    {
        id = "wolf_tail_blue",
        name = "$arena_cosmetics_wolf_tail_blue_name",
        description = "$arena_cosmetics_wolf_tail_blue_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wolf_tail_blue.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/wolf_tail/blue.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- wolf_tail_pink
    {
        id = "wolf_tail_pink",
        name = "$arena_cosmetics_wolf_tail_pink_name",
        description = "$arena_cosmetics_wolf_tail_pink_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wolf_tail_pink.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/wolf_tail/pink.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- wolf_tail_orange
    {
        id = "wolf_tail_orange",
        name = "$arena_cosmetics_wolf_tail_orange_name",
        description = "$arena_cosmetics_wolf_tail_orange_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wolf_tail_orange.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/wolf_tail/orange.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- wolf_tail_white
    {
        id = "wolf_tail_white",
        name = "$arena_cosmetics_wolf_tail_white_name",
        description = "$arena_cosmetics_wolf_tail_white_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wolf_tail_white.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/wolf_tail/white.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- wolf_tail_regular
    {
        id = "wolf_tail_regular",
        name = "$arena_cosmetics_wolf_tail_regular_name",
        description = "$arena_cosmetics_wolf_tail_regular_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wolf_tail_regular.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/wolf_tail/regular.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- wolf_tail_rainbow
    {
        id = "wolf_tail_rainbow",
        name = "$arena_cosmetics_wolf_tail_rainbow_name",
        description = "$arena_cosmetics_wolf_tail_rainbow_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/wolf_tail_rainbow.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/wolf_tail/rainbow.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- fox_tail
    {
        id = "fox_tail",
        name = "$arena_cosmetics_fox_tail_name",
        description = "$arena_cosmetics_fox_tail_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/fox_tail.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/misc_tail/fox.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- fox_tail_white
    {
        id = "fox_tail_white",
        name = "$arena_cosmetics_fox_tail_white_name",
        description = "$arena_cosmetics_fox_tail_white_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/fox_tail_white.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/misc_tail/fox_white.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- fox_tail_silver
    {
        id = "fox_tail_silver",
        name = "$arena_cosmetics_fox_tail_silver_name",
        description = "$arena_cosmetics_fox_tail_silver_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/fox_tail_silver.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/misc_tail/fox_silver.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- fox_tail_spotted
    {
        id = "fox_tail_spotted",
        name = "$arena_cosmetics_fox_tail_spotted_name",
        description = "$arena_cosmetics_fox_tail_spotted_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/fox_tail_spotted.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/misc_tail/fox_spotted.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- raccoon tail
    {
        id = "raccoon_tail",
        name = "$arena_cosmetics_raccoon_tail_name",
        description = "$arena_cosmetics_raccoon_tail_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/raccoon_tail.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/misc_tail/raccoon.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
    -- lizard_tail
    {
        id = "lizard_tail",
        name = "$arena_cosmetics_lizard_tail_name",
        description = "$arena_cosmetics_lizard_tail_description",
        icon = "mods/evaisa.skineditor/content/cosmetics/icons/lizard_tail.png",
        credits = "Evaisa",
        type = "tail",
        can_be_unlocked = true,
        can_be_purchased = true,
        unlocked_default = false,
        price = 500,
        try_unlock = function(self) -- runs every frame, if true, unlock flag is added
            return false
        end,
        try_force_enable = function(self) -- if this condition is true, the cosmetic will be enabled even if it's not unlocked

            return false
        end,
        on_update = function(self, entity) -- runs every frame while hat is worn
            -- get tail cosmetic
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    local x, y, r, sx, sy = EntityGetTransform(entity)
                    local tail_x, tail_y, tail_r, tail_sx, tail_sy = EntityGetTransform(child)
                    EntitySetTransform(child, tail_x, tail_y, tail_r, tail_sx, sx)
                end
            end
        end,
        on_load = function(self, entity) -- runs when cosmetic is loaded, can be used to load entities etc.
            local ent = EntityLoad("mods/evaisa.skineditor/content/cosmetics/entities/misc_tail/lizard.xml")
            EntityAddChild(entity, ent)
        end,
        on_unload = function(self, entity) -- runs when cosmetic is unloaded, can be used to unload entities etc.
            local children = EntityGetAllChildren(entity)
            for _, child in ipairs(children or {}) do
                if(EntityGetName(child) == "tail_cosmetic")then
                    EntityKill(child)
                end
            end
        end,
        on_arena_unlocked = function(self, entity) -- runs when player is unlocked in arena.
        end,
    },
}

cosmetic_types = {
    dunce = {
        max_stack = 1,
    },
    hat = {
        max_stack = 1,
    },
    particles = {
        max_stack = 3,
    },
    mask = {
        max_stack = 1,
    },
    amulet = {
        max_stack = 2,
    },
    tail = {
        max_stack = 1,
    },
}
