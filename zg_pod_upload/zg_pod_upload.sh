#!/bin/bash

Podspecpwd=`find . -name '*.podspec'`
PrivatePod="zhugefang-ios-privatepod"
PodsPath="/Users/`whoami`/.cocoapods/repos"
PodPrivateSource="https://git.zhugefang.com/iOS/PrivatePod"
PodMasterSource="https://github.com/CocoaPods/Specs"

## green to echo
function echo_green(){
    echo -e "\033[32m[ $1 ]\033[0m"
}

if test -z "$Podspecpwd"; then
    echo "Couldn't find podspec"
    exit
fi

PodspecName=$(basename ${Podspecpwd})
VersionString="`grep -E 's.version.*=' $PodspecName|awk '{print $3}'`"
echo_green "current version is ${VersionString}"

#TODO: I will delete the following line in the future.
#####  Because `pod spec lint --sources=..` and `pod repo add ..` will have conflicts.
#####  So don't execute `pod spec lint --sources=` and `pod repo add` in the private library at the same time  ___ by gaoyu

#check
if [ ! -d "$PodsPath/$PrivatePod" ]; then
    echo_green "$PrivatePod is not exist !"
    echo_green "begining clone $PrivatePod ..."
    pod repo add $PrivatePod $PodPrivateSource
else
    echo_green "$PrivatePod is exist !"
    echo_green "begining update $PrivatePod ..."
    cd $PodsPath/$PrivatePod && git pull origin master && cd -
fi

#clean
#ls -1 -F|grep /$|cut -d / -f 1|grep -v master|grep -v zhugefang-ios-privatepod    -> pod repo remove name
cd $PodsPath && find $PodsPath -type d -maxdepth 1 ! -name "master" -a ! -name "repos" ! -name $PrivatePod|xargs rm -r && cd -

#pod spec lint --sources="$PodPrivateSource,$PodMasterSource" --verbose --private --allow-warnings
pod repo push $PrivatePod $PodspecName --sources="$PodPrivateSource,$PodMasterSource" --allow-warnings --verbose --use-libraries







