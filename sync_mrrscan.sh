#!/bin/bash

Usage()
{
	echo "Usage: $0 {upload|download|help} {pathofsync}"
}

do_upload () {	
	echo "==> Upload $sync_files to remote on github.io"
	git remote -v show
	git add *.list
	git commit -m "refresh"
	git push -u origin master

}

do_download () {
	echo "==> Download $sync_files from remote on github.io" 
	git pull -v
}

# check $1
case "$1" in
  upload)
	METHOD=do_upload		
	;;
  download)
	METHOD=do_download
	;;
  *)
	echo "Invalid method"
	Usage $0
	exit 3
	;;
esac			

# check $2
if [ -d $2 ]; then
	cd $2
	git remote -v |grep https://github.com/thinkahead123/docs.git
	if [ $? -ne 0 ]; then
		echo "Invalid remote of git:$2"
		Usage $0
		exit 3
	fi
else
	echo "Invalid path"
	Usage $0
	exit 3	
fi

while true
do

	$METHOD	

	exit 0

	echo "===> Sleep for 10 seconds ..."
	sleep 10
done
