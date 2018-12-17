#!/bin/bash

set -e
set -u

main() {
	apt-get -q build-dep -y qt5-default
	apt-get -q install -y libxcb-xinerama0-dev
	apt-get -q install -y build-essential perl python git
	apt-get -q install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
}

main $@
