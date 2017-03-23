#!/bin/zsh
echo $1
function sendloop(){
	ls=(`/bin/ls -l sendbuf`)
	export old=$new
	export new=$ls[5]
	diff=$((new-old));
	tail -c $diff sendbuf | nc $1 12345
}
sendloop $1 && while :;do sendloop $1 2>&1 > /dev/null ;done &
PID=$!
script -fq sendbuf
#kill -9 $PID
