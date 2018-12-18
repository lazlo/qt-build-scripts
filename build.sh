#!/bin/bash

set -e
set -u

main() {
	NATIVE_DEST_DIR="qt-build-$(uname -m)"

	rm -rf $NATIVE_DEST_DIR
	mkdir -p $NATIVE_DEST_DIR

	cd $NATIVE_DEST_DIR
	../qt5/configure -developer-build -opensource -confirm-license -nomake examples -nomake tests
	qmake
	make -j$(nproc)
	#make install
	cd -
}

main $@
