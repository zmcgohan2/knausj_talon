os: windows
-
# not universal but common enough
app (exit | quit): key(alt-f x)
full screen: key(f11)
window minimize:
	key(alt-space)
	sleep(40ms)
	key(n)
window maximize:
	key(alt-space)
	sleep(40ms)
	key(x)
refresh: key(f5)