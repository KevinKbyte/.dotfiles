from string import ascii_lowercase
from sys import argv
from os import system
"""
Takes in 1 argument (mode_mouse_move or mode_small_mouse_move), and prints out based on that
"""

# if len(argv) == 6:
#     X_INCREMENTS = argv[1]
#     Y_INCREMENTS = argv[2]
#     OFFSET = argv[3]
#     X_CHUNK_SIZE = argv[4]
#     Y_CHUNK_SIZE = argv[5]
# else:
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
X_CHUNK_SIZE = 10 * X_KEY_COMBOS

# Y Chunk Size = 4 * (# of key combinations)
# 4 is because 1-->0, q-->p, a-->;, z-->/ are four layers of y axis matrix
# # of key combinations:
    # Key
    # Mod + key
    # Shift + key
    # Mod + Shift + key
# Y Chunk Size = 4 * 3 = 16
Y_KEY_COMBOS = 4
Y_CHUNK_SIZE = 4 * Y_KEY_COMBOS

X_INCREMENTS = int(round(X / X_CHUNK_SIZE))
Y_INCREMENTS = int(round(Y / Y_CHUNK_SIZE))

JUMPER = "$SCRIPTS/mouse_jumper.py"
ADDITONAL_ACTION_SCRIPT="$SCRIPTS/i3_mouse_move_additional_action.sh"

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


for y in range(0, Y_CHUNK_SIZE, Y_KEY_COMBOS):
    for x in range(0, X_CHUNK_SIZE, X_KEY_COMBOS):
        # exec python /home/kevin/.config/i3/scripts/mouse_jumper.py 2 0; exec xdotool keydown super keyup super
        # bindsym $mod+3 mode "default"; exec python /home/kevin/.config/i3/scripts/mouse_jumper.py 2 1; exec xdotool keydown super keyup super
        # bindsym $mod+shift+3 mode "default"; exec python /home/kevin/.config/i3/scripts/mouse_jumper.py 2 2; exec xdotool keydown super keyup super

        curr_key = NUM_ALPHA[num_alpha_x][i]
        if argv[1] == "mode_mouse_move":
            additional_action = " && " + ADDITONAL_ACTION_SCRIPT
        else:
            additional_action = ""
            if curr_key in ['h','j','k','l']:
                continue

        print("bindsym " + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x) + " " + str(y) + additional_action)
        print("bindsym " + "$mod+" + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x) + " " + str(y+1) + additional_action)
        print("bindsym " + "$mod+shift+" + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x) + " " + str(y+2) + additional_action)
        print("bindsym " + "shift+" + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x) + " " + str(y+3) + additional_action)
        print("bindsym " + X_KEY_COMBO_KEYS[0] + "+" + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x+1) + " " + str(y) + additional_action)
        print("bindsym " + X_KEY_COMBO_KEYS[0] + "+$mod+" + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x+1) + " " + str(y+1) + additional_action)
        print("bindsym " + X_KEY_COMBO_KEYS[0] + "+$mod+shift+" + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x+1) + " " + str(y+2) + additional_action)
        print("bindsym " + X_KEY_COMBO_KEYS[0] + "+shift+" + curr_key + mode_default + " exec python3 " + JUMPER + " " + str(x+1) + " " + str(y+3) + additional_action)
        i+=1
        print()
    i = 0
    num_alpha_x += 1

# rm_i3bar = "xdotool keydown super keyup super"
# mouse_up = "xdotool mouseup 1"
# mode_default = " mode \"default\";"

# mode_click1 = "Return"
# mode_click2 = "apostrophe"
# left_click = "j"
# right_click = "k"
# middle_click = "space"
# click_default_mode = "Escape"
# cursor_default_mode = "Mod1+space"
# mouse_move_mode = "$mod+a"
# small_mouse_move_mode = "space"

# print("bindsym " + mode_click1 + " mode \"mode_click\"\n")
# print("bindsym " + mode_click2 + " mode \"mode_click\"\n")
# print("bindsym " + cursor_default_mode + " mode \"default\"; exec " + rm_i3bar + " && " + mouse_up)
# print("bindsym " + small_mouse_move_mode + " mode \"mode_small_mouse_move\"")
# print("\n}\n")
# print("bindsym " + mouse_move_mode + " mode \"mode_mouse_move\"")
# print("\n")

# print("set $mode_click")
# print("mode \"mode_click\" {\n")
# # Left clicks mouse
# print("    bindsym " + left_click + mode_default + " exec xdotool click 1")
# # Right clicks mouse
# print("    bindsym " + right_click + mode_default + " exec xdotool click 3")
# # Middle mouse
# print("    bindsym " + middle_click + mode_default + " exec xdotool click 2")
# # Default Mode
# print("    bindsym " + click_default_mode + " mode \"default\"; exec " + rm_i3bar)
# print("\n}")
