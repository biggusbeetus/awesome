(local naughty (require :naughty))
(when awesome.startup_errors
  (naughty.notify {:preset naughty.config.presets.critical
                   :text awesome.startup_errors
                   :title "Oops, there were errors during startup!"}))
(do
  (var in-error false)
  (awesome.connect_signal "debug::error"
                          (fn [err]
                            (when in-error (lua "return "))
                            (set in-error true)
                            (naughty.notify {:preset naughty.config.presets.critical
                                             :text (tostring err)
                                             :title "Oops, an error happened!"})
                            (set in-error false))))
