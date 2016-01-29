FONT=/usr/share/fonts/gnu-free/FreeSansBold.ttf
DBNAME=wvgis

map:
	cat coopers.map.in | sed s/__DBNAME__/"${DBNAME}"/ > coopers.map
	echo "opensymbol ${FONT}" > fonts.list
	shp2img -m coopers.map -o coopers-rock-map.jpg -e -79.84496 39.61941 -79.76192 39.66164

clean:
	rm -f coopers.map fonts.list
