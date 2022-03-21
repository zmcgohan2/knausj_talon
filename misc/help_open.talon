mode: user.help
-
help next$: user.help_next()
help (previous | last)$: user.help_previous()
help <number>$: user.help_select_index(number - 1)
help (return | back)$: user.help_return()
help (refresh | fresh)$: user.help_refresh()
(help close | kelp)$: user.help_hide()
