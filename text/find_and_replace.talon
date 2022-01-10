tag: user.find_and_replace
-
scan this: user.find("")
scan this <user.text>: user.find(text)
scan take:
    text = edit.selected_text()
    user.find(texti)
scan all: user.find_everywhere("")
scan all <user.text>: user.find_everywhere(text)
scan all take: 
    text = edit.selected_text()
    user.find_everywhere(text)
scan case : user.find_toggle_match_by_case()
scan word : user.find_toggle_match_by_word()
scan expression : user.find_toggle_match_by_regex()
scan next: user.find_next()
scan last: user.find_previous()
replace this [<user.text>]: user.replace(text or "")
replace all: user.replace_everywhere("")
replace <user.text> all: user.replace_everywhere(text)
replace confirm that: user.replace_confirm()
replace confirm all: user.replace_confirm_all()

#quick replace commands, modeled after jetbrains
wipe last <user.text> [over]: 
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.delete()
wipe next <user.text> [over]: 
    user.select_next_occurrence(text)
    sleep(100ms)
    edit.delete()
wipe last clip: 
    user.select_previous_occurrence(clip.text())
    edit.delete()
wipe next clip: 
    user.select_next_occurrence(clip.text())
    sleep(100ms)
    edit.delete()
note last <user.text> [over]: 
    user.select_previous_occurrence(text)
    sleep(100ms)
    code.toggle_comment()
note last clip: 
    user.select_previous_occurrence(clip.text())
    sleep(100ms)
    code.toggle_comment()
note next <user.text> [over]: 
    user.select_next_occurrence(text)
    sleep(100ms)
    code.toggle_comment()
note next clip: 
    user.select_next_occurrence(clip.text())
    sleep(100ms)
    code.toggle_comment()
go last <user.text> [over]: 
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.right()
go last clip: 
    user.select_previous_occurrence(clip.text())
    sleep(100ms)
    edit.right()
go next <user.text> [over]: 
    user.select_next_occurrence(text)
    edit.right()
go next clip: 
    user.select_next_occurrence(clip.text())
    edit.right()
paste last <user.text> [over]: 
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.right()
    edit.paste()
paste next <user.text> [over]: 
    user.select_next_occurrence(text)
    sleep(100ms)
    edit.right()
    edit.paste()
replace last <user.text> [over]: 
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.paste()
replace next <user.text> [over]:
    user.select_next_occurrence(text)
    sleep(100ms)
    edit.paste()
take last <user.text> [over]: user.select_previous_occurrence(text)
take next <user.text> [over]: user.select_next_occurrence(text)
take last clip: user.select_previous_occurrence(clip.text())
take next clip: user.select_next_occurrence(clip.text())



