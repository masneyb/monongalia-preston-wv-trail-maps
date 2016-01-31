# Monongalia and Preston County, WV Trail Maps

This repository contains SHP files and maps generated using
[Mapserver](http://mapserver.org/) for some select trails in Monongalia
and Preston County, WV. This data was collected over several years while
running and mountain biking in the area. [Quantum GIS](qgis.org) was
used to clean up the source data.


## Coopers Rock State Forest map

![Coopers Rock map](coopers-rock-state-forest/coopers-rock-map.jpg?raw=1 "Coopers Rock map")


## How to compile

You can build these maps with the following procedure if you have other
data that you'd like to add to the map:

* Clone the [postgis-data-importer](https://github.com/masneyb/postgis-data-importer)
  project.
* Download the Lake Lynn, PA/WV and Masontown, WV digital elevation models (DEMs) from
  the [West Virginia GIS Technical Center](http://wvgis.wvu.edu/) into the
  postgis-data-importer project so that the 100 foot and 20 foot contour intervals
  can be generated.
  - `cd postgis-data-importer/download/us_wv/dem/`
  - `wget ftp://ftp.wvgis.wvu.edu/pub/Clearinghouse/elevation/3MeterDEM_SAMB_2003_utm83/tiff/zipped/lake_lynn_pa_wv_USGSAndSAMB_2003_utm83_tif.zip`
  - `wget ftp://ftp.wvgis.wvu.edu/pub/Clearinghouse/elevation/3MeterDEM_SAMB_2003_utm83/tiff/zipped/masontown_wv_USGSAndSAMB_2003_utm83_tif.zip`
* Run `cd ../../ && make` in the postgis-data-importer project to create the _wvgis_
  postgresql database.
* Install mapserver and required font
  - RedHat/Fedora: `sudo dnf install mapserver gnu-free-sans-fonts`
  - Debian/Ubuntu: `sudo apt-get install mapserver-bin ttf-freefont`
* Change into the relevant subdirectory in this project and build the map:
  `make`.

