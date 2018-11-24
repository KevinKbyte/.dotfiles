import i3ipc
from sys import argv

i3 = i3ipc.Connection()

possible_directions = ["left-to-right", "right-to-left"]
direction = possible_directions[int(argv[1])]

def jump_by_class(i3, direction):
    tree = i3.get_tree()
    focused = tree.find_focused()
    instances = tree.find_classed(focused.window_class)
    if direction == possible_directions[1]:
        instances.reverse()
    i_x = ( instances.index(focused) + 1 ) % len(instances)
    instances[i_x].command('focus')

jump_by_class(i3, direction)
exit(0)
