#!/bin/bash

Podspecpwd=`find . -name '*.podspec'`
PrivatePod="zhugefang-ios-privatepod"
PodsPath="/Users/`whoami`/.cocoapods/repos"
PodPrivateSource="https://git.zhugefang.com/iOS/PrivatePod"
PodMasterSource="https://github.com/CocoaPods/Specs"
PodLocalLint=false

## green to echo
function echo_green(){
    echo -e "\033[32m[ $1 ]\033[0m"
}

function show_version(){
    echo_green "`basename $0` version: 1.2, updated date: 2018-12-01 🍺"
}

## step-0 get args
while getopts 'tv' arg; do  
	case $arg in
		t)
			PodLocalLint=true
			;;
		v)
			show_version; exit 0
			;;
		?)
			echo_green "Usage: `basename $0` [-t] [-v]"; exit 1
			;;
	esac
done

## step-1
if test -z "$Podspecpwd"; then
    echo_green "Couldn't find podspec"
    exit
fi

PodspecName=$(basename ${Podspecpwd})
VersionString="`grep -E 's.version.*=' $PodspecName|awk '{print $3}'`"
echo_green "current version is ${VersionString}"

#TODO: I will delete the following line in the future.
#####  Because `pod spec lint --sources=..` and `pod repo add ..` will have conflicts.
#####  So don't execute `pod spec lint --sources=` and `pod repo add` in the private library at the same time  ___ by gaoyu

## step-2
if [ ! -d "$PodsPath/$PrivatePod" ]; then
    echo_green "$PrivatePod is not exist !"
    echo_green "begining clone $PrivatePod ..."
    pod repo add $PrivatePod $PodPrivateSource
else
    echo_green "$PrivatePod is exist !"
    echo_green "begining update $PrivatePod ..."
    cd $PodsPath/$PrivatePod && git pull origin master && cd -
fi


## step-3 clean
#ls -1 -F|grep /$|cut -d / -f 1|grep -v master|grep -v zhugefang-ios-privatepod    -> pod repo remove name
cd $PodsPath && find $PodsPath -type d -maxdepth 1 ! -name "master" -a ! -name "repos" ! -name $PrivatePod|xargs rm -r && cd -


## step-4 lib lint
#pod spec lint --sources="$PodPrivateSource,$PodMasterSource" --verbose --private --allow-warnings
if [[ "$PodLocalLint" == true ]]; then
	echo_green "local lint begining..."
	pod lib lint --sources="$PodPrivateSource,$PodMasterSource" --allow-warnings --verbose --use-libraries --no-clean --private --fail-fast --use-modular-headers 
	exit
fi


## step-4 push
pod repo push $PrivatePod $PodspecName --sources="$PodPrivateSource,$PodMasterSource" --allow-warnings --verbose --use-libraries --private --use-modular-headers







