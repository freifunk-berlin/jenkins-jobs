#!/bin/sh

set -e

NPROC=$(nproc 2>/dev/null || true)
if [ -z "$NPROC" ] ; then
	NPROC=$(grep -c "^processor" /proc/cpuinfo)
fi

make -j8 TARGET=${ARCH} clean || true
make -j8 TARGET=${ARCH}
