#!/bin/sh

# input:
# BUILD_NUMBER = jenkins buildnumber

set -e

NPROC=$(nproc 2>/dev/null || true)
if [ -z "$NPROC" ] ; then
	NPROC=$(grep -c "^processor" /proc/cpuinfo)
fi

if [ $BUILD_TYPE = "unstable" ] ; then
	VERSION_REPO="http://buildbot.berlin.freifunk.net/buildbot/unstable/%V/%S/packages"
	VERSION_NUMBER="$BUILD_NUMBER"
	MAKE_OPTIONS="VERSION_REPO=$VERSION_REPO VERSION_NUMBER=$VERSION_NUMBER"
elif [ $BUILD_TYPE = "weekly" ] ; then
	VERSION_REPO="http://buildbot.berlin.freifunk.net/buildbot/weekly/%V/%S/packages"
	VERSION_NUMBER="$BUILD_NUMBER"
	MAKE_OPTIONS="VERSION_REPO=$VERSION_REPO VERSION_NUMBER=$VERSION_NUMBER"
elif [ $BUILD_TYPE = "stable" ] ; then
	VERSION_REPO="http://buildbot.berlin.freifunk.net/buildbot/stable/%V/%S/packages"
	MAKE_OPTIONS="VERSION_REPO=$VERSION_REPO"
fi

make -j8 TARGET=${ARCH} clean || true
make -j8 TARGET=${ARCH} ${MAKE_OPTIONS}
