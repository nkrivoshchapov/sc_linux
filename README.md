# Build of SC algorithm for Linux

In case you are looking for the executable version:
https://drive.google.com/file/d/1mGHUjjuqzRh3uy6JAUiiEL99m6oHAPoj/view?usp=sharing

Here is how to create the executable from source code:

## Clone

```
git clone git@github.com:nkrivoshchapov/sc_linux.git
cd sc_linux
git submodule update --init --recursive --remote
git submodule foreach git pull origin master
git submodule foreach git checkout master
```

## Build

1. Make sure you have `gcc`, `g++` and `gfortran` installed.

2. Setup the minimal installation of Python3 with pip. Using pip install scipy, numpy, networkx and pyinstaller. Fix the path to python and pyinstaller in 11th line of `build.sh`.

3. Open CMD and change directory to `sc_linux`.

4. Execute

```
./build.sh
```

## Test

```
cd lin_build
./driver test
```

## Use

To run generation of conformers:
 
```
./driver <name of config file>
```

To run tests:

```
./driver test <name of config file>
```

`default.ini` is the name of config file by default.
