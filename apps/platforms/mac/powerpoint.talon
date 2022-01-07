os: mac
and app.bundle: com.microsoft.Powerpoint
-

# dictation mode gets confused when typing too fast
settings():
	key_wait = 3

presenter view: key(esc alt-enter)