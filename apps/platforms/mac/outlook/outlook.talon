app.bundle: com.microsoft.Outlook
-
archive: user.outlook_archive()
delete: key(cmd-backspace)
flag: key(ctrl-5)
unflag: user.outlook_unflag()
junk: key(cmd-shift-j)

send [this] message: key(cmd-enter)

move:
	key(cmd-shift-m)

(save to | move to) [<user.text>]:
	key(cmd-shift-m)
	insert(user.text or "")

reply: key(cmd-r)
reply all: key(cmd-shift-r)

go [to] inbox: user.outlook_set_selected_folder('inbox')
go to drafts: user.outlook_set_selected_folder('drafts')
go to sent: user.outlook_set_selected_folder('sent items')

hunt all: key(cmd-shift-f)