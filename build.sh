#!/bin/bash

# Exit on any non-zero status.
trap 'exit' ERR
set -E

echo "Compiling PROJ${PROJ4_VERSION}..."
01-install.sh
#install proj4 and compile it over to prevent packages depending on to install it !
apt-get -qy --no-install-recommends install \
        libproj0 \
        libproj-dev \
        proj-data \
        unzip

NPROC=$(nproc)
cd /tmp
wget --no-verbose "$PROJ4_DOWNLOAD_URL"
wget --no-verbose "$PROJ4_DOWNLOAD_URL.md5"
# bug in proj-$PROJ4_VERSION.tar.gz : RC3 still in the file name :)
sed -i -e 's/RC3//' proj-$PROJ4_VERSION.tar.gz.md5
md5sum --strict -c proj-$PROJ4_VERSION.tar.gz.md5
curl -fsSL "$PROJ4_DATUM_DOWNLOAD_URL" -o proj-datumgrid-$PROJ4_DATUM_VERSION.zip
tar xzf proj-$PROJ4_VERSION.tar.gz
rm -f proj-$PROJ4_VERSION.tar.gz*
unzip proj-datumgrid-$PROJ4_DATUM_VERSION.zip -d proj-$PROJ4_VERSION/nad
rm -f proj-datumgrid-$PROJ4_DATUM_VERSION.zip
{
    cd proj-$PROJ4_VERSION ; \
    ./configure --prefix=/usr && \
    make -j$NPROC  > ../../make.log 2>&1 && \
    make install ; \
    ldconfig ; \
    cd .. ; \
    rm -fr proj-$PROJ4_VERSION ; \
}
apt-get purge -y --auto-remove \
    unzip
01-uninstall.sh y

exit 0

