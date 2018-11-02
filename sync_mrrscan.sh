#!/bin/bash

sync_files=nh_scan.list mrr_scan.list sync_mrrscan.sh

Usage()
{
	echo "Usage: $0 {upload|download|help} {pathofsync}"
}

do_upload () {	
	echo "==> Upload $sync_files to remote on github.io"
	git remote -v show
	git add nh_scan.list mrr_scan.list sync_mrrscan.sh
	git commit -m "refresh"
	git push -u origin master

}

do_download () {
	echo "==> Download $sync_files from remote on github.io" 
	git pull -v
}

if [ -z $1 ]; then
	Usage $0
	exit 3	
else

	case "$1" in
	  upload)
		METHOD=do_upload		
		;;
	  download)
		METHOD=do_download
		;;
	  *)
		Usage $0
		exit 3
		;;
	esac			
fi

if [ -z $2 ]; then
	Usage $0
	exit 3	
else
	GITPATH=$2
fi


while true
do

	cd "$GITPATH"
	$METHOD	
	
	sleep 10
done
