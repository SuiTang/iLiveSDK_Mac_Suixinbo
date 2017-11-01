#!/bin/sh
#

# 加载各个模块SDK
echo "|-------------------------------sdk version--------------------------------|"
ILiveSDKVersion="ILiveSDKMac_1.7.1.12078"
IMSDKSDKVersion="IMSDK_2.5.4.10421.10420"
AVSDKVersion="AVSDK_1.9.5.1031.Local"

echo $ILiveSDKVersion
echo $IMSDKSDKVersion
echo $AVSDKVersion

#清除现有文件
echo "|-------------------------------clear sdk dir...--------------------------------|"
# 移除 除了LoadSDK.sh这个文件以外的所有文件
#ls |grep -v LoadSDK.sh |xargs rm -rf
# 移除SDK相关文件夹
rm -rf AVSDK
rm -rf ILiveSDK
rm -rf IMSDK

#下载sdk zip文件
echo "|-------------------------------download AVSDK----------------------------------|"
curl -o AVSDK.zip "http://dldir1.qq.com/hudongzhibo/ILiveSDK/$AVSDKVersion.zip" --retry 5
echo "|-------------------------------download IMSDK----------------------------------|"
curl -o IMSDK.zip "http://dldir1.qq.com/hudongzhibo/ILiveSDK/$IMSDKSDKVersion.zip" --retry 5
echo "|-------------------------------download ILiveSDK-------------------------------|"
curl -o ILiveSDK.zip "http://dldir1.qq.com/hudongzhibo/ILiveSDK/$ILiveSDKVersion.zip" --retry 5

echo "|-------------------------------download Successful-----------------------------|"

#解压zip文件
echo "|-------------------------------unzip ILiveSDK----------------------------------|"
unzip ILiveSDK.zip -x __MACOSX/*
echo "|-------------------------------unzip IMSDK-------------------------------------|"
unzip IMSDK.zip -x __MACOSX/*
echo "|-------------------------------unzip AVSDK-------------------------------------|"
unzip AVSDK.zip -x __MACOSX/*

#移除zip文件
echo "|-------------------------------remove zip--------------------------------------|"
find . -name "*.zip"  | xargs rm -f

