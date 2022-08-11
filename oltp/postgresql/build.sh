#!/bin/bash
VER="14.4"
PKG="postgresql-${VER}"
wget -c "https://ftp.postgresql.org/pub/source/v${VER}/${PKG}.tar.bz2"
rm -rf ${PKG}
tar xf ${PKG}.tar.bz2
cd ${PKG}
./configure --prefix=/opt/kalamangga-net CPPFLAGS="-I$(pwd)/src/include"
make
