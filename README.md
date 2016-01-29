# coopers-rock-trails

SHP file for a large number of the trails at Coopers Rock State Forest
in Monongalia and Preston Counties, WV. I collected this data over several
years while running and mountain biking on the extensive trail system there.
I used [Quantum GIS](qgis.org) to clean up my source data.


## How to compile

* Clone the [postgis-data-importer](https://github.com/masneyb/postgis-data-importer)
  project.
* Download the Lake Lynn, PA/WV and Masontown, WV digital elevation models (DEMs) from
  the [West Virginia GIS Technical Center](http://wvgis.wvu.edu/) into the
  postgis-data-importer project.
  - `wget ftp://ftp.wvgis.wvu.edu/pub/Clearinghouse/elevation/3MeterDEM_SAMB_2003_utm83/tiff/zipped/lake_lynn_pa_wv_USGSAndSAMB_2003_utm83_tif.zip -O download/us_wv/dem/lake_lynn_pa_wv_USGSAndSAMB_2003_utm83_tif.zip`
  - `wget ftp://ftp.wvgis.wvu.edu/pub/Clearinghouse/elevation/3MeterDEM_SAMB_2003_utm83/tiff/zipped/masontown_wv_USGSAndSAMB_2003_utm83_tif.zip -O download/us_wv/dem/masontown_wv_USGSAndSAMB_2003_utm83_tif.zip`
* Run `make` in the postgis-data-importer project to create the _wvgis_
  postgresql database. This will generate the 100 foot and 20 foot contour
  lines based on the digital elevation models (DEMs) downloaded above.
* Install mapserver and required font
  - RedHat/Fedora: `sudo dnf install mapserver gnu-free-sans-fonts`
  - Debian/Ubuntu: `sudo apt-get install mapserver-bin`
* Change into this project directory and build the map: `make`


## Map

![Coopers Rock map](coopers-rock-map.jpg?raw=1 "Coopers Rock map")

