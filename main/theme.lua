-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local home = os.getenv("HOME")

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(home .. "/.config/awesome/themes/xresources/theme.lua")

if (RC.vars.wallpaper) then
    local wallpaper = RC.vars.wallpaper
    if awful.util.file_readable(wallpaper) then THEME.wallpaper = wallpaper end
end
