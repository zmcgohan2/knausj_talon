from talon import Context, actions
ctx = Context()
ctx.matches = r"""
mode: user.sql
mode: user.auto_lang
and code.language: sql
"""

@ctx.action_class('user')
class UserActions:
    def code_operator_equal(): actions.auto_insert(' = ')
    def code_operator_not_equal(): actions.auto_insert(' <> ')
    def code_operator_greater_than(): actions.auto_insert(' > ')
    def code_operator_greater_than_or_equal_to(): actions.auto_insert(' >= ')
    def code_operator_less_than(): actions.auto_insert(' < ')
    def code_operator_less_than_or_equal_to(): actions.auto_insert(' <= ')
    
    def code_operator_and(): actions.auto_insert('AND ')
    def code_operator_or(): actions.auto_insert('OR ')
    
    def code_comment(): actions.auto_insert('-- ')
    def code_block_comment():
        actions.insert('/*')
        actions.key('enter')
        actions.key('enter')
        actions.insert('*/')
        actions.edit.up()
