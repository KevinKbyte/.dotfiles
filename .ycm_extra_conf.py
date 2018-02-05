flags = [
'-Wall',
'-Wextra',
'-Werror',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c++',
'-isystem',
'/usr/lib/llvm-5.0/include',
'-isystem',
'/usr/lib/llvm-5.0/lib/clang/5.0.0/include',
'-isystem',
'/usr/lib/llvm-5.0/include/clang',
'-isystem',
'/usr/include/c++/5',
'-isystem',
'/usr/include/x86_64-linux-gnu/c++/5',
'-isystem',
'/usr/include/c++/5/backward'
]
