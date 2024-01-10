---------------------------------------------
-- Awesome theme which follows xrdb config --
--   by Yauhen Kirylau                    --
---------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

-- {{{ Font Styles
THEME.font = "JetBrains Mono 12"
THEME.taglist_font = "JetBrains Mono Semibold 10"

THEME.focus_colors = { xrdb.color2, xrdb.color11, xrdb.color12, xrdb.color13, xrdb.color14 }
-- {{{ Borders
THEME.useless_gap = dpi(5)
THEME.border_width = dpi(4)
THEME.border_color_normal = xrdb.color0
THEME.border_color_active = THEME.focus_colors[2]
THEME.border_color_marked = xrdb.color1
-- }}}

-- {{{ Mouse finder
THEME.mouse_finder_color = xrdb.color11
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

THEME.bg_normal     = xrdb.background
THEME.bg_focus      = xrdb.color11
THEME.bg_urgent     = xrdb.color9
THEME.bg_minimize   = xrdb.color8
THEME.bg_systray    = THEME.bg_normal

THEME.fg_normal     = xrdb.foreground
THEME.fg_focus      = THEME.bg_normal
THEME.fg_urgent     = THEME.bg_normal
THEME.fg_minimize   = THEME.bg_normal

THEME.titlebar_fg_focus = THEME.bg_normal
THEME.titlebar_bg_focus = THEME.focus_colors[2]

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

THEME.tooltip_fg = THEME.fg_normal
THEME.tooltip_bg = THEME.bg_normal

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
THEME.menu_submenu_icon = THEMES_PATH.."default/submenu.png"
THEME.menu_height = dpi(16)
THEME.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Recolor Layout icons:
THEME = theme_assets.recolor_layout(THEME, THEME.fg_normal)

-- Recolor titlebar icons:
--
local function darker(color_value, darker_n)
    local result = "#"
    for s in color_value:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
        local bg_numeric_value = tonumber("0x"..s) - darker_n
        if bg_numeric_value < 0 then bg_numeric_value = 0 end
        if bg_numeric_value > 255 then bg_numeric_value = 255 end
        result = result .. string.format("%2.2x", bg_numeric_value)
    end
    return result
end

THEME = theme_assets.recolor_titlebar(
    THEME, THEME.fg_normal, "normal"
)
THEME = theme_assets.recolor_titlebar(
    THEME, darker(THEME.fg_normal, -60), "normal", "hover"
)
THEME = theme_assets.recolor_titlebar(
    THEME, xrdb.color1, "normal", "press"
)
THEME = theme_assets.recolor_titlebar(
    THEME, THEME.fg_focus, "focus"
)
THEME = theme_assets.recolor_titlebar(
    THEME, darker(THEME.fg_focus, -60), "focus", "hover"
)
THEME = theme_assets.recolor_titlebar(
    THEME, xrdb.color1, "focus", "press"
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
THEME.icon_theme = nil

-- Generate Awesome icon:
THEME.awesome_icon = theme_assets.awesome_icon(
    THEME.menu_height, THEME.bg_focus, THEME.fg_focus
)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
THEME.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, THEME.fg_normal
)
THEME.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, THEME.fg_normal
)

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

