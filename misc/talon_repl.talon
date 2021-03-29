win.title:/repl/
-
^try <phrase>$: user.paste('speech_system._sim("{phrase}")')
^debug last$:
    phrase = user.history_get(1)
    user.paste('speech_system._sim("{phrase}")')
^debug number <number_small>$: 
    phrase = user.history_get(number_small)
    user.paste('speech_system._sim("{phrase})"')