#!/bin/bash

do_update () {
	
	local_path="/home/ubuntu/think-head.github.io/docs"
	cd "$local_path"
	echo "==> Upload ${local_path} to remote on github.io"
	git remote -v show
	git add .
	git commit -m "refresh"
	git push -u origin master

}

while true
do

	do_update
	sleep 10
done
