#!/bin/zsh
function getloop(){
	while :;do nc -l 12345 >> getbuf;done
}

getloop &
tail -f getbuf
