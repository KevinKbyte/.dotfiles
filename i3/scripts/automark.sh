#!/usr/bin/env python3
# https://i3ipc-python.readthedocs.io/en/latest/
import i3ipc

title = {'c':'New Tab - Chromium'}
possible_marks = {'Chromium-browser','Gnome-terminal','qutebrowser', 'Evince'}

def mark_when_new_browser_window(self, event):
# marks the first container that is opened with their class_name, if it is listed in possible_marks
    con = event.container
    if con.name == title['c']:
        if not i3.get_tree().find_marked("chrom_p"):
            con.command('mark {}'.format("chrom_p"))
        return
    if not i3.get_tree().find_marked(str(con.window_class)) and str(con.window_class) in possible_marks:
        con.command('mark {}'.format(con.window_class))

i3 = i3ipc.Connection()
i3.on('window::new', mark_when_new_browser_window)
i3.main()
