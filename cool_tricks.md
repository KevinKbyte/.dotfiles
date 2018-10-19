# Summons a terminal in vim
:term zsh -f

# Checks the class of a window for i3wm
xprop

# Checks what type of key is pressed
xev

# The -l option generates a long listing, and when used together with the -e and -f options creates a table with 15 columns:
ps -efl

# Japanese, Chinese and Korean input
  #### jp
    sai ibus-anthy 
    change the "next input method" to F13 or whatever, then 
    xmodmap -e "keycode 105 = F13 NoSymbol F13"
    To allow for switching of keyboard to Japanese with Control_R
  #### chi
    sai ibus-cangjie
  #### kr
    sai hangul
  - follow the https://wiki.archlinux.org/index.php/IBus
  - ibus-setup

# To get python support in vim
  sai vim-nox vim-nox-py2

# if virtualenv wrong paths
  for example, edit /home/kevin/Desktop/projects/.virtualenvs/py27-owtf/lib/python2.7/site-packages/_virtualenv_path_extensions.pth
  add:
    sys.path.append("/home/kevin/Desktop/projects/.virtualenvs/py27-owtf/lib/python2.7")

# To get C and C++ docs in vim:
While cppman is an excellent suggestion, if you have the C and C++ manpages (manpages-posix-dev and libstdc++-X.Y-doc packages on Debian-based systems) installed, plain old man should work.
  - https://vi.stackexchange.com/questions/6228/how-can-i-get-vim-to-show-documentation-of-a-c-c-function?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

# Listing all installed packages to be reinstalled in a different computer
  - https://askubuntu.com/questions/17823/how-to-list-all-installed-packages

# View logs on most recent boot
journalctl -b
# Follow the log as it's being written
journalctl -f
# Follows the log messages of a specific unit
journalctl -fu <program>

# Install imagemagick for screenshots using import command

# ARCH LINUX
# Render japanese characters 
  https://bbs.archlinux.org/viewtopic.php?id=184640
  To properly render fonts for multilingual websites like Wikipedia or this Arch Linux wiki, install these packages: ttf-freefont, ttf-arphic-uming, ttf-baekmuk

# Set time zone
  https://wiki.archlinux.org/index.php/time
  timedatectl set-timezone America/New_York

# Grep through a binary
  grep -a pattern some_file
  This option causes grep to act as if the file is a text file, even if it would otherwise be treated as binary. 

# Get unity3d to work from .sh
  https://forum.unity.com/threads/unity3d-5-3-on-fresh-fedora-installation.393637/
  ./unity-editor-5.3.4f1/Editor/Unity: error while loading shared libraries: libpq.so.5: cannot open shared object file: No such file or directory
  pSs libpq
  Install the packages as well as npm and nodejs

# Edit the visudo file with visudo command to change the sudo privileges of files or groups
  visudo

# Fixing "Failed to commit transaction (invalid or corrupted package)" error
  https://wiki.archlinux.org/index.php/Pacman#.22Failed_to_commit_transaction_.28invalid_or_corrupted_package.29.22_error
  Look for .part files (partially downloaded packages) in /var/cache/pacman/pkg and remove them (often caused by usage of a custom XferCommand in pacman.conf).
  Run:
  find /var/cache/pacman/pkg/ -iname "*.part" -exec rm {} \;

# How to enable tap to click on touchpad for libinput
  https://wiki.archlinux.org/index.php/Libinput
  libinput list-devices
  # find the device id for the touchpad
  xinput set-prop 14
  # find the option ids for the touchpad
  xinput --watch-props 14
  # set the libinput Tapping Enabled (279) from 0 to 1
  xinput set-prop 14 279 1
  # look at the output and rejoice!
  xinput --watch-props 14

# How to make zsh default shell
  https://github.com/robbyrussell/oh-my-zsh/issues/5401
  Put into .bashrc or .bash_profile (.bash_profile didn't work for me)
  if [[ $- == *i*  ]]]; then
    export SHELL=zsh
    exec zsh -l
  fi

# How to prepend text to a file
# https://stackoverflow.com/questions/10587615/unix-command-to-prepend-text-to-a-file?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
  sed -i.old '1s;^;to be prepended;' inFile
  -i modifier is used to write update in place and take backup if any extension given. 1s;^;replacement-string; substitutes the beginning of the first line by the given replacement string using ; as a command delimiter

# Issue in Unreal Engine
> /home/kev/.github/misc/UnrealEngine/Engine/Source/ThirdParty/FBX/2018.1.1/lib/gcc4/x86_64-unknown-linux-gnu/release//libfbxsdk.a(fbxutils.o): In function `fbxsdk::FbxPathUtils::GenerateFileName(char const*, char const*)':
> (.text+0x4b8): warning: the use of `tempnam' is dangerous, better use `mkstemp'

# Unreal Engine
To regenerate project files (ex: bc update engine version)
<PATH to regenerateproject.sh in your UE4 engine files> <PATH to thing.uproject>
make <Project name>Editor

Whenever you need to recompile, you can hot recompile w/in UE4
To get error messages:
make <Project name>Editor

# Custom Chrome Search Engines
https://superuser.com/questions/272511/where-do-chrome-chromium-store-search-keywords
Located in sqlite file $HOME/.config/chrome/Default/Web\ Data
Check out the contents with:
  SELECT * from keyword

# C-R in non-normal modes
https://medium.com/usevim/vim-101-ctrl-r-c9b9b6812f4c
1. Pastes from register
2. <C-R>= to enter in an expression to be evaluated

# Search Files [IMPORTANT]
http://vim.wikia.com/wiki/Find_in_files_within_Vim

# Swap and move windows in Tmux
https://superuser.com/questions/343572/how-do-i-reorder-tmux-windows
bind-key T swap-window -t 0
swap-window -s 3 -t 1
to let window number 3 and window number 1 swap their positions.
To swap the current window with the top window, do:
swap-window -t 0
In the unlikely case of having no window at index 0, do:
move-window -t 0

# SSH w/o password
Copy ~/.ssh/id_rsa.pub to the target machine's ~/.ssh/authorized_keys

# PDF to Latex
abiword --to=tex filename.pdf

# MPD Verbosity
mpd --no-daemon --stdout --verbose

# React App
sudo npm install -g npm@latest
npm install => installs all packages defined in package.json

# Prepending to file
https://stackoverflow.com/questions/10587615/unix-command-to-prepend-text-to-a-file
  Examples:
    printf '%s\n%s\n' "to be prepended" "$(cat text.txt)" >text.txt
    for i in $(ls ~/.dotfiles/.vim/UltiSnips); do printf '%s\n%s\n' "# ~/.dotfiles/.vim/plugged/vim-snippets/UltiSnips/${i}" "$(cat $i)" > $i; done

# Vim open file under cursor in different ways (new tab, vertical split, etc)
https://vi.stackexchange.com/questions/3364/open-filename-under-cursor-like-gf-but-in-a-new-tab-or-split
  gf - Edit existing file under cursor in same window
  C-Wf - Edit existing file under cursor in split window
  C-WC-F - Edit existing file under cursor in split window
  C-Wgf - Edit existing file under cursor in new tabpage
  There is no standard mapping to edit existing file under cursor in a vertical split, but you can achieve it by first splitting the window vertically and then editing the file under cursor in the current window.

  C-Wv+gf - Edit existing file under cursor in vertically split window
  As you can see above, there are two default mappings for editing file under cursor in a horizontal split. You can therefore remap one of them to the keystring above, extending the group of maps to also cover the vertical split case. You can bind anything, of course, but this seems to complete the symmetry nicely: nnoremap <C-W><C-F> <C-W>vgf. Now you have

  gf - Edit existing file under cursor in same window
  C-Wf - Edit existing file under cursor in split window
  C-WC-F - Edit existing file under cursor in vertically split window
  C-Wgf - Edit existing file under cursor in new tabpage

# Parsing JSON using multiple approaches (diff languages/tools)
https://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools

# GDB
gcc -g -o test test.c
  -g includes symbolic debugging info
    -variable names and original source code instructions
    start
    list - debugging info
    next - jump over subroutine

# How to check if symlink or dir in bash
  https://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script
  if [ -d "$LINK_OR_DIR" ]; then 
    if [ -L "$LINK_OR_DIR" ]; then
      # It is a symlink!
      # Symbolic link specific commands go here.
      rm "$LINK_OR_DIR"
    else
      # It's a directory!
      # Directory command goes here.
      rmdir "$LINK_OR_DIR"
    fi
  fi

# Bash file testing:
  https://stackoverflow.com/questions/638975/how-do-i-tell-if-a-regular-file-does-not-exist-in-bash
  -b filename - Block special file
  -c filename - Special character file
  -d directoryname - Check for directory Existence
  -e filename - Check for file existence, regardless of type (node, directory, socket, etc.)
  -f filename - Check for regular file existence not a directory
  -G filename - Check if file exists and is owned by effective group ID
  -G filename set-group-id - True if file exists and is set-group-id
  -k filename - Sticky bit
  -L filename - Symbolic link
  -O filename - True if file exists and is owned by the effective user id
  -r filename - Check if file is a readable
  -S filename - Check if file is socket
  -s filename - Check if file is nonzero size
  -u filename - Check if file set-user-id bit is set
  -w filename - Check if file is writable
  -x filename - Check if file is executable
