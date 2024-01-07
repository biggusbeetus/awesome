(local awful (require :awful))
(local _M {})
(fn _M.get []
  (let [layouts [awful.layout.suit.floating
                 awful.layout.suit.tile
                 awful.layout.suit.tile.left
                 awful.layout.suit.tile.bottom
                 awful.layout.suit.tile.top
                 awful.layout.suit.fair
                 awful.layout.suit.fair.horizontal
                 awful.layout.suit.spiral
                 awful.layout.suit.spiral.dwindle
                 awful.layout.suit.max
                 awful.layout.suit.max.fullscreen
                 awful.layout.suit.magnifier
                 awful.layout.suit.corner.nw]]
    layouts))
(setmetatable {} {:__call (fn [_ ...] (_M.get ...))})
