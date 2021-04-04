tag: browser
-
(address bar | go address | go url): browser.focus_address()
copy address: 
  browser.focus_address()
  sleep(50ms)
  edit.copy()
go home: browser.go_home()
[go] forward: browser.go_forward()
go (back | backward): browser.go_back()

go private: browser.open_private_window()

bookmark show: browser.bookmarks()
bookmark bar: browser.bookmarks_bar()
bookmark it: browser.bookmark()
bookmark tabs: browser.bookmark_tabs()

(refresh | reload) it: browser.reload()
(refresh | reload) it hard: browser.reload_hard()

show downloads: browser.show_downloads()
show extensions: browser.show_extensions()
show history: browser.show_history()
show cache: browser.show_clear_cache()

dev tools: browser.toggle_dev_tools()
go Gmail:
  browser.go("Gmail.com")
go get hub:
  browser.go("github.com")
go Google:
  browser.go("Google.com")
go NPR:
  browser.go("npr.com")
go Amazon:
  browser.go("Amazon.com")
go bulwark:
  browser.go("https://thebulwark.com/")
go supreme:
  browser.go("https://www.scotusblog.com/")
go public:
  browser.go("https://www.propublica.org/")
go mint:
  browser.go("mint.com")
go fidelity:
  browser.go("fidelity.com")
go bank:
  browser.go("usbank.com")
go Netflix:
  browser.go("Netflix.com")  
go Hulu:
  browser.go("Hulu.com")
go Disney:
  browser.go("https://www.disneyplus.com")
go LinkedIn:
  browser.go("https://www.LinkedIn.com")
go patron:
  browser.go("https://www.patreon.com")
go meet up:
  browser.go("https://www.Meetup.com")
go you tube: 
  browser.go("https://www.youtube.com")
go apple:
  browser.go("https://www.apple.com")
#todo - port to apps
# navigating current page
# help: key(?)
# scroll tiny down: key(j)
# scroll tiny up: key(k)
# scroll left: key(h)
# scroll right: key(l)
# scroll (pop | spring): key(z H)
# scroll push: key(z L)
# scroll top: key(gg)
# scroll (bottom | end): key(G)
# (scroll half down | mini page): key(d)
# scroll half up: key(u)
# [open] link: key(f)
# [open] link new: key(F)
# copy link: key(y f)
# copy (address | url): key(escape y y)
# (refresh | reload): browser.reload()
# view source: key(g s)
# insert mode: key(i)
# next frame: key(g f)
# main frame: key(g F)
    # navigating to new pages
# (open | go) (url | history): key(o)
# (open | go) (url | history) new: key(O)
# (open | go) bookmark: key(b)
# (open | go) bookmark new: key(B)
    # using find
# find mode: key(/)
# next match: key(n)
# previous match: key(N)
    # navigating history
# history back: key(H)
# history forward: key(L)
    # manipulating tabs
# last visited: key(^)
# dupe tab: key(y t)
# restore: key(X)
# search tabs: key(T)
# move to window: key(W)