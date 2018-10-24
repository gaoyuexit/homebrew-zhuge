#!/bin/bash
# filter and delete the same file for both folders

SameDir="/Users/`whoami`/Desktop/SameFiles"

usage(){
	cat <<-EOF
		usage: sh [$0] [source path] [other path]
		EOF
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
           echo -e "\033[31m -------------------------------------- \033[0m"
           echo "[$sourceDirFilePath] ===== [$otherDirFilePath]"
           echo "[$otherDirFilePath] ----> [$SameDir/$otherFileName]"
           cp -fp $otherDirFilePath $SameDir/$otherFileName
           rm -vi $otherDirFilePath
           echo -e "\033[31m -------------------------------------- \033[0m"
       fi
   done
done





































































