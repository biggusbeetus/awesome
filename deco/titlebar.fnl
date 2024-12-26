(local awful (require :awful))
(local wibox (require :wibox))
(local height 0)
(_G.client.connect_signal "request::titlebars"
                       (fn [c]
                         (let [top_bar (awful.titlebar c {:size height})]
                            (: top_bar :setup
                            {1 {1 nil
                                2 nil
                                3 {1 (awful.titlebar.widget.floatingbutton c)
                                   2 (awful.titlebar.widget.maximizedbutton c)
                                   3 (awful.titlebar.widget.stickybutton c)
                                   4 (awful.titlebar.widget.ontopbutton c)
                                   5 (awful.titlebar.widget.closebutton c)
                                   :layout (wibox.layout.fixed.horizontal)}
                                :layout wibox.layout.align.horizontal}
                             :layout wibox.layout.stack})
                            )
                         ))
