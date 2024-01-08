-- Standard awesome library
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {}

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get(clientkeys)
	local rules = {

		-- All clients will match this rule.
		{
			rule = {},
			properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			screen = awful.screen.preferred,
			placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
      floating = false
			},
		},

		-- Floating clients.
		{
			rule_any = {
				instance = {
					"copyq", -- Includes session name in class.
					"pinentry",
				},
				class = {
					"Arandr",
					"Blueman-manager",
					"Brave-browser",
					"Inkscape",
					"Gimp-2.10",
          "Minecraft* 1.20.1",
				},

				-- Note that the name property shown in xprop might be set slightly after creation of the client
				-- and the name shown there might not match defined rules here.
				name = {},
				role = {
					"AlarmWindow",
					"ConfigManager",
					"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				},
			},
			properties = {
				floating = true,
			},
		},

		-- Add titlebars to normal clients and dialogs
		{
			rule_any = {
				type = { "normal", "dialog" },
			},
			properties = {
				titlebars_enabled = true,
			},
		},

		{ rule = { class = "Brave-browser" }, properties = { screen = 1, tag = "1" } },
		{ rule = { class = "Spotify" }, properties = { screen = 1, tag = "9" } },
		{ rule = { class = "Minecraft* 1.20.1" }, properties = { screen = 1, tag = "4" } },
	}

	return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
