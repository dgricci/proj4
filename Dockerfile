## PROJ.4 - Cartographic Projections Library 
FROM dgricci/build-jessie:0.0.4
MAINTAINER Didier Richard <didier.richard@ign.fr>

## arguments
ARG PROJ4_VERSION
ENV PROJ4_VERSION ${PROJ4_VERSION:-4.9.3}
ARG PROJ4_DOWNLOAD_URL
ENV PROJ4_DOWNLOAD_URL ${PROJ4_DOWNLOAD_URL:-http://download.osgeo.org/proj/proj-$PROJ4_VERSION.tar.gz}
ARG PROJ4_DATUM_VERSION
ENV PROJ4_DATUM_VERSION ${PROJ4_DATUM_VERSION:-1.6}
ARG PROJ4_DATUM_DOWNLOAD_URL
ENV PROJ4_DATUM_DOWNLOAD_URL ${PROJ4_DATUM_DOWNLOAD_URL:-http://download.osgeo.org/proj/proj-datumgrid-$PROJ4_DATUM_VERSION.zip}

COPY build.sh /tmp/build.sh

RUN /tmp/build.sh && rm -f /tmp/build.sh

# Externally accessible data is by default put in /geodata
# use -v at run time !
WORKDIR /geodata

# Output capabilities by default.
CMD ["proj", "-l"]

