#!/bin/bash

VersionString=`grep -E 's.version.*=' CTAPI_AMap.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`
NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' CTAPI_AMap.podspec | cut -d : -f1`

git add .
git commit -am modification
git pull origin master --tags

sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" CTAPI_AMap.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"
say "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags
pod trunk push ./CTAPI_AMap.podspec --verbose --allow-warnings --use-libraries
