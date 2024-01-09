-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}

require("deco.wallpaper")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB = {}

WB_PACKAGE = WB -- global object name

-- default statusbar
require("statusbar.top")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Main
function _M.init()
  awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)

    WB.generate_top_wibox(s)
  end)

end
-- }}}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.init(...) end })
