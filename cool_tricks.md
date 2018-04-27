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



