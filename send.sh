#!/bin/zsh

function sendloop(){
	ls=(`/bin/ls -l sendbuf`)
	export old=$new
	export new=$ls[5]
	diff=$((new-old));
	tail -c $diff sendbuf | nc localhost 12345
}
sendloop && while :;do sendloop 2>&1 > /dev/null ;done &
PID=$!
script -fq sendbuf
#kill -9 $PID
