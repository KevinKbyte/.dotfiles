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

# Magic Space
https://unix.stackexchange.com/questions/47349/what-does-zshs-magic-space-command-do
  1. Allows expansion of history in bash with !<number in history>/startingletters

# Formatting Comments in Vim
https://stackoverflow.com/questions/33423739/comment-formatting-specifying-and-indentation
  1. s:/*,m:**,ex:*/
    - This allows easy closing of the comment (x flag) and the middle behavior that you described. You didn't mention the language you're using, but let's assume it is C and Objective-C in which you need this. I like to keep my configuration stuff in my .vimrc; so instead of creating or modifying the language files, I'd add this auto-command:
  2.  autocmd FileType c,objc setlocal comments=s:/*,m:**,ex:*/
     - Use the 'comments' option. Please check :h format-comments to read more about this, and configure your options accordingly. Here is a suggestion of flags to use:

# Polymorphism
  https://www.youtube.com/watch?v=N4mEzFDjqtA
  1. polymorphism - refer to objects as superclass and the functions work

# Free a port
  fuser <port>/tcp -k

# Netrw explorer (https://vi.stackexchange.com/questions/6837/explore-shows-the-directory)
  let g:netrw_list_hide = '^\./$'
  let g:netrw_hide = 1

  Once the variable is set, from netrw, hitting *a* will switch between different views:

  showing everything
  hiding items described by g:netrw_list_hide
  only showing items in g:netrw_list_hide

# Minted Latex (https://tex.stackexchange.com/questions/40083/how-to-install-minted-in-ubuntu)
  sudo apt-get install texlive-latex-extra 
  sudo apt-get install python-pygments

# Almost like Markdown in Google Docs (https://hackmd.io/) - thanks duy

# LD_PRELOAD
  https://superuser.com/questions/226033/how-to-freeze-the-clock-for-a-specific-task
  https://crypto.stackexchange.com/questions/52000/how-can-c-rand-be-exploited-if-a-secure-seed-is-used
  https://www.usna.edu/Users/cs/aviv/classes/si485h/s17/hw/02/hw.html

  https://stackoverflow.com/questions/10448254/how-to-use-gdb-with-ld-preload
    - gdb

  https://stackoverflow.com/questions/29273277/when-will-ld-preload-be-ignored
    - LD_DEBUG
  https://unix.stackexchange.com/questions/58846/viewing-linux-library-executable-version-info
    - readelf -a -W <elffile>

# Toggle allow mouse movement while typing:
  xinput --list-props 14
  xinput set-prop 14 289 0
  toggle disable while typing enable property: xinput --set-prop <m> <n> 0 (https://askubuntu.com/questions/42764/mouse-locks-when-keys-are-pressed)

# Python dir to check attributes
  https://stackoverflow.com/questions/192109/is-there-a-built-in-function-to-print-all-the-current-properties-and-values-of-a
  dir(obj)

# i3wm move container to container with a certain mark
 https://i3wm.org/docs/userguide.html#_moving_containers_windows_to_marks
  6.11. Moving containers/windows to marks
  To move a container to another container with a specific mark (see [vim_like_marks]), you can use the following command.

  The window will be moved right after the marked container in the tree, i.e., it ends up in the same position as if you had opened a new window when the marked container was focused. If the mark is on a split container, the window will appear as a new child after the currently focused child within that container.

  Syntax:

  move window|container to mark <mark>
  Example:

  for_window [instance="tabme"] move window to mark target

# Python Regex
  Current workspace number
  currentNumber = int(re.search(r'^([0-9]+)', focused).group(0))

# Python Timeit - Tests runtime
  https://docs.python.org/2/library/timeit.html
  Examples:
    >>> import timeit
    >>> timeit.timeit('"-".join(str(n) for n in range(100))', number=10000)
    0.8187260627746582
    >>> timeit.timeit('"-".join([str(n) for n in range(100)])', number=10000)
    0.7288308143615723
    >>> timeit.timeit('"-".join(map(str, range(100)))', number=10000)
    0.5858950614929199

# Automatic Normalization of Played Audio
  https://askubuntu.com/questions/95716/automatically-adjust-the-volume-based-on-content

# Vim: Move through changelist
  https://stackoverflow.com/questions/1722681/how-to-go-back-to-lines-edited-before-the-last-one-in-vim
  - g; and g,

# Record Loopback audio
 pavucontrol

# Remove user from group
 s gpasswd -d $USER cgusers

# Cgroups for controlling resources
  https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/resource_management_guide/sec-cpu
  - Modify /sys/fs/cgroup/cpu/limited/cpu.cfs_quota_us
    - *cpu.cfs.quota_us*
    - specifies a period of time in microseconds (µs, represented here as "us") for how regularly a cgroup's access to CPU resources should be reallocated. If tasks in a cgroup should be able to access a single CPU for 0.2 seconds out of every 1 second, set cpu.cfs_quota_us to 200000 and cpu.cfs_period_us to 1000000. The upper limit of the cpu.cfs_quota_us parameter is 1 second and the lower limit is 1000 microseconds.
    - https://unix.stackexchange.com/questions/134414/how-to-limit-the-total-resources-memory-of-a-process-and-its-children
      - sudo cgcreate -t $USER:$USER -a $USER:$USER -g memory:myGroup
          - allows specified user to call, for example: *cgexec -g memory:myGroup vim*, w/o root privileges
      - echo 500000000 > /sys/fs/cgroup/memory/myGroup/memory.limit_in_bytes
    - https://stackoverflow.com/questions/45555186/limit-cpu-time-of-process-group
       - cgcreate -g cpu:/fixedlimit
       - # allow fix 25% cpu usage (1 cpu)
       - cgset -r cpu.cfs_quota_us=25000,cpu.cfs_period_us=100000 fixedlimit
       - cgexec -g cpu:fixedlimit /my/hungry/program
           - to set _Timeout_:
            - It turned out, the goal is to limit runtime to certain seconds while measuring it. After setting the desired cgroup limits (in order to get a fair sandbox) you can achieve this goal by running:
              - ((time -p timeout 20 cgexec -g cpu:fixedlimit /program/to/test ) 2>&1) | grep user

# Load average
  https://www.tecmint.com/understand-linux-load-averages-and-monitor-performance/
  - High load averages imply that a system is overloaded; many processes are waiting for CPU time. 
  - Load averages from *uptime* command is:
     1. over last minute
     2. over last 5 minutes
     3. over last 15 minutes
