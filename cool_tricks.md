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
