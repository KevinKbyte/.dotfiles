import subprocess
FILE="/tmp/pidwindowing.txt"
CFILE="/tmp/pidwindowing-comparison.txt"
> $CFILE
window=$(xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW | awk "{print \$2}") | rg "WM_CLASS\(" | awk 'NF>1{print $NF}' | sed 's/"//g')
# echo $window
echo xargs -n 1 < $window >> $CFILE
pid=$(xdotool search --class $window)
# echo $pid
echo $pid >> $CFILE
pid_len=$(expr $(echo -n $pid | wc -w) - 1)
# echo $pid_len
echo $pid_len >> $CFILE
pid_start=$(expr $(echo -n $pid | wc -w) / 2 - 1)
# echo $pid_start
echo $pid_start >> $CFILE
# range=$(seq $pid_start $pid_len)
# echo $range
# echo $range >> $CFILE
foo=$(cat $CFILE); echo -e ${foo// /\\n}

if [ -f $FILE ]; then
   echo $(cat $CFILE)
   cat $CFILE > $FILE
   pid_curr=$pid_start
else
    if [[ $(cat $FILE | sed \$d) != $(cat $CFILE | sed \$d) ]]; then
       cat $CFILE > $FILE
       pid_curr=$pid_start
    else
        pid_curr=$(cat $FILE | tail -1)
    fi
fi

xdotool windowactivate $(sed '${pid_curr}q;d' $FILE)
if [ $pid_curr < $pid_len ]; then
    pid_curr=$(expr $pid_curr + 1)
else
    pid_curr=$pid_start

$(cat $FILE | sed \$d)${pid_curr} > $FILE

# for num in {$pid_len..$pid_start}; do sleep 1 && xdotool windowactivate $pid | awk '{print $num}'; done
# for num in $range; do sleep 1 && echo $(echo $pid | awk "{print $num}") ; done
