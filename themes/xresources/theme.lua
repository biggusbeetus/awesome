-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local util = require("awful.util")

THEMES_PATH = util.getdir("config") .. "/themes/"
XRESOURCES_PATH = THEMES_PATH .. "xresources/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

THEME = {}

dofile(XRESOURCES_PATH .. "elements.lua")
dofile(XRESOURCES_PATH .. "titlebar.lua")
dofile(XRESOURCES_PATH .. "layouts.lua")

-- {{{ Main
THEME.wallpaper = RC.vars.wallpaper
-- }}}

return THEME

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
