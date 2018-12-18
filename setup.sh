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
	rm -rf out
	mkdir -p out
	./configure -developer-build -opensource -confirm-license -nomake examples -nomake tests -prefix $(pwd)/out
	make -j$(nproc)
	cd -
}

main $@
