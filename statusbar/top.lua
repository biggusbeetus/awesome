-- {{{ Required libraries
-- Standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")

-- Wibox handling library
local wibox = require("wibox")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB = WB_PACKAGE

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.add_widgets_left(s)
	return { -- Left widgets
		layout = wibox.layout.fixed.horizontal,
		RC.launcher,
		s.taglist,
		s.promptbox,
	}
end

function WB.add_widgets_middle()
	return mytextclock -- Middle widget
end

function WB.add_widgets_right(s)
	return { -- Right widgets
		layout = wibox.layout.fixed.horizontal,
		mykeyboardlayout,
		wibox.widget.systray(),
		s.layoutbox,
	}
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.generate_wibox_one(s)
	-- layout: l_left, tasklist, l_right

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
    }
	})
end
