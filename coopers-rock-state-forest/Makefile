# List of paths the font file can be installed in. Pick the
# first one that is present. /bin/false is there for the process
# to fail if no suitable font could be found.
FONT=`find \
	"/usr/share/fonts/gnu-free/FreeSansBold.ttf" \
	"/usr/share/fonts/truetype/freefont/FreeSansBold.ttf" \
	"/bin/false" \
	2>/dev/null \
	| head -n 1`

SOUTH_EXTENT=-79.84496 39.61941 -79.76192 39.66164

DBNAME=wvgis

.PHONY: topo aerial gpx clean

all: topo gpx aerial

topo:
	cat topo.map.in | sed s/__DBNAME__/"${DBNAME}"/ > topo.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m topo.map -e ${SOUTH_EXTENT} -o coopers-rock-south-topo-map.jpg

aerial:
	cat aerial.map.in | sed s/__DBNAME__/"${DBNAME}"/ > aerial.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m aerial.map -e ${SOUTH_EXTENT} -o coopers-rock-south-aerial-map.jpg

gpx:
	rm -f gpx/coopers_rock_trails.gpx gpx/coopers_rock_places.gpx
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/coopers_rock_trails.gpx shp/coopers_rock_trails.shp
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/coopers_rock_places.gpx shp/coopers_rock_places.shp

clean:
	rm -f topo.map aerial.map fonts.list
