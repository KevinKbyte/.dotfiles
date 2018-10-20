function d { 
# LOGIC
# No redirect:
# 1. if first char == 0: print $(dirs -v | head -10)}:  dirs
# This means: If you are in the directory that triggered the search query, don't move and run dirs
# Redirect:
# Redirect if you are not in the same directory as the search query.
# 1. if ( first line's first char == 0 ) && one \n: cd -first character of $(dirs -v | head -10 | grep $1 | tail -1 | awk '{print $1}')
# This means: if the search query matches one entry from dirs and you are not currently in the directory, cd into this directory. 
# 2. if ( the first character != 0 ) && ( one line only (no \n) ): cd -first character of $(dirs -v | head -10 | grep $1 | awk '{print $1}')
# This means: if the search query matches two entries from dirs, and the top one your current directory, then cd into the directory that you are not currently in

inp=$1

# since if first param is ~, inp=$HOME, rather than inp="~". Thus, change from inp=$HOME back to inp="~" so grep can work properly
if [[ $inp == $HOME ]]; then
    inp="~"
fi

if [[ $2 == "i" ]]; then
    # if second input is -i, then case insensitive
    MRUd=$(builtin dirs -v | head -10 | grep -i "$inp")
    # else case sensitive
else
    MRUd=$(builtin dirs -v | head -10 | grep "$inp")
fi

firstD=$(echo $MRUd | awk '{print $1}')
firstD=${firstD:0:1}

NL="

"

case $MRUd in
    *"$NL"*) 
      x=$(echo $MRUd | grep -c '$')
      if [[ $x == 2 ]]; then
          #statements
# 1. if ( first line's first char == 0 ) && contains 1 \n: cd -first character of $(dirs -v | head -10 | greo $1 | tail -1 | awk '{print $1}')
        secondD=$(echo $MRUd | tail -1 | awk '{print $1}')
        secondD=${secondD:0:1}
        clear
        cd -$secondD
      else
         echo "first"
         dirs | sed 's/ /\n/g' 
      fi
      ;;
    *) 
       if [[ $firstD -ne "" && $firstD -ne 0 ]]; then
            cd -$firstD
       else
          clear
          dirs | sed 's/ /\n/g'
       fi 
      ;;
esac
}
