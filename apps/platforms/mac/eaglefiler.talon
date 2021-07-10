os: mac
and app.bundle: com.c-command.EagleFiler
-

record first: user.eaglefiler_select_first_displayed_record()

# triggers https://github.com/nriley/scan/blob/master/update_dates_in_place.py
update: key(ctrl-u)
