#!/bin/bash
VER="6.12"
PKG="pgadmin4-${VER}"
wget -c "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${VER}/source/${PKG}.tar.gz"
rm -rf ${PKG}
tar xf ${PKG}.tar.gz
cd ${PKG}
./configure --prefix=/opt/kalamangga-net
make
