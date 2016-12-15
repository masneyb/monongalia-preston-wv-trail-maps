AERIAL_INCLUDE=/home/masneyb/data/code/postgis-data-importer/download/us_wv/aerial/USDA-2014/2014.map
HILLSHADE_INCLUDE=/home/masneyb/data/code/postgis-data-importer/download/us_wv/hillshade/hillshade.map

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

all: snake-hill-topo-map.jpg snake-hill-aerial-map.jpg snake-hill-hillshade-map.jpg gpx/snake_hill_trails.gpx pgsql/snake_hill_trails.sql

snake-hill-topo-map.jpg: ../wv.map.in shp/snake_hill_trails.shp shp/snake_hill_trails.shp
	cat ../wv.map.in | sed s/__DBNAME__/"${DBNAME}"/ | sed s%__INCLUDE__%% | sed "s/__TRAIL_COLOR__/0 0 0/" | sed s/__CONTOUR_STATUS__/ON/ | sed s/__POLYGON_STATUS__/ON/ > wv.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m wv.map -e ${EXTENT} -o snake-hill-topo-map.jpg

snake-hill-aerial-map.jpg: ../wv.map.in shp/snake_hill_trails.shp shp/snake_hill_trails.shp
	cat ../wv.map.in | sed s/__DBNAME__/"${DBNAME}"/ | sed "s%__INCLUDE__%  INCLUDE \"${AERIAL_INCLUDE}\""% | sed "s/__TRAIL_COLOR__/0 0 0/" | sed s/__CONTOUR_STATUS__/ON/ | sed s/__POLYGON_STATUS__/OFF/ > wv.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m wv.map -e ${EXTENT} -o snake-hill-aerial-map.jpg

snake-hill-hillshade-map.jpg: ../wv.map.in shp/snake_hill_trails.shp shp/snake_hill_trails.shp
	cat ../wv.map.in | sed s/__DBNAME__/"${DBNAME}"/ | sed "s%__INCLUDE__%  INCLUDE \"${HILLSHADE_INCLUDE}\""% | sed "s/__TRAIL_COLOR__/255 0 0/" | sed s/__CONTOUR_STATUS__/OFF/ | sed s/__POLYGON_STATUS__/OFF/ > wv.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m wv.map -e ${EXTENT} -o snake-hill-hillshade-map.jpg

gpx/snake_hill_trails.gpx: shp/snake_hill_trails.shp
	rm -f gpx/snake_hill_trails.gpx
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/snake_hill_trails.gpx shp/snake_hill_trails.shp

pgsql/snake_hill_trails.sql: shp/snake_hill_trails.shp
	shp2pgsql -s 4326 -g geom shp/snake_hill_trails.shp snake_hill_trails > pgsql/snake_hill_trails.sql

clean:
	rm -f wv.map fonts.list
