# from os import system
from sys import argv
from ast import literal_eval
import pyautogui
# https://pyautogui.readthedocs.io/en/latest/install.html
# https://www.geeksforgeeks.org/mouse-keyboard-automation-using-python/

screen_size_filename = "/tmp/mouse-jump"
try:
    S_SIZE_FILE = open(screen_size_filename, "r")
except FileNotFoundError:
    S_SIZE_FILE = open(screen_size_filename, "w")
    S_SIZE_FILE.write(str(pyautogui.size()))
    S_SIZE_FILE.close()
    S_SIZE_FILE = open(screen_size_filename, "r")

# screen size
S_SIZE = literal_eval(S_SIZE_FILE.readline())
S_SIZE_FILE.close()

X, Y = int(S_SIZE[0]), int(S_SIZE[1])

X_CHUNK_SIZE = 20
Y_CHUNK_SIZE = 16

X_INCREMENTS = int(round(X / X_CHUNK_SIZE))
Y_INCREMENTS = int(round(Y / Y_CHUNK_SIZE))

OFFSET = 20

X_LOCATION = int(argv[1]) * X_INCREMENTS + OFFSET
Y_LOCATION = int(argv[2]) * Y_INCREMENTS + OFFSET
# print X_INCREMENTS, Y_INCREMENTS

# print X_LOCATION, Y_LOCATION

pyautogui.moveTo(X_LOCATION, Y_LOCATION,duration=0)
