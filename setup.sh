#!/bin/bash

set -e
set -u

main() {
	if [ ! -e qt5 ]; then
		git clone git://code.qt.io/qt/qt5.git
	fi

	cd qt5
	git checkout v5.12.0
	perl init-repository
	git clean -xfd
	cd -

	rm -rf qt-build
	mkdir -p qt-build

	cd qt-build
	../qt5/configure -developer-build -opensource -confirm-license -nomake examples -nomake tests
	qmake
	make -j$(nproc)
	#make install
	cd -
}

main $@
