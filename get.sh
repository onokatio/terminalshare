#!/bin/zsh
function getloop(){
	while :;do nc -l 12345 >> getbuf;done
}

getloop 2>&1 > /dev/null &
PID=$!
tail -f getbuf
kill -9 $PID
