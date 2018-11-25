from string import ascii_lowercase
from sys import argv
from os import system

if len(argv) == 6:
    global X_INCREMENTS, Y_INCREMENTS

    X_INCREMENTS = argv[1]
    Y_INCREMENTS = argv[2]
    OFFSET = argv[3]
    X_CHUNK_SIZE = argv[4]
    Y_CHUNK_SIZE = argv[5]
else:
    screen_size_filename = "/tmp/mouse-jump"
    system("xrandr  | grep \* | cut -d' ' -f4 > " + screen_size_filename)

    # screen size
    S_SIZE_FILE = open(screen_size_filename, "r")
    S_SIZE = str(S_SIZE_FILE.readline())

    X, Y = S_SIZE.split("x")
    X, Y = int(X), int(Y)

    # X Chunk Size = 10 * (# of key combinations)
    # # of key combinations:
        # Key
        # Mode_switch + Key

    X_KEY_COMBOS = 2
    # X_CHUNK_SIZE = 10 * X_KEY_COMBOS
    X_CHUNK_SIZE = 20

    # Y Chunk Size = 4 * (# of key combinations)
    # 4 is because 1-->0, q-->p, a-->;, z-->/ are four layers of y axis matrix
    # # of key combinations:
        # Key
        # Mod + key
        # Shift + key
        # Mod + Shift + key
    # Y Chunk Size = 4 * 3 = 16
    Y_KEY_COMBOS = 4
    # Y_CHUNK_SIZE = 4 * Y_KEY_COMBOS
    Y_CHUNK_SIZE = 16

    X_INCREMENTS = int(round(X / X_CHUNK_SIZE))
    Y_INCREMENTS = int(round(Y / Y_CHUNK_SIZE))

def jumper(x, y):
    """TODO: Docstring for function.
    :returns: TODO

    """
    X_OFFSET = X_INCREMENTS//2
    Y_OFFSET = Y_INCREMENTS//2

    jump_x = str(x * X_INCREMENTS + X_OFFSET)
    jump_y = str(y * Y_INCREMENTS + Y_OFFSET)
    return jump_x + " " + jump_y

NUMBERS = [[ str(x) for x in range(1, 10) ]] # x = 0 --> 9; y = 0 --> 2
NUMBERS[0] += ['0']
ALPHABET = [[ 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p' ]] # x = 0 --> 9; y = 3 --> 5
ALPHABET += [['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'semicolon' ]] # x = 0 --> 9; y = 6 --> 8
ALPHABET += [[ 'z', 'x', 'c', 'v', 'b', 'n', 'm', 'comma', 'period', 'slash' ]] # x = 0 --> 9; y = 9 --> 11

NUM_ALPHA = NUMBERS + ALPHABET
i = 0 # iterates through the letters of NUM_ALPHA
j = 0 # controls y start value
k = j + Y_KEY_COMBOS

mode_default = " mode \"default\";"
mode_default = ""

rm_i3bar = "xdotool keydown super keyup super"
# rm_i3bar = ""
change_to_mode_small_mouse_move = "i3-msg mode \"mode_small_mouse_move\""
# change_to_mode_small_mouse_move = ""

X_KEY_COMBO_KEYS = ["Mod1"]

num_alpha_x = 0 # iterates through the lists of NUM_ALPHA

from os import system

system("gromit-mpx --toggle")
for y in range(0, Y_CHUNK_SIZE, Y_KEY_COMBOS):
    for x in range(0, X_CHUNK_SIZE, X_KEY_COMBOS):
        # exec python /home/kevin/.config/i3/scripts/mouse_jumper.py 2 0; exec xdotool keydown super keyup super
        # bindsym $mod+3 mode "default"; exec python /home/kevin/.config/i3/scripts/mouse_jumper.py 2 1; exec xdotool keydown super keyup super
        # bindsym $mod+shift+3 mode "default"; exec python /home/kevin/.config/i3/scripts/mouse_jumper.py 2 2; exec xdotool keydown super keyup super
        click = " && xdotool click 1"
        xdojump = "xdotool mousemove "
        system(xdojump + jumper(x, y) + click)
        # system(xdojump + jumper(x, y+1) + click)
        # system(xdojump + jumper(x, y+2) + click)
        # system(xdojump + jumper(x, y+3) + click)
        # system(xdojump + jumper(x+1, y) + click)
        # system(xdojump + jumper(x+1, y+1) + click)
        # system(xdojump + jumper(x+1, y+2) + click)
        # system(xdojump + jumper(x+1, y+3) + click)
        i+=1
    i = 0
    num_alpha_x += 1
system("gromit-mpx --toggle")
system("gromit-mpx --visibility")
