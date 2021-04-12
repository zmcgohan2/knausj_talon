from talon import ui, Module, actions, cron, speech_system, app

job = None

mod = Module()
sleep_delay = mod.setting(
    "sleep_delay",
    type=int,
    default=5,
    desc="if nothing is spoken, will sleep in this number of minutes",
)


def on_phrase(j):
    global job
    if j.get("phrase"):
        cron.cancel(job)
        job = cron.after(f"{sleep_delay.get()}m", actions.speech.disable)


speech_system.register("post:phrase", on_phrase)


def on_ready():
    global job
    if actions.speech.enabled():
        job = cron.after(f"{sleep_delay.get()}m", actions.speech.disable)


app.register("ready", on_ready)


ui.register("screen_sleep", lambda e: actions.speech.disable())

