talon copy context pie: user.talon_add_context_clipboard_python()
talon copy context: user.talon_add_context_clipboard()
talon copy modes: clip.set_text(user.talon_get_scope('mode'))
talon copy tags: clip.set_text(user.talon_get_scope('tag'))
talon copy title:
    title = win.title()
    clip.set_text(title)
talon dump context: 
    name = app.name()
    executable =  app.executable()
    bundle = app.bundle()
    title = win.title()
    print("Name: {name}")
    print("Executable: {executable}")
    print("Bundle: {bundle}")
    print("Title: {title}")

talon relaunch: user.talon_relaunch()