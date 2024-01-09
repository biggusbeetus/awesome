local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- {{{ Styles
THEME.font = "JetBrains Mono 12"
THEME.taglist_font = "JetBrains Mono Semibold 10"

-- {{{ Colors
THEME.bg_normal = "#3F3F3F"
THEME.bg_focus = "#1E2320"
THEME.bg_urgent = "#3F3F3F"
THEME.bg_systray = THEME.bg_normal

THEME.fg_normal = "#DCDCCC"
THEME.fg_focus = "#F0DFAF"
THEME.fg_urgent = "#CC9393"
THEME.fg_minimize = "#DCDCCC"
-- }}}

-- {{{ Borders
THEME.useless_gap = dpi(5)
THEME.border_width = dpi(3)
THEME.border_normal = "#3F3F3F"
THEME.border_focus = { "#DCA3A3", "#EC93D3", "#93E0E3", "#60B48A", "#F0DFAF"}
THEME.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
THEME.titlebar_bg_focus = "#3F3F3F"
THEME.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
THEME.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}
THEME.tasklist_fg_focus = THEME.border_focus[5]

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{ Icons
-- {{{ Taglist
-- Generate taglist squares:
THEME.taglist_squares_sel = ZEN_PATH .. "taglist/squarefz.png"
THEME.taglist_squares_unsel = ZEN_PATH .. "taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
THEME.menu_height = dpi(15)
THEME.menu_width = dpi(100)
-- }}}

-- {{{ Misc
THEME.awesome_icon = ZEN_PATH .. "awesome-icon.png"
THEME.menu_submenu_icon = THEMES_PATH .. "default/submenu.png"
-- }}}
