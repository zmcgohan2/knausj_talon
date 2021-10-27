app: windows_explorer
app: windows_file_browser
-
tag(): user.file_manager
^go <user.letter>$: user.file_manager_open_volume("{letter}:")
go app data: user.file_manager_open_directory("%AppData%")
go program files: user.file_manager_open_directory("%programfiles%")
go app folder: user.file_manager_open_directory("shell:AppsFolder")
go cursor less config: user.file_manager_open_directory("%AppData%/Talon/user/cursorless-settings")
go startup: user.file_manager_open_directory("shell:startup")
go common startup: user.file_manager_open_directory("shell:common startup")