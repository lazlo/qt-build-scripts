#!/bin/bash

set -e
set -u

main() {
	if [ ! -e qt5 ]; then
		git clone git://code.qt.io/qt/qt5.git
	fi

	NATIVE_DEST_DIR="qt-build-$(uname -m)"

	cd qt5
	git checkout v5.12.0
	perl init-repository
	git clean -xfd
	cd -

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
