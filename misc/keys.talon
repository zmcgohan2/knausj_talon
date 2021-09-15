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
press <user.modifiers>: key(modifiers)
# a: "a"
# b: "b"
# c:"c"
# d:"d"
# e:"e"
# f: "f"
# g:"g"
# h:"h"
# i:"i"
# j:"j"
# k:"k"
# l:"l"
# m:"m"
# n:"n"
# o:"o"
# p:"p"
# q:'q'
# r:"r"
# s:"s"
# t:"t"
# u:'u'
# v:"v"
# w: "w"
# x:"x"
# y:'y'
# z:'z'
# smile
# open_mouth
# stick_out_tongue
# raise_eyebrows
# 
# scrunch_nose
# pucker_lips_outwards
# pucker_lips_left
# pucker_lips_right
