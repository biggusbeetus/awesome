-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local move_step = 10
function _M.get()
	local clientkeys = gears.table.join(
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		awful.key(
			{ modkey, "Control" },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		awful.key({ modkey, "Control" }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "move to master", group = "client" }),
		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),
		awful.key({ modkey }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "toggle keep on top", group = "client" }),
		awful.key({ modkey }, "c", function(c)
			awful.placement.centered(c, { honor_workarea = true })
		end, { description = "center client", group = "client" }),
		awful.key({ modkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)maximize", group = "client" }),
		awful.key({ modkey, "Control" }, "m", function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end, { description = "(un)maximize vertically", group = "client" }),
		awful.key({ modkey, "Shift" }, "m", function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end, { description = "(un)maximize horizontally", group = "client" }),
		awful.key({ modkey }, "=", function(c)
			c:relative_move(nil, nil, move_step, nil)
		end, { description = "Increase width", group = "client" }),
		awful.key({ modkey, "Shift" }, "=", function(c)
			c:relative_move(nil, nil, nil , move_step)
		end, { description = "Increase height", group = "client" }),
		awful.key({ modkey }, "-", function(c)
			c:relative_move(nil, nil, move_step * -1, nil)
		end, { description = "Decrease width", group = "client" }),
		awful.key({ modkey, "Shift" }, "-", function(c)
			c:relative_move(nil, nil, nil , move_step * -1)
		end, { description = "Decrease  height", group = "client" }),
		awful.key({ modkey, "Control", "Shift" }, "k", function(c)
			c:relative_move(nil, move_step * -1, nil, nil)
		end, { description = "Move client upwards", group = "client" }),
		awful.key({ modkey, "Control", "Shift" }, "j", function(c)
			c:relative_move(nil, move_step, nil , nil)
		end, { description = "Move client downwards", group = "client" }),
		awful.key({ modkey, "Control", "Shift" }, "h", function(c)
			c:relative_move(move_step * -1, nil, nil, nil)
		end, { description = "Move client left", group = "client" }),
		awful.key({ modkey, "Control", "Shift" }, "l",  function(c)
			c:relative_move(move_step, nil, nil , nil)
		end, { description = "Move client right", group = "client" }),
		awful.key({ modkey }, "b",  function(c)
      awful.placement.stretch(c, {"left", "right", "up", "down"})
		end, { description = "Stretch client", group = "client" })
	)

	return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
