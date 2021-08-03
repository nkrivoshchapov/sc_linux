#!/bin/bash
cp simple_condensation/tlc_src/* .
gcc -o sturm.o -c sturm.c -fPIC -static -lgfortran
g++ -o main.o -c main.cpp -fPIC -static -lgfortran
gfortran -o tripep_closure.o -c tripep_closure.f90 -fPIC -static -lgfortran
gfortran -o main_pep.o -c main_pep.f90 -fPIC -static -lgfortran
g++ -shared -Wl,-soname,libtlc.so -o libtlc.so sturm.o main.o main_pep.o tripep_closure.o -lgfortran

cp -r simple_condensation/iklib .
python patch_iklib.py
/bin/python3.8 /usr/local/lib/python3.8/site-packages/PyInstaller/__main__.py  --onefile --icon=app.ico driver.py
mkdir lin_build
mv dist/driver lin_build
mv libtlc.so lin_build
cp default.ini lin_build