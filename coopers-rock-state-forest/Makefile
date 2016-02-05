# List of paths the font file can be installed in. Pick the
# first one that is present. /bin/false is there for the process
# to fail if no suitable font could be found.
FONT=`find \
	"/usr/share/fonts/gnu-free/FreeSansBold.ttf" \
	"/usr/share/fonts/truetype/freefont/FreeSansBold.ttf" \
	"/bin/false" \
	2>/dev/null \
	| head -n 1`

DBNAME=wvgis

.PHONY: map gpx clean

all: map gpx

map:
	cat coopers.map.in | sed s/__DBNAME__/"${DBNAME}"/ > coopers.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m coopers.map -e -79.84496 39.61941 -79.76192 39.66164 -o coopers-rock-south-map.jpg

gpx:
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/coopers_rock_trails.gpx shp/coopers_rock_trails.shp
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/coopers_rock_places.gpx shp/coopers_rock_places.shp

clean:
	rm -f coopers.map fonts.list
