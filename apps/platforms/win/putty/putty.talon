app: putty_lookitt
app: citrix_viewer
-
# Chronicles
exit: key(shift-f7)
previous: key(pageup)
next: key(pagedown)
chronicles item: key(home f9 i enter)
chronicles screen: key(home f9 s enter)
chronicles restore: key(f3)
item delete: key(f1)
item clear: key(f2)
item insert: key(shift-f6 ctrl-f2 d return k return down:2 right i return)
item help: key(shift-f5)
item info: key(home f7)

# Lookitt
routine do: insert("d ^")
routine save: insert("d ^%ZeRSAVE")
routine load: insert("d ^%ZeRLOAD")
routine find: insert("d ^%ZRFIND")
clinical admin: insert(";l")
^edit <user.ini>$:
	key(f1)
	insert("e {ini}")
	key(enter enter)
	insert("1;1")
	key(enter)
