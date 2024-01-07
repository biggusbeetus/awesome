-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local util = require("awful.util")

THEMES_PATH = util.getdir("config") .. "/themes/"
ZEN_PATH = THEMES_PATH .. "zenburn/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

THEME = {}

dofile(ZEN_PATH .. "elements.lua")
dofile(ZEN_PATH .. "titlebar.lua")
dofile(ZEN_PATH .. "layouts.lua")

-- {{{ Main
THEME.wallpaper = RC.vars.wallpaper
-- }}}

return THEME

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
