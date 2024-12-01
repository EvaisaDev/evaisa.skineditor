dofile_once("data/scripts/lib/utilities.lua")
--[[
local generated_id = 1000
function NewID(identifier, force)
	generated_id = generated_id + 1
	if(identifier ~= nil)then
		generated_id = generated_id + tostring(string.byte(identifier))
		if(force)then
			generated_id = 1000 + tonumber(tostring(string.byte(identifier)))
		end
	end
	return generated_id
end]]

local start_values = {}
local reserved_id_space = 3000
local next_start_value = reserved_id_space

local function get_start_value(identifier)
    if not start_values[identifier] then
        start_values[identifier] = next_start_value
        next_start_value = next_start_value + reserved_id_space
    end

    return start_values[identifier]
end

local id_pool = {}

function NewID(identifier, force)
    identifier = identifier or "default"
    
    if not id_pool[identifier] then
        id_pool[identifier] = start_values[identifier] or get_start_value(identifier)
    end
    
    id_pool[identifier] = id_pool[identifier] + 1
    
    if force then
        id_pool[identifier] = start_values[identifier] or get_start_value(identifier)
    end
    
    return id_pool[identifier]
end

function ResetIDs()
    id_count = 1
    id_pool = {}
end

local old_window_stack = {}
local window_stack = {}
last_hovered_window = last_hovered_window or nil
function ResetWindowStack()
	--print("ResetWindowStack")
	for k, window in pairs(old_window_stack) do
		if(window_stack[k] == nil)then
			old_window_stack[k] = nil
		end
	end

	for k, window in pairs(window_stack) do
		old_window_stack[k] = window
	end

	window_stack = {}
end


function WorldToScreenPos(gui_input, x, y)
	local ww, wh = MagicNumbersGetValue("VIRTUAL_RESOLUTION_X"), MagicNumbersGetValue("VIRTUAL_RESOLUTION_Y")
	local sw, sh = GuiGetScreenDimensions(gui_input)
	local _, _, cam_w, cam_h = GameGetCameraBounds()
	local cx, cy = GameGetCameraPos()
	cx = cx - cam_w / 2
	cy = cy - cam_h / 2
	x, y = x - cx, y - cy
	x, y = x / ww, y / wh
	x, y = x * sw, y * sh
	return x, y
end

temp_gui = temp_gui or GuiCreate()

function GetGuiMousePosition()
	local players = get_players()
	if(players ~= nil)then
		player = players[1]
		if(player ~= nil)then
			local controls_component = EntityGetFirstComponentIncludingDisabled(player, "ControlsComponent")
			
			GuiStartFrame(temp_gui)
			local screen_width, screen_height = GuiGetScreenDimensions(temp_gui)
			local input_x, input_y = 100, 100;

			local b_width = tonumber(game_config.get("internal_size_w")) or 1280
			local b_height = tonumber(game_config.get("internal_size_h")) or 720

			local mx, my = mouse_raw_x * screen_width / b_width, mouse_raw_y * screen_height / b_height
			--local mx, my = ComponentGetValue2(controls_component, "mMousePositionRaw")
			return mx, my
		end
	end
	return 0, 0
end

function ParseStringColors(str)
    -- Define pattern: # followed by [digits,digits,digits]
    local pattern = "#%[(%d+),(%d+),(%d+)%]"

    -- Initialize the output table
    local output = {}

    -- Initialize the last match position and color
    local last_pos, last_color = 1, nil

    -- Iterate through the input string, matching the pattern
    for r, g, b, pos in string.gmatch(str, "()" .. pattern .. "()") do
        -- Extract the text before the color marker or between the pre-existing color markers
        local text = string.sub(str, last_pos, pos - #pattern - 1)

        -- Add an entry to the output table
        table.insert(output, {text = text, color = last_color})

        -- Update the last match position and color
        last_pos = pos
        last_color = {tonumber(r), tonumber(g), tonumber(b)}
    end

    -- Add the remaining text after the last color marker
    local remaining_text = string.sub(str, last_pos)
    if remaining_text ~= "" then
        table.insert(output, {text = remaining_text, color = last_color})
    end

    return output
end


function GetMouseDown()
	local players = get_players()
	if(players ~= nil)then
		player = players[1]
		if(player ~= nil)then
			local controls_component = EntityGetFirstComponentIncludingDisabled(player, "ControlsComponent")
			local down = ComponentGetValue2(controls_component, "mButtonDownFire")
			return down
		end
	end
	return false
end

function GetCenterPosition(x, y, w, h)
	return x - (w/2), y - (h/2)
end

buttonHovers = buttonHovers or {}

function CustomButton(gui, identifier, x, y, z, scale, image, r, g, b, alpha)

	local width, height = GuiGetImageDimensions(gui, image, scale)
	GuiZSetForNextWidget(gui, z - 2)
	GuiImage(gui, NewID(identifier), x, y, image, 0.1, scale)
	local clicked, right_clicked, hovered, _x, _y, _width, _height, draw_x, draw_y, draw_width, draw_height = GuiGetPreviousWidgetInfo(gui)
	local button_id = NewID(identifier)
	if hovered then

		if(buttonHovers[button_id] == nil)then
			GamePlaySound("data/audio/Desktop/ui.bank", "ui/button_select", 0, 0)
			buttonHovers[button_id] = true
		end


		
		-- render GuiImage on top
		GuiColorSetForNextWidget(gui, 255/255, 255/255, 178/255, 1)
		GuiImage(gui, NewID(identifier), -width, y, image, 1, scale)
	else
		buttonHovers[button_id] = nil
		-- render GuiImage on top
		GuiColorSetForNextWidget(gui, r, g, b, alpha)
		GuiImage(gui, NewID(identifier), -width, y, image, alpha, scale)
	end
	if(clicked)then
		GamePlaySound("data/audio/Desktop/ui.bank", "ui/button_click", 0, 0)
		
	end
	return clicked
end

--[[
function DrawWindow(gui, z_index, x, y, w, h, title, centered, callback, close_callback, identifier, margin_x, margin_y, alignment, no_close_button)

	margin_x = margin_x or 2
	margin_y = margin_y or 2

	w = w + (margin_x * 2)
	h = h + (margin_y * 2)
	


	local last_render_width = w
	local had_scroll_bar = false

	if(old_window_stack[identifier] ~= nil)then
		last_render_width = old_window_stack[identifier].render_w
		had_scroll_bar = old_window_stack[identifier].had_scroll_bar
	end


	if(centered)then
		

		x, y = GetCenterPosition(x, y, w, h)
	end

	if(alignment and not had_scroll_bar)then
		x = x + 8
	end

	
	local bar_y = y


	GuiBeginAutoBox( gui )
	GuiZSet( gui, z_index - 1 )
	GuiColorSetForNextWidget( gui, 0, 0, 0, 0.3 )
	if(type(title) == "function")then
		GuiLayoutBeginHorizontal( gui,x, bar_y, true, 0, 0)
		GuiText(gui, 0, 0, " ")
		title()
		GuiLayoutEnd( gui )
		
	else
		GuiText(gui, x, bar_y, " "..title)
	end


	if(close_callback ~= nil and not no_close_button)then
		GuiLayoutBeginLayer( gui )
		GuiLayoutBeginHorizontal( gui, 0, 0, true, 0, 0)
		if(CustomButton(gui, "sagsadshds", x + (last_render_width - 10), bar_y + 1, z_index - 600, 1, "mods/evaisa.mp/files/gfx/ui/minimize.png", 0, 0, 0, 0.5))then
			close_callback()
		end
		GuiLayoutEnd( gui )
		GuiLayoutEndLayer( gui )
	end

	GuiZSetForNextWidget( gui, z_index )
	GuiOptionsAddForNextWidget(gui, GUI_OPTION.IsExtraDraggable)
	GuiEndAutoBoxNinePiece( gui, 0, last_render_width, 8, false, 0, "mods/evaisa.mp/files/gfx/ui/9piece_window_bar.png", "mods/evaisa.mp/files/gfx/ui/9piece_window_bar.png")
	
	local clicked, right_clicked, hovered, bar_x, bar_y, bar_w, bar_h = GuiGetPreviousWidgetInfo( gui )

	--GuiOptionsAddForNextWidget(gui, GUI_OPTION.IgnoreContainer)

	local mouse_x, mouse_y = input:GetUIMousePos(gui)

	local disable_scroll = true

	if (input:WasKeyPressed("f1")) then
        global_scroll_toggle = global_scroll_toggle or false
		global_scroll_toggle = not global_scroll_toggle 

	end

	
	-- only do this if we are the upmost window hovered
	-- check old_window_stack for this
	
	local hovered_windows = {}
	local total_windows = 0
	for k, v in pairs(old_window_stack)do
		if(mouse_x > v.x and mouse_x < v.x + v.render_w and mouse_y > v.y and mouse_y < v.y + v.h)then
			table.insert(hovered_windows, v)
		end
		total_windows = total_windows + 1
	end

	if(last_hovered_window == identifier)then
		disable_scroll = false
	else
		if(#hovered_windows > 0)then

			-- check z index, lower z is higher up
			local highest_z = 9999
			local highest_window = nil
			for k, v in ipairs(hovered_windows)do
				if(v.z_index < highest_z)then
					highest_z = v.z_index
					highest_window = v.identifier
				end
			end
			if(highest_window ~= nil and highest_window == identifier)then
				disable_scroll = false
			end
		end
	end
	
	if(global_scroll_toggle)then
		disable_scroll = true
	end

	local id_extra = 0
	if(disable_scroll)then
		id_extra = id_extra + 1
		id_extra = GameGetFrameNum() % 2
	end

	local id = NewID(identifier)
	NewID(identifier)

	local screen_width, screen_height = GuiGetScreenDimensions( gui )

	-- check if render_w is bigger than w
	local had_scroll_bar = false

	if(last_render_width > w)then
		had_scroll_bar = true
	end

	
	if(had_scroll_bar and not disable_scroll)then
		last_hovered_window = identifier
	end

	local draw_w, draw_h = w, h


	GuiOptionsAddForNextWidget(gui, GUI_OPTION.NoPositionTween)
	GuiOptionsRemove(gui, GUI_OPTION.DrawScaleIn)

	GuiZSetForNextWidget( gui, z_index + 1 )
	GuiBeginScrollContainer( gui, id + id_extra, x, y + bar_h + 3, w - (margin_x * 2), h - bar_h - (margin_y * 2), true, margin_x or 2, margin_y or 2 )
	local _, _, _, _, _, _, _, _, _, render_w, render_h = GuiGetPreviousWidgetInfo( gui )
	GuiZSet( gui, z_index )
	GuiOptionsAddForNextWidget(gui, GUI_OPTION.GamepadDefaultWidget)
	callback(x, y, w, h)
	GuiZSet( gui, 0 )
	GuiEndScrollContainer( gui )
	

	window_stack[identifier] = {
		identifier = identifier,
		z_index = z_index,
		x = x,
		y = y,
		w = w,
		h = h,
		render_w = render_w,
		render_h = render_h,
		had_scroll_bar = had_scroll_bar
	}

end
]]

--[[
		
	local was_non_interactive = GuiOptionsHas(gui, GUI_OPTION.NonInteractive)
	GuiOptionsAdd(gui, GUI_OPTION.NonInteractive)

	GuiZSetForNextWidget( gui, z_index + 1 )
	GuiBeginScrollContainer( gui, id, x, y, w, h, true, 2, 2 )
	local _, _, _, _, _, _, _, _, _, render_w, render_h = GuiGetPreviousWidgetInfo( gui )
	GuiZSet( gui, z_index )
	callback(x, y, w, h)
	GuiZSet( gui, 0 )
	GuiEndScrollContainer( gui )

	local has_scroll_bar = false
	if(render_w > w)then
		print(identifier.." has scroll bar")
		print(tostring(render_w).." > "..tostring(w))
		has_scroll_bar = true
	end


	if(was_non_interactive)then
		GuiOptionsAdd(gui, GUI_OPTION.NonInteractive)
	else
		GuiOptionsRemove(gui, GUI_OPTION.NonInteractive)
	end

	

	--local _, _, _, _, _, content_width, content_height = GuiGetPreviousWidgetInfo( gui )

	--content_height = content_height - 8

	if(not has_scroll_bar and not disable_scroll)then
		w = w + 8
	elseif(has_scroll_bar and not disable_scroll)then
		last_hovered_window = identifier
	end
]]

function DrawWindow(gui, z_index, x, y, w, h, title, centered, callback, close_callback, identifier, margin_x, margin_y, alignment, no_close_button)

	margin_x = margin_x or 2
	margin_y = margin_y or 2

	w = w + (margin_x * 2)
	h = h + (margin_y * 2)
	

	local had_scroll_bar = last_hovered_window == identifier



	if(centered)then
		

		x, y = GetCenterPosition(x, y, w, h)
	end

	--[[if(alignment and not had_scroll_bar)then
		x = x + 8
	end]]

	
	local bar_y = y

	--[[if(had_scroll_bar)then
		w = w - 8
	end]]

	GuiBeginAutoBox( gui )
	GuiZSet( gui, z_index - 1 )
	GuiColorSetForNextWidget( gui, 0, 0, 0, 0.3 )
	if(type(title) == "function")then
		GuiLayoutBeginHorizontal( gui,x, bar_y, true, 0, 0)
		GuiText(gui, 0, 0, " ")
		title()
		GuiLayoutEnd( gui )
		
	else
		GuiText(gui, x, bar_y, " "..title)
	end


	if(close_callback ~= nil and not no_close_button)then
		GuiLayoutBeginLayer( gui )
		GuiLayoutBeginHorizontal( gui, 0, 0, true, 0, 0)
		if(CustomButton(gui, "sagsadshds", x + (w - 10), bar_y + 1, z_index - 600, 1, "mods/evaisa.mp/files/gfx/ui/minimize.png", 0, 0, 0, 0.5))then
			close_callback()
		end
		GuiLayoutEnd( gui )
		GuiLayoutEndLayer( gui )
	end

	GuiZSetForNextWidget( gui, z_index )
	GuiOptionsAddForNextWidget(gui, GUI_OPTION.IsExtraDraggable)
	GuiEndAutoBoxNinePiece( gui, 0, w, 8, false, 0, "mods/evaisa.mp/files/gfx/ui/9piece_window_bar.png", "mods/evaisa.mp/files/gfx/ui/9piece_window_bar.png")
	
	local clicked, right_clicked, hovered, bar_x, bar_y, bar_w, bar_h = GuiGetPreviousWidgetInfo( gui )

	--GuiOptionsAddForNextWidget(gui, GUI_OPTION.IgnoreContainer)

	local mouse_x, mouse_y = input:GetUIMousePos(gui)

	local disable_scroll = true

	if (input:WasKeyPressed("f1")) then
        global_scroll_toggle = global_scroll_toggle or false
		global_scroll_toggle = not global_scroll_toggle 

	end

	
	-- only do this if we are the upmost window hovered
	-- check old_window_stack for this
	
	local hovered_windows = {}
	local total_windows = 0
	for k, v in pairs(old_window_stack)do
		if(mouse_x > v.x and mouse_x < v.x + v.w and mouse_y > v.y and mouse_y < v.y + v.h)then
			table.insert(hovered_windows, v)
		end
		total_windows = total_windows + 1
	end

	if(last_hovered_window == identifier)then
		disable_scroll = false
	else
		if(#hovered_windows > 0)then

			-- check z index, lower z is higher up
			local highest_z = 9999
			local highest_window = nil
			for k, v in ipairs(hovered_windows)do
				if(v.z_index < highest_z)then
					highest_z = v.z_index
					highest_window = v.identifier
				end
			end
			if(highest_window ~= nil and highest_window == identifier)then
				disable_scroll = false
			end
		end
	end
	
	if(global_scroll_toggle)then
		disable_scroll = true
	end

	local id_extra = 0
	if(disable_scroll)then
		id_extra = id_extra + 1
		id_extra = GameGetFrameNum() % 2
	end

	local id = NewID(identifier)
	NewID(identifier)

	local screen_width, screen_height = GuiGetScreenDimensions( gui )


	local was_non_interactive = GuiOptionsHas(gui, GUI_OPTION.NonInteractive)
	GuiOptionsAdd(gui, GUI_OPTION.NonInteractive)

	local precalc_w = w - (margin_x * 2)

	GuiZSetForNextWidget( gui, z_index - 100 )
	GuiBeginScrollContainer( gui, id + 23587, screen_width + margin_x + 2,  y + bar_h + 3, precalc_w, h - bar_h - (margin_y * 2), true, margin_x or 2, margin_y or 2 )
	local _, _, _, _, _, _, _, _, _, render_w, render_h = GuiGetPreviousWidgetInfo( gui )
	GuiZSet( gui, z_index - 101 )
	callback(x, y, w, h)
	GuiZSet( gui, 0 )
	GuiEndScrollContainer( gui )

	local had_scroll_bar = false

	--print(tostring(render_w - 4).." > "..tostring(w))

	if(render_w - 4 > w)then
		had_scroll_bar = true
	end


	if(was_non_interactive)then
		GuiOptionsAdd(gui, GUI_OPTION.NonInteractive)
	else
		GuiOptionsRemove(gui, GUI_OPTION.NonInteractive)
	end



	
	if(had_scroll_bar and not disable_scroll)then
		last_hovered_window = identifier
	end

	if(last_hovered_window == identifier)then
		w = w - 8
	end

	local draw_w, draw_h = w, h


	GuiOptionsAddForNextWidget(gui, GUI_OPTION.NoPositionTween)
	GuiOptionsRemove(gui, GUI_OPTION.DrawScaleIn)

	GuiZSetForNextWidget( gui, z_index + 1 )
	GuiBeginScrollContainer( gui, id + id_extra, x, y + bar_h + 3, w - (margin_x * 2), h - bar_h - (margin_y * 2), true, margin_x or 2, margin_y or 2 )
	GuiZSet( gui, z_index )
	GuiOptionsAddForNextWidget(gui, GUI_OPTION.GamepadDefaultWidget)
	callback(x, y, w, h)
	GuiZSet( gui, 0 )
	GuiEndScrollContainer( gui )
	

	window_stack[identifier] = {
		identifier = identifier,
		z_index = z_index,
		x = x,
		y = y,
		w = w,
		h = h,
	}

end



function CustomTooltip(gui, callback, z, x_offset, y_offset )
	if z == nil then z = -12; end
	local left_click,right_click,hover,x,y,width,height,draw_x,draw_y,draw_width,draw_height = GuiGetPreviousWidgetInfo( gui );
	local screen_width,screen_height = GuiGetScreenDimensions( gui );
	if x_offset == nil then x_offset = 0; end
	if y_offset == nil then y_offset = 0; end
	if draw_y > screen_height * 0.5 then
		y_offset = y_offset - height;
	end
	if hover then
		local screen_width, screen_height = GuiGetScreenDimensions( gui );
		GuiZSet( gui, z );
		GuiLayoutBeginLayer( gui );
			GuiLayoutBeginVertical( gui, ( x + x_offset + width * 2 ) / screen_width * 100, ( y + y_offset ) / screen_height * 100 );
				GuiOptionsAdd( gui, GUI_OPTION.NoPositionTween )
				GuiBeginAutoBox( gui );
					if callback ~= nil then callback(); end
					GuiZSetForNextWidget( gui, z + 1 );
				GuiEndAutoBoxNinePiece( gui );
			GuiLayoutEnd( gui );
		GuiLayoutEndLayer( gui );
	end
end

function Gui9Piece(gui, id_func, x, y, width, height, alpha, z_index, image_sprite, piece_size)
    -- top left
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x, y, image_sprite, alpha, 1, 1, 0, 1, "tl")
    -- top right
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x + width - piece_size, y, image_sprite, alpha, 1, 1, 0, 1, "tr")
    -- bottom left
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x, y + height - piece_size, image_sprite, alpha, 1, 1, 0, 1, "bl")
    -- bottom right
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x + width - piece_size, y + height - piece_size, image_sprite, alpha, 1, 1, 0, 1, "br")
    -- top
    GuiZSetForNextWidget(gui, z_index) 
    GuiImage(gui, id_func(), x + piece_size, y, image_sprite, alpha, (width - piece_size * 2) / piece_size, 1, 0, 1, "tc")
    -- bottom
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x + piece_size, y + height - piece_size, image_sprite, alpha, (width - piece_size * 2) / piece_size, 1, 0, 1, "bc")
    -- left
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x, y + piece_size, image_sprite, alpha, 1, (height - piece_size * 2) / piece_size, 0, 1, "lc")
    -- right
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x + width - piece_size, y + piece_size, image_sprite, alpha, 1, (height - piece_size * 2) / piece_size, 0, 1, "rc")
    -- center
    GuiZSetForNextWidget(gui, z_index)
    GuiImage(gui, id_func(), x + piece_size, y + piece_size, image_sprite, alpha, (width - piece_size * 2) / piece_size, (height - piece_size * 2) / piece_size, 0, 1, "c")
end

local button_stack = {}
function GuiTextButton(gui, id_func, x, y, text, z_index, line_spacing, color_r, color_g, color_b, color_a, max_width, tooltip_func)
	color_r = color_r or 1
	color_g = color_g or 1
	color_b = color_b or 1
	color_a = color_a or 1
	max_width = max_width or 10000
	local was_hovered = false
	local id = id_func()
	if(button_stack[id] == nil)then
		button_stack[id] = {}
	else
		was_hovered = button_stack[id].hovered
	end
	local any_was_hovered = false
	local any_was_clicked = false
	local any_was_right_clicked = false

	local index = 0
	local last_x = 0
	if type(text) == "table" then
		for i, txt in ipairs(text)do
			local str = txt.text
			local color = txt.color or nil

			local x_offset = last_x or 0

			for line in str:gmatch("[^\r\n]+") do
				local text_width, text_height = GuiGetTextDimensions(gui, line)
				if(was_hovered)then
					GuiColorSetForNextWidget(gui, 255 / 255, 255 / 255, 178 / 255, 1)
				else
					if color then
						GuiColorSetForNextWidget(gui, color[1], color[2], color[3], color[4])
					else
						GuiColorSetForNextWidget(gui, color_r, color_g, color_b, color_a)
					end
				end
				GuiZSetForNextWidget(gui, z_index)
				local offset = index * (text_height + (line_spacing or 0))

				if(x_offset ~= 0 and x + x_offset > max_width)then
					index = index + 1
					x_offset = 0
					offset = index * (text_height + (line_spacing or 0))
				end

				GuiButton(gui, id_func(), x + x_offset, y + offset, line)
				if(tooltip_func)then
					tooltip_func()
				end

				last_x = x + text_width

				local clicked, right_clicked, hovered = GuiGetPreviousWidgetInfo(gui)
	
				if(clicked)then
					any_was_clicked = true
				end
				if(right_clicked)then
					any_was_right_clicked = true
				end
				if(hovered)then
					any_was_hovered = true
				end

				x_offset = 0

	
				index = index + 1
			end
			index = index - 1

		end
	else
		for line in text:gmatch("[^\r\n]+") do
			local text_width, text_height = GuiGetTextDimensions(gui, line)
			if(was_hovered)then
				GuiColorSetForNextWidget(gui, 255 / 255, 255 / 255, 178 / 255, 1)
			else
				GuiColorSetForNextWidget(gui, color_r, color_g, color_b, color_a)
			end
			GuiZSetForNextWidget(gui, z_index)
			local offset = index * (text_height + (line_spacing or 0))
			GuiButton(gui, id_func(), x, y + offset, line)
			if(tooltip_func)then
				tooltip_func()
			end
			local clicked, right_clicked, hovered = GuiGetPreviousWidgetInfo(gui)

			if(clicked)then
				any_was_clicked = true
			end
			if(right_clicked)then
				any_was_right_clicked = true
			end
			if(hovered)then
				any_was_hovered = true
			end

			index = index + 1
		end
	end

	button_stack[id].hovered = any_was_hovered
	button_stack[id].clicked = any_was_clicked
	button_stack[id].right_clicked = any_was_right_clicked

	return any_was_clicked, any_was_clicked, any_was_hovered
end

function GuiTextMultiline(gui, x, y, text, z_index, line_spacing, color_r, color_g, color_b, color_a, max_width, tooltip_func)
	-- guitext with multiline support
	color_r = color_r or 1
	color_g = color_g or 1
	color_b = color_b or 1
	color_a = color_a or 1
	max_width = max_width or 10000

	local index = 0
	local last_x = 0
	if type(text) == "table" then
		for i, txt in ipairs(text)do
			local str = txt.text
			local color = txt.color or nil

			local x_offset = last_x or 0

			for line in str:gmatch("[^\r\n]+") do
				local text_width, text_height = GuiGetTextDimensions(gui, line)

				if color then
					GuiColorSetForNextWidget(gui, color[1], color[2], color[3], color[4])
				else
					GuiColorSetForNextWidget(gui, color_r, color_g, color_b, color_a)
				end

				GuiZSetForNextWidget(gui, z_index)
				local offset = index * (text_height + (line_spacing or 0))

				if(x_offset ~= 0 and x + x_offset > max_width)then
					index = index + 1
					x_offset = 0
					offset = index * (text_height + (line_spacing or 0))
				end

				GuiText(gui, x + x_offset, y + offset, line)
				if(tooltip_func)then
					tooltip_func()
				end

				last_x = x + text_width

				x_offset = 0

	
				index = index + 1
			end
			index = index - 1

		end
	else
		for line in text:gmatch("[^\r\n]+") do
			local text_width, text_height = GuiGetTextDimensions(gui, line)

			GuiColorSetForNextWidget(gui, color_r, color_g, color_b, color_a)

			GuiZSetForNextWidget(gui, z_index)
			local offset = index * (text_height + (line_spacing or 0))
			GuiText(gui, x, y + offset, line)
			if(tooltip_func)then
				tooltip_func()
			end
	
			index = index + 1
		end
	end
end