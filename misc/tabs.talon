tag: user.tabs
-
tab new [<number_small>]:
    numb = number_small or 1
    app.tab_open()
    repeat(numb - 1)    
tab last [<number_small>]:
    numb = number_small or 1    
    app.tab_previous()
    repeat(numb - 1)    
tab next [<number_small>]: 
    numb = number_small or 1    
    app.tab_next()
    repeat(numb - 1)    
tab close [<number_small>]: 
    numb = number_small or 1    
    app.tab_close()
    repeat(numb - 1)    
tab reopen [<number_small>]: 
    numb = number_small or 1    
    app.tab_reopen()
    repeat(numb - 1)    
go tab <number>: user.tab_jump(number)
go tab final: user.tab_final()
tab dupe: user.tab_duplicate()
