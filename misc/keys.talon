go <user.arrow_keys>: key(arrow_keys)
<user.letter>: key(letter)
(ship | uppercase) <user.letters> [(lowercase | sunk)]: 
    user.insert_formatted(letters, "ALL_CAPS")
<user.symbol_key>: key(symbol_key)
<user.function_key>: key(function_key)
<user.special_key>: key(special_key)
<user.modifiers> <user.unmodified_key>: key("{modifiers}-{unmodified_key}")
<user.modifiers> hold: key("{modifiers}:down")
<user.modifiers> release: key("{modifiers}:up")

face(pucker_lips_outwards):
    user.start_scroll()
face(pucker_lips_outwards:end):
    user.start_scroll()
# smile
# open_mouth
# stick_out_tongue
# raise_eyebrows
# 
# scrunch_nose
# pucker_lips_outwards
# pucker_lips_left
# pucker_lips_right
