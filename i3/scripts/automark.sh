#!/usr/bin/env python3
# https://i3ipc-python.readthedocs.io/en/latest/
import i3ipc

# title = {'c':'New Tab - Chromium'}
title = {'c':'New Tab - Google Chrome'}

# possible_marks = {'Chromium-browser','Gnome-terminal','qutebrowser', 'Evince', 'Pqiv'}
possible_marks = {'Google-chrome','Gnome-terminal','qutebrowser', 'Evince', 'Pqiv'}
extra_marks = [ 'u', 'i', 'o' ]

def mark_when_new_browser_window(self, event):
# marks the first container that is opened with their class_name, if it is listed in possible_marks
    con = event.container
    if con.name == title['c']:
        if not i3.get_tree().find_marked("chrom_p"):
            con.command('mark {}'.format("chrom_p"))
            return
    # If none is yet marked with the current window's class, and the class is
    # one of the possible marks, mark it
    if not i3.get_tree().find_marked(str(con.window_class)):
        # con.command('mark {}'.format(con.window_class))
        if str(con.window_class) in possible_marks:
            con.command('mark {}'.format(str(con.window_class)))
            # con.command('mark {}'.format(con.window_class))
            return

    for curr_mark in extra_marks:
        if not i3.get_tree().find_marked('^' + curr_mark + '$'):
            con.command('mark {}'.format(curr_mark))
            return
    return

i3 = i3ipc.Connection()
i3.on('window::new', mark_when_new_browser_window)
i3.main()
