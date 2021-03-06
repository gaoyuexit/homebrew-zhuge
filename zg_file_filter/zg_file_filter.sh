#!/bin/bash
# filter and delete the same file for both folders

SameDir="/Users/`whoami`/Desktop/SameFiles"

usage(){
	cat <<-EOF
		usage: sh [$0] [source path] [other path]
		EOF
}

function echo_green(){
    echo -e "\033[32m[ $1 ]\033[0m"
}

if [ -z $1 ] || [ -z $2 ]; then
	usage
	exit 1
fi

SourceDirFilesPaths=`find $1 -type f`
OtherDirFilesPaths=`find $2 -type f`

mkdir $SameDir
for sourceDirFilePath in $SourceDirFilesPaths; do
   for otherDirFilePath in $OtherDirFilesPaths; do
       sourceFileName=$(basename $sourceDirFilePath)
       otherFileName=$(basename $otherDirFilePath)
       if [ "$sourceFileName" == "$otherFileName" ] && [ "$sourceFileName" != ".DS_Store" ]; then
           echo_green " -------------------------------------- "
           echo "[$sourceDirFilePath] ===== [$otherDirFilePath]"
           echo "[$otherDirFilePath] ----> [$SameDir/$otherFileName]"
           cp -fp $otherDirFilePath $SameDir/$otherFileName
           rm -vi $otherDirFilePath
           echo_green " -------------------------------------- "
       fi
   done
done





































































