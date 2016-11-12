#!/bin/sh

# input:
# BUILD_NUMBER = jenkins buildnumber

set -e

NPROC=$(nproc 2>/dev/null || true)
if [ -z "$NPROC" ] ; then
	NPROC=$(grep -c "^processor" /proc/cpuinfo)
fi

VERSION_REPO="http://repo.fe80.eu/freifunk/${UPLOAD_DIR}/%V/%S/packages"
VERSION_NUMBER="$BUILD_NUMBER"
MAKE_OPTIONS="VERSION_REPO=$VERSION_REPO VERSION_NUMBER=$VERSION_NUMBER"

make -j8 TARGET=${ARCH} BUILD_LOG=1 clean || true
make -j8 TARGET=${ARCH} ${MAKE_OPTIONS} BUILD_LOG=1
