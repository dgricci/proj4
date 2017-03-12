% PROJ.4 - Cartographic Projections Library
% Didier Richard
% 12/03/2017

---

revision:
    - 0.0.1 : 05/02/2017
    - 0.0.2 : 16/02/2017
    - 0.0.3 : 05/03/2017
    - 0.0.4 : 12/03/2017

---

# Building #

```bash
$ docker build -t dgricci/proj4:$(< VERSION) .
$ docker tag dgricci/proj4:$(< VERSION) dgricci/proj4:latest
```

## Behind a proxy (e.g. 10.0.4.2:3128) ##

```bash
$ docker build \
    --build-arg http_proxy=http://10.0.4.2:3128/ \
    --build-arg https_proxy=http://10.0.4.2:3128/ \
    -t dgricci/proj4:$(< VERSION) .
$ docker tag dgricci/proj4:$(< VERSION) dgricci/proj4:latest
```

## Build command with arguments default values ##

```bash
$ docker build \
    --build-arg PROJ4_VERSION=4.9.3 --build-arg PROJ4_DOWNLOAD_URL=http://download.osgeo.org/proj/proj-4.9.3.zip \
    --build-arg PROJ4_DATUM_VERSION=1.6 --build-arg PROJ4_DATUM_DOWNLOAD_URL=http://download.osgeo.org/proj/proj-datumgrid-1.6.zip \
    -t dgricci/proj4:$(< VERSION) .
$ docker tag dgricci/proj4:$(< VERSION) dgricci/proj4:latest
```

# Use #

See `dgricci/jessie` README for handling permissions with dockers volumes.

```bash
$ docker run --rm dgricci/proj4 proj
Rel. 4.9.3, 15 August 2016
usage: proj [ -bCeEfiIlormsStTvVwW [args] ] [ +opts[=arg] ] [ files ]
```

Using default command :

```bash
$ docker run --rm dgricci/proj4
aea : Albers Equal Area
aeqd : Azimuthal Equidistant
airy : Airy
aitoff : Aitoff
alsk : Mod. Stereographic of Alaska
apian : Apian Globular I
august : August Epicycloidal
bacon : Bacon Globular
bipc : Bipolar conic of western hemisphere
boggs : Boggs Eumorphic
bonne : Bonne (Werner lat_1=90)
calcofi : Cal Coop Ocean Fish Invest Lines/Stations
cass : Cassini
cc : Central Cylindrical
cea : Equal Area Cylindrical
chamb : Chamberlin Trimetric
collg : Collignon
comill : Compact Miller
crast : Craster Parabolic (Putnins P4)
denoy : Denoyer Semi-Elliptical
eck1 : Eckert I
eck2 : Eckert II
eck3 : Eckert III
eck4 : Eckert IV
eck5 : Eckert V
eck6 : Eckert VI
eqc : Equidistant Cylindrical (Plate Caree)
eqdc : Equidistant Conic
euler : Euler
etmerc : Extended Transverse Mercator
fahey : Fahey
fouc : Foucaut
fouc_s : Foucaut Sinusoidal
gall : Gall (Gall Stereographic)
geos : Geostationary Satellite View
gins8 : Ginsburg VIII (TsNIIGAiK)
gn_sinu : General Sinusoidal Series
gnom : Gnomonic
goode : Goode Homolosine
gs48 : Mod. Stereographic of 48 U.S.
gs50 : Mod. Stereographic of 50 U.S.
hammer : Hammer & Eckert-Greifendorff
hatano : Hatano Asymmetrical Equal Area
healpix : HEALPix
rhealpix : rHEALPix
igh : Interrupted Goode Homolosine
imw_p : International Map of the World Polyconic
isea : Icosahedral Snyder Equal Area
kav5 : Kavraisky V
kav7 : Kavraisky VII
krovak : Krovak
labrd : Laborde
laea : Lambert Azimuthal Equal Area
lagrng : Lagrange
larr : Larrivee
lask : Laskowski
lonlat : Lat/long (Geodetic)
latlon : Lat/long (Geodetic alias)
lcc : Lambert Conformal Conic
lcca : Lambert Conformal Conic Alternative
leac : Lambert Equal Area Conic
lee_os : Lee Oblated Stereographic
loxim : Loximuthal
lsat : Space oblique for LANDSAT
mbt_s : McBryde-Thomas Flat-Polar Sine (No. 1)
mbt_fps : McBryde-Thomas Flat-Pole Sine (No. 2)
mbtfpp : McBride-Thomas Flat-Polar Parabolic
mbtfpq : McBryde-Thomas Flat-Polar Quartic
mbtfps : McBryde-Thomas Flat-Polar Sinusoidal
merc : Mercator
mil_os : Miller Oblated Stereographic
mill : Miller Cylindrical
misrsom : Space oblique for MISR
moll : Mollweide
murd1 : Murdoch I
murd2 : Murdoch II
murd3 : Murdoch III
natearth : Natural Earth
natearth2 : Natural Earth 2
nell : Nell
nell_h : Nell-Hammer
nicol : Nicolosi Globular
nsper : Near-sided perspective
nzmg : New Zealand Map Grid
ob_tran : General Oblique Transformation
ocea : Oblique Cylindrical Equal Area
oea : Oblated Equal Area
omerc : Oblique Mercator
ortel : Ortelius Oval
ortho : Orthographic
pconic : Perspective Conic
patterson : Patterson Cylindrical
poly : Polyconic (American)
putp1 : Putnins P1
putp2 : Putnins P2
putp3 : Putnins P3
putp3p : Putnins P3'
putp4p : Putnins P4'
putp5 : Putnins P5
putp5p : Putnins P5'
putp6 : Putnins P6
putp6p : Putnins P6'
qua_aut : Quartic Authalic
qsc : Quadrilateralized Spherical Cube
robin : Robinson
rouss : Roussilhe Stereographic
rpoly : Rectangular Polyconic
sch : Spherical Cross-track Height
sinu : Sinusoidal (Sanson-Flamsteed)
somerc : Swiss. Obl. Mercator
stere : Stereographic
sterea : Oblique Stereographic Alternative
gstmerc : Gauss-Schreiber Transverse Mercator (aka Gauss-Laborde Reunion)
tcc : Transverse Central Cylindrical
tcea : Transverse Cylindrical Equal Area
times : Times
tissot : Tissot
tmerc : Transverse Mercator
tpeqd : Two Point Equidistant
tpers : Tilted perspective
ups : Universal Polar Stereographic
urm5 : Urmaev V
urmfps : Urmaev Flat-Polar Sinusoidal
utm : Universal Transverse Mercator (UTM)
vandg : van der Grinten (I)
vandg2 : van der Grinten II
vandg3 : van der Grinten III
vandg4 : van der Grinten IV
vitk1 : Vitkovsky I
wag1 : Wagner I (Kavraisky VI)
wag2 : Wagner II
wag3 : Wagner III
wag4 : Wagner IV
wag5 : Wagner V
wag6 : Wagner VI
wag7 : Wagner VII
weren : Werenskiold I
wink1 : Winkel I
wink2 : Winkel II
wintri : Winkel Tripel
```

__Et voilà !__


_fin du document[^pandoc_gen]_

[^pandoc_gen]: document généré via $ `pandoc -V fontsize=10pt -V geometry:"top=2cm, bottom=2cm, left=1cm, right=1cm" -s -N --toc -o proj4.pdf README.md`{.bash}
