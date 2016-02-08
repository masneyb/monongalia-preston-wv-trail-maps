# Monongalia and Preston County, WV Trail Maps

This repository contains SHP files, GPX files, and maps generated using
[Mapserver](http://mapserver.org/) for some select trails in Monongalia
and Preston County, WV. This data was collected over several years while
running and mountain biking in the area. [Quantum GIS](qgis.org) was
used to clean up the source data.


## Coopers Rock State Forest - South map

![Coopers Rock South Map](coopers-rock-state-forest/coopers-rock-south-topo-map.jpg?raw=1 "Coopers Rock South Map")

Aerial images are also generated but they are not checked into this
repository due to their size.


## How to compile

You can build these maps with the following procedure if you have other
data that you'd like to add to the map:

* Clone the [postgis-data-importer](https://github.com/masneyb/postgis-data-importer)
  project.
* You will only need the the Lake Lynn, PA/WV and Masontown, WV digital
  elevation models (DEMs) and aerial imagery. The others can be commented
  out from the postgis-data-importer import script.
* Run `cd ../../ && make` in the postgis-data-importer project to create the _wvgis_
  postgresql database.
* Install mapserver and required font
  - RedHat/Fedora: `sudo dnf install mapserver gnu-free-sans-fonts`
  - Debian/Ubuntu: `sudo apt-get install mapserver-bin ttf-freefont`
* Change into the relevant subdirectory in this project and edit the 
  parameters at the top of the Makefile. Namely, you'll need to update
  the path to the generated Mapserver file for the aerial imagery.
* Build the map: `make`.
* Note: The GPX files are dynamically generated from the SHP files.
