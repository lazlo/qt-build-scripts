#!/bin/bash

set -e
set -u

build_native() {
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

build_target() {
	TARGET_DEST_DIR="qt-build-am43x"
	QT_TARGET_DEVICE=linux-beagleboard-g++
	TOOLCHAIN_DIR=/home/lazlo/opt/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabih

	rm -rf $TARGET_DEST_DIR
	mkdir -p $TARGET_DEST_DIR

	cd $TARGET_DEST_DIR
	../qt5/configure -developer-build -opensource -confirm-license -nomake examples -nomake tests \
	-device $QT_TARGET_DEVICE \
	-device-option CROSS_COMPILE=$TOOLCHAIN_DIR/bin/arm-linux-gnueabihf- \
	-sysroot $TOOLCHAIN_DIR/arm-linux-gnueabihf/libc/ \
	-v -no-use-gold-linker -make libs -optimized-qmake
	# qmake
	# make -j$(nproc)
	cd -
}

main() {
	#build_native
	build_target
}

main $@
