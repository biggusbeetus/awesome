local home = os.getenv("HOME")

local _M = {
  -- This is used later as the default terminal and editor to run.
  terminal = "wezterm",
  -- Default modkey.
  modkey = "Mod4",
  editor = os.getenv("EDITOR") or "editor",
  -- user defined wallpaper
  wallpaper = home .. "/wallpapers/space_wallpaper.png",
}

return _M
