#!/bin/bash
channel=`grep CHANNEL_NAME .env|grep -v '^#'|cut -d '=' -f2`
pkgid=`grep PACKAGE_IDENTIFIER .env|grep -v '^#'|cut -d '=' -f2`
baseurl=`grep PACKAGE_BASEURL .env|grep -v '^#'|cut -d '=' -f2`
pkgver=`grep PACKAGE_VERSION .env|grep -v '^#'|cut -d '=' -f2`
buildargs=""
if [ $baseurl != "" ]; then
    buildargs=" --build-arg PACKAGE_BASEURL=$baseurl"
fi
if [ $pkgid != "" ]; then
    buildargs="${buildargs} --build-arg PACKAGE_IDENTIFIER=$pkgid"
fi
if [ $pkgver != "" ]; then
    buildargs="${buildargs} --build-arg PACKAGE_VERSION=$pkgver"
fi

echo "${buildargs}"
sudo docker build \
    $buildargs -t $channel/onlyoffice .
