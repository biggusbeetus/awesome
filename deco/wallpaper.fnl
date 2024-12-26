(local gears (require :gears))
(local beautiful (require :beautiful))
(fn _G.set-wallpaper [s]
  (when beautiful.wallpaper
    (var wallpaper beautiful.wallpaper)
    (when (= (type wallpaper) :function) (set wallpaper (wallpaper s)))
    (gears.wallpaper.maximized wallpaper s true)))
(_G.screen.connect_signal "property::geometry" _G.set-wallpaper)
