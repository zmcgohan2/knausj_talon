app: safari
-
tag(): browser
tag(): user.tabs
#action(browser.address):

action(browser.bookmark):
	key(cmd-d)

#action(browser.bookmark_tabs):
	
action(browser.bookmarks):
	key(cmd-alt-b)
  
action(browser.bookmarks_bar):
	key(cmd-shift-b)

action(browser.focus_address): 
	key(cmd-l)
	
action(browser.focus_page):
	key(escape:2)

action(browser.focus_search):
	browser.focus_address()

action(browser.go_blank):
	key(cmd-n)
	
action(browser.go_back):
	key(cmd-left)

action(browser.go_forward):
	key(cmd-right)
	
action(browser.go_home):
	key(cmd-shift-h)

action(browser.open_private_window):
	key(cmd-shift-n)

action(browser.reload):
	key(cmd-r)

action(browser.reload_hard):
	key(cmd-shift-r)

#action(browser.reload_hardest):
	
#action(browser.show_clear_cache):
  
action(browser.show_downloads):
	key(cmd-shift-j)

#action(browser.show_extensions):

action(browser.show_history):
	key(cmd-y)
	
action(browser.submit_form):
	key(enter)

#action(browser.title):

action(browser.toggle_dev_tools):
	key(cmd-alt-i)

action(app.tab_previous):
	key(cmd-shift-[)

action(app.tab_next):
	key(cmd-shift-])

action(app.tab_close):
	key(cmd-w)

action(app.tab_reopen):
	key(cmd-shift-t)

action(user.tab_overview):
	key(cmd-shift-\)
