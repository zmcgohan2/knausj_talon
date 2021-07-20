talon copy context pie: user.talon_add_context_clipboard_python()
talon copy context: user.talon_add_context_clipboard()
talon copy name:
    name = app.name()
    clip.set_text(name)  
talon copy executable:
    executable = app.executable()
    clip.set_text(executable)
talon copy bundle:
    bundle = app.bundle()
    clip.set_text(bundle)
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
