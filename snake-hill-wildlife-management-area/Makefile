AERIAL_INCLUDE=/home/masneyb/data/code/postgis-data-importer/download/us_wv/aerial/USDA-2014/2014.map

# List of paths the font file can be installed in. Pick the
# first one that is present. /bin/false is there for the process
# to fail if no suitable font could be found.
FONT=`find \
	"/usr/share/fonts/gnu-free/FreeSansBold.ttf" \
	"/usr/share/fonts/truetype/freefont/FreeSansBold.ttf" \
	"/bin/false" \
	2>/dev/null \
	| head -n 1`

EXTENT=-79.829027 39.609289 -79.811701 39.625199

DBNAME=wvgis

.PHONY: clean

all: snake-hill-topo-map.jpg snake-hill-aerial-map.jpg gpx/snake_hill_trails.gpx pgsql/snake_hill_trails.sql

snake-hill-topo-map.jpg: topo.map.in shp/snake_hill_trails.shp shp/snake_hill_trails.shp
	cat topo.map.in | sed s/__DBNAME__/"${DBNAME}"/ > topo.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m topo.map -e ${EXTENT} -o snake-hill-topo-map.jpg

snake-hill-aerial-map.jpg: aerial.map.in shp/snake_hill_trails.shp shp/snake_hill_trails.shp
	cat aerial.map.in | sed s/__DBNAME__/"${DBNAME}"/ | sed s%__AERIAL_INCLUDE__%${AERIAL_INCLUDE}% > aerial.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m aerial.map -e ${EXTENT} -o snake-hill-aerial-map.jpg

gpx/snake_hill_trails.gpx: shp/snake_hill_trails.shp
	rm -f gpx/snake_hill_trails.gpx
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/snake_hill_trails.gpx shp/snake_hill_trails.shp

pgsql/snake_hill_trails.sql: shp/snake_hill_trails.shp
	shp2pgsql -s 4326 -g geom shp/snake_hill_trails.shp snake_hill_trails > pgsql/snake_hill_trails.sql

clean:
	rm -f topo.map aerial.map fonts.list
