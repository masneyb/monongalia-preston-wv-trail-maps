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

map:
	cat coopers.map.in | sed s/__DBNAME__/"${DBNAME}"/ > coopers.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m coopers.map -o coopers-rock-map.jpg -e -79.84496 39.61941 -79.76192 39.66164

clean:
	rm -f coopers.map fonts.list
