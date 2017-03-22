#!/bin/zsh

function sendloop(){
	echo "" > typescript
	while :;do
		ls=(`/bin/ls -l typescript`)
		export old=$new
		export new=$ls[5]
		diff=$((new-old));
		tail -c $diff typescript | nc localhost 12345
	done
}
rm typescript
sendloop &
script -fqt sendbuf
