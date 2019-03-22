#!/bin/zsh
echo $1:$2
touch sendbuf
echo "touchd."
function sendloop(){
	while :;do
		ls=(`/bin/ls -l sendbuf`)
		export old=$new
		export new=$ls[5]
		diff=$((new-old));
		tail -c $diff sendbuf | nc $@ -N
	done
}
sendloop $@ &
PID=$!
echo "hook started."
script -fq sendbuf
kill -9 $PID
