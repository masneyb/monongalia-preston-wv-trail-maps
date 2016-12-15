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

EXTENT=-79.84496 39.61941 -79.76192 39.66164

DBNAME=wvgis

.PHONY: clean

all: coopers-rock-south-topo-map.jpg coopers-rock-south-aerial-map.jpg coopers-rock-south-hillshade-map.jpg gpx/coopers_rock_trails.gpx gpx/coopers_rock_places.gpx pgsql/coopers_rock_trails.sql pgsql/coopers_rock_places.sql

coopers-rock-south-topo-map.jpg: ../wv.map.in shp/coopers_rock_trails.shp shp/coopers_rock_trails.shp
	cat ../wv.map.in | sed s/__DBNAME__/"${DBNAME}"/ | sed s%__INCLUDE__%% | sed "s/__TRAIL_COLOR__/0 0 0/" | sed s/__CONTOUR_STATUS__/ON/ | sed s/__POLYGON_STATUS__/ON/ > wv.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m wv.map -e ${EXTENT} -o coopers-rock-south-topo-map.jpg

coopers-rock-south-aerial-map.jpg: ../wv.map.in shp/coopers_rock_trails.shp shp/coopers_rock_trails.shp
	cat ../wv.map.in | sed s/__DBNAME__/"${DBNAME}"/ | sed "s%__INCLUDE__%  INCLUDE \"${AERIAL_INCLUDE}\""% | sed "s/__TRAIL_COLOR__/0 0 0/" | sed s/__CONTOUR_STATUS__/ON/ | sed s/__POLYGON_STATUS__/OFF/ > wv.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m wv.map -e ${EXTENT} -o coopers-rock-south-aerial-map.jpg

coopers-rock-south-hillshade-map.jpg: ../wv.map.in shp/coopers_rock_trails.shp shp/coopers_rock_trails.shp
	cat ../wv.map.in | sed s/__DBNAME__/"${DBNAME}"/ | sed "s%__INCLUDE__%  INCLUDE \"${HILLSHADE_INCLUDE}\""% | sed "s/__TRAIL_COLOR__/255 0 0/" | sed s/__CONTOUR_STATUS__/OFF/ | sed s/__POLYGON_STATUS__/OFF/ > wv.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m wv.map -e ${EXTENT} -o coopers-rock-south-hillshade-map.jpg

gpx/coopers_rock_trails.gpx: shp/coopers_rock_trails.shp
	rm -f gpx/coopers_rock_trails.gpx
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/coopers_rock_trails.gpx shp/coopers_rock_trails.shp

gpx/coopers_rock_places.gpx: shp/coopers_rock_places.shp
	rm -f gpx/coopers_rock_places.gpx
	ogr2ogr -dsco GPX_USE_EXTENSIONS=true -f GPX gpx/coopers_rock_places.gpx shp/coopers_rock_places.shp

pgsql/coopers_rock_trails.sql: shp/coopers_rock_trails.shp
	shp2pgsql -s 4326 -g geom shp/coopers_rock_trails.shp coopers_rock_trails > pgsql/coopers_rock_trails.sql

pgsql/coopers_rock_places.sql: shp/coopers_rock_places.shp
	shp2pgsql -s 4326 -g geom shp/coopers_rock_places.shp coopers_rock_places > pgsql/coopers_rock_places.sql

clean:
	rm -f wv.map fonts.list
