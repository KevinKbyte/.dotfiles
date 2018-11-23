#!/usr/bin/python3
import i3ipc
import sys
from subprocess import Popen, PIPE

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()
mark = sys.argv[1]

def focus(i3, mark):
    tree = i3.get_tree()

    # If has no mark or empty workspace, then don't do anything
    try:
        focused_mark = tree.find_focused().marks[0]
    except IndexError: # When there are no marks
        # If error (e.g. if in an empty workspace, or no marks), then set mark
        i3.command('mark ' + mark)
        return

    process = Popen(['/home/kev/.dotfiles/i3/scripts/jumpmarks_or_scratchpad.sh', mark], stdout=PIPE, stderr=PIPE)
    process.wait() # Wait for process to complete.

focus(i3, mark)
exit(0)
