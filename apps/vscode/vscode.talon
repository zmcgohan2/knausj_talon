#custom vscode commands go here
app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.snippets
tag(): user.splits
tag(): user.tabs
#talon app actions
action(app.tab_close): user.vscode_http("workbench.action.closeActiveEditor")
action(app.tab_next): user.vscode_http("workbench.action.nextEditorInGroup")
action(app.tab_previous): user.vscode_http("workbench.action.previousEditorInGroup")
action(app.tab_reopen): user.vscode_http("workbench.action.reopenClosedEditor")
action(app.window_close): user.vscode_http("workbench.action.closeWindow")
action(app.window_open): user.vscode_http("workbench.action.newWindow")

#talon code actions
action(code.toggle_comment): user.vscode_http("editor.action.commentLine")

#talon edit actions
action(edit.indent_more): user.vscode_http("editor.action.indentLines")
action(edit.indent_less): user.vscode_http("editor.action.outdentLines")
action(edit.save_all): user.vscode_http("workbench.action.files.saveAll")

# splits.py support begin
action(user.split_clear_all):
	user.vscode_http("workbench.action.editorLayoutSingle")
action(user.split_clear):
	user.vscode_http("workbench.action.joinTwoGroups")
action(user.split_flip):
	user.vscode_http("workbench.action.toggleEditorGroupLayout") 
action(user.split_last):
	user.vscode_http("workbench.action.focusLeftGroup")
action(user.split_next): 
	user.vscode_http("workbench.action.focusRightGroup")
action(user.split_window_down):
	user.vscode_http("workbench.action.moveEditorToBelowGroup")
action(user.split_window_horizontally):
	user.vscode_http("workbench.action.splitEditorOrthogonal")
action(user.split_window_left):
	user.vscode_http("workbench.action.moveEditorToLeftGroup")
action(user.split_window_right):
	user.vscode_http("workbench.action.moveEditorToRightGroup")
action(user.split_window_up):
	user.vscode_http("workbench.action.moveEditorToAboveGroup")
action(user.split_window_vertically):
	user.vscode_http("workbench.action.splitEditor")
action(user.split_window):
	user.vscode_http("workbench.action.splitEditor")
# splits.py support end

#multiple_cursor.py support begin
#note: vscode has no explicit mode for multiple cursors
action(user.multi_cursor_add_above):
	user.vscode_http("editor.action.insertCursorAbove")
action(user.multi_cursor_add_below):
	user.vscode_http("editor.action.insertCursorBelow")
action(user.multi_cursor_add_to_line_ends):
	user.vscode_http("editor.action.insertCursorAtEndOfEachLineSelected")
action(user.multi_cursor_disable):
	key(escape)
action(user.multi_cursor_enable):
	skip()
action(user.multi_cursor_select_all_occurrences):
	user.vscode_http("editor.action.selectHighlights")
action(user.multi_cursor_select_fewer_occurrences):
	user.vscode_http("cursorUndo")
action(user.multi_cursor_select_more_occurrences):
	user.vscode_http("editor.action.addSelectionToNextFindMatch")
#multiple_cursor.py support end
select to: key(alt-shift-/)
select to <user.any_alphanumeric_key>: key(alt-shift-/ any_alphanumeric_key)
jump after: key(alt-.)
jump after <user.any_alphanumeric_key>: key(alt-. any_alphanumeric_key)
jump before: key(alt-,)
jump before <user.any_alphanumeric_key>: key(alt-, any_alphanumeric_key)
please do [<user.text>]: 
  user.vscode_http("workbench.action.showCommands")
  insert(user.text or "")

# Sidebar
bar explore: user.vscode_http("workbench.view.explorer")
bar extensions: user.vscode_http("workbench.view.extensions")
bar outline: user.vscode_http("outline.focus")
bar run: user.vscode_http("workbench.view.debug")
bar search: user.vscode_http("workbench.view.search")
bar source: user.vscode_http("workbench.view.scm")
bar switch: user.vscode_http("workbench.action.toggleSidebarVisibility")

# Panels
panel control: user.vscode_http("workbench.panel.repl.view.focus")
panel output: user.vscode_http("workbench.panel.output.focus")
panel problems: user.vscode_http("workbench.panel.markers.view.focus")
panel switch: user.vscode_http("workbench.action.togglePanel")
panel terminal: user.vscode_http("workbench.panel.terminal.focus")

# Settings
show settings: user.vscode_http("workbench.action.openGlobalSettings")
show shortcuts: user.vscode_http("workbench.action.openGlobalKeybindings")
show snippets: user.vscode_http("workbench.action.openSnippets")

# Display
centered switch: user.vscode_http("workbench.action.toggleCenteredLayout")
fullscreen switch: user.vscode_http("workbench.action.toggleFullScreen")
theme switch: user.vscode_http("workbench.action.selectTheme")
wrap switch: user.vscode_http("editor.action.toggleWordWrap")
zen switch: user.vscode_http("workbench.action.toggleZenMode")

# File Commands
file hunt [<user.text>]: 
  user.vscode_http("workbench.action.quickOpen")
  sleep(50ms)
  insert(text or "")
file copy path: user.vscode_ignore_clipboard("File: Copy Path of Active File") 
file create sibling: user.vscode_http("File: New File")  
file create: user.vscode_http("File: New Untitled File")
file open folder: user.vscode_http("File: Reveal in File Explorer")
#todo: rename isn't working.
#file rename active: 
#  user.vscode_http("File: Reveal Active File In Side Bar")
#  user.vscode_http("renameFile")
#file rename: user.vscode_http("renameFile")
file reveal: user.vscode_http("File: Reveal Active File In Side Bar") 

# Language Features
suggest show: user.vscode_http("editor.action.triggerSuggest")
hint show: user.vscode_http("editor.action.triggerParameterHints")
definition show: user.vscode_http("editor.action.revealDefinition")
definition peek: user.vscode_http("editor.action.peekDefinition")
definition side: user.vscode_http("editor.action.revealDefinitionAside")
references show: user.vscode_http("editor.action.goToReferences")
references find: user.vscode_http("references-view.find")
format that: user.vscode_http("editor.action.formatDocument")
format selection: user.vscode_http("editor.action.formatSelection")
imports fix: user.vscode_http("Organize Imports")
problem next: user.vscode_http("editor.action.marker.nextInFiles")
problem last: user.vscode_http("editor.action.marker.prevInFiles")
problem fix: user.vscode_http("problems.action.showQuickFixes")
rename that: user.vscode_http("editor.action.rename")
refactor that: user.vscode_http("editor.action.refactor")
whitespace trim: user.vscode_http("editor.action.trimTrailingWhitespace")
language switch: user.vscode_http("workbench.action.editor.changeLanguageMode")
refactor rename: user.vscode_http("editor.action.rename")
refactor this: user.vscode_http("editor.action.refactor")

#code navigation
(go declaration | follow): user.vscode_http("Go to Declaration")
go back: user.vscode_http("workbench.action.navigateBack") 
go forward:  user.vscode_http("workbench.action.navigateForward")  
go implementation: user.vscode_http("Go to Implementation")
go recent: user.vscode_http("File: Open Recent")
go type: user.vscode_http("editor.action.goToTypeDefinition")
go usage: user.vscode_http("References: Find All References")

# Bookmarks. Requires Bookmarks plugin
go marks: user.vscode_http("View: Show Bookmarks")
toggle mark: user.vscode_http("Bookmarks: Toggle")
go next mark: user.vscode_http("Bookmarks: Jump to Next")
go last mark: user.vscode_http("Bookmarks: Jump to Previous")

# Folding
fold that: user.vscode_http("editor.fold")
unfold that: user.vscode_http("editor.unfold")
fold those: user.vscode_http("editor.foldAllMarkerRegions")
unfold those: user.vscode_http("editor.unfoldRecursively")
fold all: user.vscode_http("editor.foldAll")
unfold all: user.vscode_http("editor.unfoldAll")
fold comments: user.vscode_http("editor.foldAllBlockComments")

# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
git branch: user.vscode_http("git.branchFrom")
git branch this: user.vscode_http("git.branch")
git checkout: user.vscode_http("git.checkout")
git commit: user.vscode_http("git.commitStaged")
git commit undo: user.vscode_http("git.undoCommit")
git commit ammend: user.vscode_http("git.commitStagedAmend")
git diff: user.vscode_http("git.openChange")
git ignore: user.vscode_http("git.ignore")
git merge: user.vscode_http("git.merge")
git output: user.vscode_http("git.showOutput")
git pull: user.vscode_http("git.pullRebase")
git push: user.vscode_http("git.push")
git push focus: user.vscode_http("git.pushForce")
git rebase abort: user.vscode_http("git.rebaseAbort")
git reveal: user.vscode_http("git.revealInExplorer")
git revert: user.vscode_http("git.revertChange")
git stash: user.vscode_http("git.stash")
git stash pop: user.vscode_http("git.stashPop")
git stage: user.vscode_http("git.stage")
git stage all: user.vscode_http("git.stageAll")
git unstage: user.vscode_http("git.unstage")
git unstage all: user.vscode_http("git.unstageAll")

#Debugging
break point: user.vscode_http("editor.debug.action.toggleBreakpoint")
step over: user.vscode_http("workbench.action.debug.stepOver")
debug step into: user.vscode_http("workbench.action.debug.stepInto")
debug step out [of]: user.vscode_http("workbench.action.debug.stepOut")
debug start: user.vscode_http("workbench.action.debug.start")
debug pause: user.vscode_http("workbench.action.debug.pause")
debug stopper: user.vscode_http("workbench.action.debug.stop")
debug continue: user.vscode_http("workbench.action.debug.continue")
debug restart: user.vscode_http("workbench.action.debug.restart")

# Terminal
terminal external: user.vscode_http("workbench.action.terminal.openNativeConsole")
terminal new: user.vscode_http("workbench.action.terminal.new")
terminal next: user.vscode_http("workbench.action.terminal.focusNextPane")
terminal last:user.vscode_http("workbench.action.terminal.focusPreviousPane")
terminal split: user.vscode_http("workbench.action.terminal.split")
terminal trash: user.vscode_http("Terminal:Kill")
terminal scroll up: user.vscode_http("Terminal:ScrollUp")
terminal scroll down: user.vscode_http("Terminal:ScrollDown")

#TODO: should this be added to linecommands?
copy line down: user.vscode_http("editor.action.copyLinesDownAction")
copy line up: user.vscode_http("editor.action.copyLinesUpAction")

#Expand/Shrink AST Selection
select less: user.vscode_http("editor.action.smartSelect.shrink")
select (more|this): user.vscode_http("editor.action.smartSelect.expand")
  
  