#!/bin/bash
echo "Hello World!JenkinsHello World!JenkinsHello World!JenkinsHello World!JenkinsHello World!JenkinsHello World!JenkinsHello World!JenkinsHello World!JenkinsHello World!Jenkins"

# 工程名
APP_NAME="ProjectForJenkins"
# 证书
CODE_SIGN_DISTRIBUTION="Apple Development"
# info.plist路径
curPath=$(cd "$(dirname "$0")"; pwd)
project_infoplist_path="${curPath}/${APP_NAME}/Info.plist"
#取版本号
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${project_infoplist_path}")
#取build值
bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${project_infoplist_path}")
DATE="$(date +%Y%m%d)"
IPANAME="${APP_NAME}_V${bundleShortVersion}_${DATE}.ipa"
#要上传的ipa文件路径
IPA_PATH="$HOME/${IPANAME}"
echo ${IPA_PATH}
echo "${IPA_PATH}">> text.txt
//下面2行是没有Cocopods的用法
#echo "=================clean================="
#xcodebuild -target "${APP_NAME}"  -configuration 'Release' clean
#echo "+++++++++++++++++build+++++++++++++++++"
#xcodebuild -target "${APP_NAME}" -sdk iphoneos -configuration 'Release' CODE_SIGN_IDENTITY="${CODE_SIGN_DISTRIBUTION}" SYMROOT='$(PWD)'
//下面2行是集成有Cocopods的用法
echo "=================clean================="
xcodebuild -workspace "${curPath}/${APP_NAME}.xcworkspace" -scheme "${APP_NAME}"  -configuration 'Release' clean
echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild -workspace "${curPath}/${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -sdk iphoneos -configuration 'Release' CODE_SIGN_IDENTITY="${CODE_SIGN_DISTRIBUTION}" SYMROOT='$(PWD)'
xcrun -sdk iphoneos PackageApplication "./Release-iphoneos/${APP_NAME}.app" -o ~/"${IPANAME}"
