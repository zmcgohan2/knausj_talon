tag: user.multiple_cursors
-
cursor multiple: user.multi_cursor_enable()
cursor stop: user.multi_cursor_disable()
cursor up [<number_small>]: 
    number = number_small or 1
    user.multi_cursor_add_above()
    repeat(number - 1)
cursor down [<number_small>]: 
    number = number_small or 1
    user.multi_cursor_add_below()
    repeat(number - 1)
cursor less [<number_small>]: 
    number = number_small or 1
    user.multi_cursor_select_fewer_occurrences()
    repeat(number - 1)
cursor more [<number_small>]: 
    number = number_small or 1
    user.multi_cursor_select_more_occurrences()
    repeat(number - 1)
cursor skip: user.multi_cursor_skip_occurrence()
cursor all: user.multi_cursor_select_all_occurrences()
cursor lines: user.multi_cursor_add_to_line_ends()
