local fennel = require("fennel").install()
fennel.path = fennel.path .. ";.config/awesome/?.fnl"

pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
local menubar = require("menubar")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")
modkey = RC.vars.modkey

-- Autofocus
require("awful.autofocus")

-- Error handling
require("main.error-handling")

-- Load theme
require("main.theme")

-- -- --

-- Calling All Module Libraries

-- Custom Local Library
local main = {
	layouts = require("main.layouts"),
	tags = require("main.tags"),
	menu = require("main.menu"),
	rules = require("main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
local bindings = {
	globalbuttons = require("bindings.globalbuttons"),
	clientbuttons = require("bindings.clientbuttons"),
	globalkeys = require("bindings.globalkeys"),
	bindtotags = require("bindings.bindtotags"),
	clientkeys = require("bindings.clientkeys"),
}

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- Menu

if has_fdo then
	RC.mainmenu = freedesktop.menu.build({
		after = { main.menu() },
	})
else
	RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys
end

RC.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = RC.mainmenu })
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = bindings.globalkeys()
RC.globalkeys = bindings.bindtotags(RC.globalkeys)

-- Set root
root.buttons(bindings.globalbuttons())
root.keys(RC.globalkeys)

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Statusbar: Wibar
local statusbar = require("statusbar.statusbar")
statusbar()

-- Rules
awful.rules.rules = main.rules(bindings.clientkeys())

-- Signals
require("main.signals")

-- Autorun
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
