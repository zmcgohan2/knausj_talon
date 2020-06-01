not mode: sleep
-
talon sleep$: speech.disable()
dragon mode$: speech.disable()
sleep all$: 
	user.history_disable()
	user.homophones_hide()
	user.help_hide()
	user.mouse_sleep()
	speech.disable()
	user.engine_sleep()
voice sleep$: speech.disable()
