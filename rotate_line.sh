#!/bin/bash

function rotate_line
{
    COUNT=0
    SLEEP_TIME=1
while :
    do
        COUNT=`expr $COUNT + 1`
    case $COUNT in
		1) echo -e '-'"\b\c"
		   sleep $SLEEP_TIME
	;;
		2) echo -e '\\'"\b\c"
		   sleep $SLEEP_TIME
	;;
		3) echo -e '|'"\b\c"
		   sleep $SLEEP_TIME
	;;
	        4) echo -e '/'"\b\c"
		   sleep $SLEEP_TIME
	;;
		*) COUNT=0
	;;
	esac
done
}

rotate_line
