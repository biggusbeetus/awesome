(local home (os.getenv :HOME))
(local _M {:editor (or (os.getenv :EDITOR) :editor)
           :modkey :Mod4
           :terminal :wezterm
           :keyboard :us
           :wallpaper (.. home :/wallpapers/space_wallpaper.png)})
_M
