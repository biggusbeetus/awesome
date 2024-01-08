-- module("anybox.titlebar", package.seeall)

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)

	awful.titlebar(c):setup({
		layout = wibox.layout.stack,
		{
			layout = wibox.layout.align.horizontal,
      nil,
			nil,
			{ -- Right
				awful.titlebar.widget.floatingbutton(c),
				awful.titlebar.widget.maximizedbutton(c),
				awful.titlebar.widget.stickybutton(c),
				awful.titlebar.widget.ontopbutton(c),
				awful.titlebar.widget.closebutton(c),
				layout = wibox.layout.fixed.horizontal(),
			},
		},
		{
			layout = wibox.container.place,
			{ -- Middle
				{ -- Title
					align = "center",
					widget = awful.titlebar.widget.titlewidget(c),
				},
				layout = wibox.layout.flex.horizontal,
			},
		},
	})
end)
