#!/bin/zsh

function sendloop(){
	while :;do
		ls=(`/bin/ls -l sendbuf`)
		export old=$new
		export new=$ls[5]
		diff=$((new-old));
		tail -c $diff sendbuf | nc $1 12345
	done
}
sendloop 2>&1 > /dev/null &
PID=$!
script -fq sendbuf
kill -9 $PID
