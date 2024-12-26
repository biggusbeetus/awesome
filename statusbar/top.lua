-- {{{ Required libraries
-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")

-- Wibox handling library
local wibox = require("wibox")

local gears = require("gears")
local naughty = require("naughty")
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB = WB_PACKAGE

-- Create a textclock widget
local textclock = wibox.widget.textclock()

-- Keyboard map indicator and switcher
local keyboardlayout = awful.widget.keyboardlayout()

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.add_widgets_left(s)
	local taglist_buttons = gears.table.join(
		awful.button({}, 1, function(t)
			t:view_only()
		end),
		awful.button({ modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),
		awful.button({}, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
		awful.button({}, 4, function(t)
			awful.tag.viewnext(t.screen)
		end),
		awful.button({}, 5, function(t)
			awful.tag.viewprev(t.screen)
		end)
	)

	s.taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	s.promptbox = awful.widget.prompt()

	local selected_tag = awful.tag.find_by_name(awful.screen.focused(), "2")
	local clients = selected_tag:clients()

	local tasklist_buttons = gears.table.join(
		awful.button({}, 1, function(c)
			if c == client.focus then
				c.minimized = true
			else
				c:emit_signal("request::activate", "tasklist", { raise = true })
			end
		end),
		awful.button({}, 3, function()
			awful.menu.client_list({ theme = { width = 250 } })
		end),
		awful.button({}, 4, function()
			awful.client.focus.byidx(1)
		end),
		awful.button({}, 5, function()
			awful.client.focus.byidx(-1)
		end)
	)

	s.tasks = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		style = {
      bg_focus = beautiful.border_focus[5],
			border_strategy = "inner",
		},
		layout = {
			spacing = 1,
			layout = wibox.layout.flex.horizontal,
		},
		widget_template = {
			{
				{
					{
						id = "icon_role",
						widget = wibox.widget.imagebox,
					},
					margins = 5,
					widget = wibox.container.margin,
				},
				left = 5,
				right = 5,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
		},
	})

	return { -- Left widgets
		layout = wibox.layout.fixed.horizontal,
		RC.launcher,
		s.taglist,
		s.promptbox,
		s.tasks,
	}
end

function WB.add_widgets_middle()
	return textclock -- Middle widget
end

function WB.add_widgets_right(s)
	s.layoutbox = awful.widget.layoutbox(s)
	s.layoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	return { -- Right widgets
		layout = wibox.layout.fixed.horizontal,
		keyboardlayout,
		wibox.widget.systray(),
		s.layoutbox,
	}
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.generate_top_wibox(s)
	-- Create the wibox
	s.wibox_top = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.wibox_top:setup({
		layout = wibox.layout.stack,
		{
			layout = wibox.layout.align.horizontal,
			WB.add_widgets_left(s),
			nil,
			WB.add_widgets_right(s),
		},
		{
			layout = wibox.container.place,
			WB.add_widgets_middle(),
		},
	})
end
