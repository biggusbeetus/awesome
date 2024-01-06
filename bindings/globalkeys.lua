-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- Menubar library
local menubar = require("menubar")

-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

local _M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

function _M.get()
	local globalKeys = gears.table.join(
		awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
		awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
		awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
		awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

		awful.key({ modkey }, "j", function()
			awful.client.focus.byidx(1)
		end, { description = "focus next by index", group = "client" }),
		awful.key({ modkey }, "k", function()
			awful.client.focus.byidx(-1)
		end, { description = "focus previous by index", group = "client" }),
		awful.key({ modkey }, "w", function()
			RC.mainmenu:show()
		end, { description = "show main menu", group = "awesome" }),

		-- Layout manipulation
		awful.key({ modkey, "Shift" }, "j", function()
			awful.client.swap.byidx(1)
		end, { description = "swap with next client by index", group = "client" }),
		awful.key({ modkey, "Shift" }, "k", function()
			awful.client.swap.byidx(-1)
		end, { description = "swap with previous client by index", group = "client" }),
		awful.key({ modkey, "Control" }, "j", function()
			awful.screen.focus_relative(1)
		end, { description = "focus the next screen", group = "screen" }),
		awful.key({ modkey, "Control" }, "k", function()
			awful.screen.focus_relative(-1)
		end, { description = "focus the previous screen", group = "screen" }),
		awful.key(
			{ modkey },
			"u",
			awful.client.urgent.jumpto,
			{ description = "jump to urgent client", group = "client" }
		),
		awful.key({ modkey }, "Tab", function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end, { description = "go back", group = "client" }),

		-- Standard program
		awful.key({ modkey }, "Return", function()
			awful.spawn(terminal)
		end, { description = "open a terminal", group = "launcher" }),
		awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
		awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

		awful.key({ modkey }, "l", function()
			awful.tag.incmwfact(0.05)
		end, { description = "increase master width factor", group = "layout" }),
		awful.key({ modkey }, "h", function()
			awful.tag.incmwfact(-0.05)
		end, { description = "decrease master width factor", group = "layout" }),
		awful.key({ modkey, "Shift" }, "h", function()
			awful.tag.incnmaster(1, nil, true)
		end, { description = "increase the number of master clients", group = "layout" }),
		awful.key({ modkey, "Shift" }, "l", function()
			awful.tag.incnmaster(-1, nil, true)
		end, { description = "decrease the number of master clients", group = "layout" }),
		awful.key({ modkey, "Control" }, "h", function()
			awful.tag.incncol(1, nil, true)
		end, { description = "increase the number of columns", group = "layout" }),
		awful.key({ modkey, "Control" }, "l", function()
			awful.tag.incncol(-1, nil, true)
		end, { description = "decrease the number of columns", group = "layout" }),
		awful.key({ modkey }, "space", function()
			awful.layout.inc(1)
		end, { description = "select next", group = "layout" }),
		awful.key({ modkey, "Shift" }, "space", function()
			awful.layout.inc(-1)
		end, { description = "select previous", group = "layout" }),

		awful.key({ modkey, "Control" }, "n", function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end, { description = "restore minimized", group = "client" }),

		-- Rofi
		awful.key({ modkey }, "r", function()
			awful.util.spawn("rofi -show drun")
		end, { description = "Execute Rofi Dmenu", group = "launcher" }),
		awful.key({ modkey, "Shift" }, "w", function()
			awful.util.spawn("rofi -show window")
		end, { description = "Execute Rofi Window", group = "launcher" }),
		awful.key({ modkey, "Shift" }, "s", function()
			awful.util.spawn("rofi -show ssh")
		end, { description = "Execute Rofi SSH", group = "launcher" }),
		awful.key({ modkey, "Shift" }, "r", function()
			awful.util.spawn("rofi -show run")
		end, { description = "Execute Rofi Run", group = "launcher" }),

		awful.key({ modkey }, "x", function()
			awful.prompt.run({
				prompt = "Run Lua code: ",
				textbox = awful.screen.focused().mypromptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval",
			})
		end, { description = "lua execute prompt", group = "awesome" }),
		-- Menubar
		awful.key({ modkey }, "p", function()
			menubar.show()
		end, { description = "show the menubar", group = "launcher" }),

		-- Set audio keys
		awful.key({ modkey }, "[", function()
			awful.util.spawn("amixer -D pulse sset Master 2%+", false)
		end, { description = "Volume up", group = "media" }),
		awful.key({ modkey }, "]", function()
			awful.util.spawn("amixer -D pulse sset Master 2%-", false)
		end, { description = "Volume down", group = "media" }),
		awful.key({ modkey }, "m", function()
			awful.util.spawn("amixer -D pulse sset Master toggle", false)
		end, { description = "Mute", group = "media" }),

		-- Resize
		awful.key({ modkey, "Control" }, "Down", function()
			awful.client.moveresize(0, 0, 0, -20)
		end),
		awful.key({ modkey, "Control" }, "Up", function()
			awful.client.moveresize(0, 0, 0, 20)
		end),
		awful.key({ modkey, "Control" }, "Left", function()
			awful.client.moveresize(0, 0, -20, 0)
		end),
		awful.key({ modkey, "Control" }, "Right", function()
			awful.client.moveresize(0, 0, 20, 0)
		end),

		-- Move
		awful.key({ modkey, "Shift" }, "Down", function()
			awful.client.moveresize(0, 20, 0, 0)
		end),
		awful.key({ modkey, "Shift" }, "Up", function()
			awful.client.moveresize(0, -20, 0, 0)
		end),
		awful.key({ modkey, "Shift" }, "Left", function()
			awful.client.moveresize(-20, 0, 0, 0)
		end),
		awful.key({ modkey, "Shift" }, "Right", function()
			awful.client.moveresize(20, 0, 0, 0)
		end)
	)

	return globalKeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
