(local gears (require :gears))
(local awful (require :awful))
(local _M {})
(local modkey _G.RC.vars.modkey)
(local move_step 10)
(fn _M.get []
  (let [clientkeys (gears.table.join (awful.key [modkey] :f
               (fn [c]
                 (set c.fullscreen
                      (not c.fullscreen))
                 (c:raise))
               {:description "toggle fullscreen"
                :group :client})
    (awful.key [modkey :Shift] :c
               (fn [c] (c:kill))
               {:description :close
                :group :client})
    (awful.key [modkey :Control] :space
               awful.client.floating.toggle
               {:description "toggle floating"
                :group :client})
    (awful.key [modkey :Control] :Return
               (fn [c]
                 (c:swap (awful.client.getmaster)))
               {:description "move to master"
                :group :client})
    (awful.key [modkey] :o
               (fn [c] (c:move_to_screen))
               {:description "move to screen"
                :group :client})
    (awful.key [modkey] :t
               (fn [c]
                 (set c.ontop (not c.ontop)))
               {:description "toggle keep on top"
                :group :client})
    (awful.key [modkey] :c
               (fn [c]
                 (awful.placement.centered c
                                           {:honor_workarea true}))
               {:description "center client"
                :group :client})
    (awful.key [modkey] :m
               (fn [c]
                 (set c.maximized
                      (not c.maximized))
                 (c:raise))
               {:description "(un)maximize"
                :group :client})
    (awful.key [modkey :Control] :m
               (fn [c]
                 (set c.maximized_vertical
                      (not c.maximized_vertical))
                 (c:raise))
               {:description "(un)maximize vertically"
                :group :client})
    (awful.key [modkey :Shift] :m
               (fn [c]
                 (set c.maximized_horizontal
                      (not c.maximized_horizontal))
                 (c:raise))
               {:description "(un)maximize horizontally"
                :group :client})
    (awful.key [modkey] "="
               (fn [c]
                 (c:relative_move nil nil
                                  move_step nil))
               {:description "Increase width"
                :group :client})
    (awful.key [modkey :Shift] "="
               (fn [c]
                 (c:relative_move nil nil nil
                                  move_step))
               {:description "Increase height"
                :group :client})
    (awful.key [modkey] "-"
               (fn [c]
                 (c:relative_move nil nil
                                  (* move_step
                                     (- 1))
                                  nil))
               {:description "Decrease width"
                :group :client})
    (awful.key [modkey :Shift] "-"
               (fn [c]
                 (c:relative_move nil nil nil
                                  (* move_step
                                     (- 1))))
               {:description "Decrease  height"
                :group :client})
    (awful.key [modkey :Control :Shift] :k
               (fn [c]
                 (c:relative_move nil
                                  (* move_step
                                     (- 1))
                                  nil nil))
               {:description "Move client upwards"
                :group :client})
    (awful.key [modkey :Control :Shift] :j
               (fn [c]
                 (c:relative_move nil
                                  move_step nil
                                  nil))
               {:description "Move client downwards"
                :group :client})
    (awful.key [modkey :Control :Shift] :h
               (fn [c]
                 (c:relative_move (* move_step
                                     (- 1))
                                  nil nil nil))
               {:description "Move client left"
                :group :client})
    (awful.key [modkey :Control :Shift] :l
               (fn [c]
                 (c:relative_move move_step
                                  nil nil nil))
               {:description "Move client right"
                :group :client})
    (awful.key [modkey] :b
               (fn [c]
                 (awful.placement.stretch c
                                          [:left
                                           :right
                                           :up
                                           :down]))
               {:description "stretch client"
                :group :client})
    (awful.key [modkey :Shift] :t
               (fn [c]
               (set c.sticky (not c.sticky)))
               {:description "Set sticky"
                :group :client})
    (awful.key [modkey :Shift] :f
               (fn [c]
               (set c.floating (not c.floating))
               (c:raise))
               {:description "Set floating"
                :group :client}))
                ]

    clientkeys))
(setmetatable {} {:__call (fn [_ ...] (_M.get ...))})
