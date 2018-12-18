# Qt Build Scripts

The scripts contained in this repository should simplify the process of compiling (and in the near future cross-compiling) Qt5.

It is assumed that the user of the scripts will execute them on either a Ubuntu or Debian Linux system.

## Usage

 1. Execute the ```install-deps.sh``` as user root (e.g. using ```sudo```) once, to install the dependencies of the build process.
 2. Execute the ```setup.sh``` script as a regular user once. It will fetch the sources.
 3. Execute the ```build.sh``` to configure and execute the build.

```
sudo ./install-deps.sh
./setup.sh
./build.sh
```
