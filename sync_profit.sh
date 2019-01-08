#!/bin/bash

sync_files="profit_miner.list.*"

Usage()
{
	echo "Usage: $0 {upload|download|help} {pathofsync}"
}

do_upload () {	
	echo "==> Upload $sync_files to remote on github.io"
	git remote -v show
	git add $sync_files
	git commit -m "refresh"
	git push -u origin master

}

do_download () {
	echo "==> Download $sync_files from remote on github.io" 
	git pull -v
}

while true
do

	do_upload
	do_download
#	$METHOD	
        exit 0

#	echo "===> Sleep for 10 seconds ..."
#	sleep 10
done
