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
^routine do$:
	key(f1)
	insert("d ^")

^routine save$:
	key(f1)
	insert("d ^%ZeRSAVE")
	key(enter)

^routine load$:
	key(f1)
	insert("d ^%ZeRLOAD")
	key(enter)

^routine find$:
	key(f1)
	insert("d ^%ZRFIND")
	key(enter)

^clinical admin$:
	key(f1)
	insert(";l")
	key(enter)

^chronicles edit <user.ini>$:
	key(f1)
	insert("e {ini}")
	key(enter enter)
	insert("1;1")
	key(enter)

^clarity item <user.ini> <number>$:
	key(f1)
	insert(";cri {ini} {number}")
	key(enter)

^category <user.ini> <number>$:
	key(f1)
	insert(";cat {ini} {number}")
	key(enter)
