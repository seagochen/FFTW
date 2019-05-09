#!/bin/sh

# build fftw3 lib for linux

INSTALL_DIR=linux-install

set -e

mkdir -p $INSTALL_DIR
rm -rf $INSTALL_DIR/*

for arch in i386 x86_64; do
    export CC="gcc -arch ${arch}"

    ./configure --enable-float
    make -j4

    cp .libs/libfftw3f.a $INSTALL_DIR/libfftw3f_${arch}.a
    make distclean
done

# Copy the header file too, just for convenience
cp api/fftw3.h $INSTALL_DIR/fftw3.h