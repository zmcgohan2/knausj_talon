from talon import Context, Module, actions, app

ctx = Context()
mod = Module()

key = actions.key
extension_lang_map = {
    ".asm": "assembly",
    ".bat": "batch",
    ".c": "c",
    ".cmake": "cmake",
    ".cpp": "cplusplus",
    ".cs": "csharp",
    ".gdb": "gdb",
    ".go": "go",
    ".h": "c",
    ".hpp": "cplusplus",
    ".java": "java",
    ".js": "javascript",
    ".jsx": "javascript",
    ".json": "json",
    ".lua": "lua",
    ".md": "markdown",
    ".pl": "perl",
    ".ps1": "powershell",
    ".py": "python",
    ".r": "r",
    ".rb": "ruby",
    ".s": "assembly",
    ".sh": "bash",
    ".snippets": "snippets",
    ".talon": "talon",
    ".ts": "typescript",
    ".tsx": "typescript",
    ".tf": "terraform",
    ".vba": "vba",
    ".vim": "vimscript",
    ".vimrc": "vimscript",
}

@ctx.action_class("code")
class code_actions:
    def language():
        result = ""
        file_extension = actions.win.file_ext()
        if file_extension and file_extension in extension_lang_map:
            result = extension_lang_map[file_extension]

        # print("code.language: " + result)
        return result

# create a context for each defined language
for lang in extension_lang_map.values():
    mod.tag(lang)
    mod.tag(f"{lang}_forced")
    c = Context()
    # Context is active if language is forced or auto language matches
    c.matches = f"""
    tag: user.{lang}_forced
    tag: user.auto_lang
    and code.language: {lang}
    """
    c.tags = [f"user.{lang}"]

# Create a tag for the automated language detection. This is active when no lang is forced.
mod.tag("auto_lang")
ctx.tags = ["user.auto_lang"]

# Auto lang is enabled by default
app.register("ready", lambda: actions.user.code_clear_language_mode())

@mod.action_class
class Actions:
    def code_set_language_mode(language: str):
        """Sets the active language mode, and disables extension matching"""
        ctx.tags = [f"user.{language}_forced"]
        actions.user.notify(f"Enabled {language} mode")

    def code_clear_language_mode():
        """Clears the active language mode, and re-enables code.language: extension matching"""
        ctx.tags = ["user.auto_lang"]
