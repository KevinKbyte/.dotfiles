from os import system
from sys import argv

screen_size_filename = "/tmp/mouse-jump"
system("xrandr  | grep \* | cut -d' ' -f4 > " + screen_size_filename)

# screen size
S_SIZE_FILE = open(screen_size_filename, "r")
S_SIZE = str(S_SIZE_FILE.readline())

X, Y = S_SIZE.split("x")
X, Y = int(X), int(Y)

X_CHUNK_SIZE = 20
Y_CHUNK_SIZE = 16

X_INCREMENTS = int(round(X / X_CHUNK_SIZE))
Y_INCREMENTS = int(round(Y / Y_CHUNK_SIZE))

X_OFFSET = X_INCREMENTS//2
Y_OFFSET = Y_INCREMENTS//2

X_LOCATION = str(int(argv[1]) * X_INCREMENTS + X_OFFSET)
Y_LOCATION = str(int(argv[2]) * Y_INCREMENTS + Y_OFFSET)

print X_LOCATION, Y_LOCATION

system("xdotool mousemove " + X_LOCATION + " " + Y_LOCATION)

S_SIZE_FILE.close()
