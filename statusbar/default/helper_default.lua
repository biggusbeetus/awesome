-- {{{ Required libraries
-- Standard awesome library
local awful     = require("awful")
local beautiful = require("beautiful")

-- Wibox handling library
local wibox = require("wibox")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB = WIBOX_PACKAGE

-- Create a textclock widget
TEXT_CLOCK = wibox.widget.textclock()

-- Keyboard map indicator and switcher
KEYBOARD_LAYOUT = awful.widget.keyboardlayout()

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.add_widgets_left (s)
  return { -- Left widgets
    layout = wibox.layout.fixed.horizontal,
    RC.launcher,
    s.taglist,
    wibox.widget.textbox(" | "),
    s.promptbox,
  }
end

function WB.add_widgets_middle (s)
  return s.tasklist -- Middle widget
end

function WB.add_widgets_right (s)
  return { -- Right widgets
    layout = wibox.layout.fixed.horizontal,
    KEYBOARD_LAYOUT,
    wibox.widget.systray(),
    TEXT_CLOCK,
    s.layoutbox,
  }
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.generate_wibox_one (s)
  -- layout: l_left, tasklist, l_right

  -- Create the wibox
  s.wibox_top = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.wibox_top:setup {
    layout = wibox.layout.align.horizontal,
    WB.add_widgets_left (s),
    WB.add_widgets_middle (s),
    WB.add_widgets_right (s),
  }
end
