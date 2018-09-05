# terrai-gbif


A data visualization tool developed for the [2018 Ebbe Nielsen Challenge](https://www.gbif.org/news/1GQURfK5jS4Iq4O06Y0EK4/2018-gbif-ebbe-nielsen-challenge-seeks-open-data-innovations-for-biodiversity) that overlays modeled GBIF species loss data over [Terra-i's](http://terra-i.org/terra-i.html) deforestation information for closer look-up and information.

Figshare [link](https://figshare.com/s/0b556b9d4c4a5d6f0e9c)

## Introduction

*Here we present a methodology and a prototype tool powered by machine learning algorithms that allows for near real time threat (and loss) monitoring of vulnerable plant species, using open data (ground-truthed and remotely sensed). Improvements in machine learning algorithms and access to high quality remotely sensed data (top down) has enabled “remote” monitoring of the earth’s status. The applicability of insights obtained can be further improved by incorporating ground truthed (bottom up) data. The proposed tool leverages upon the ease at which one can access GBIF’s high quality spatialized data in a standardized format at scale, further augments this with remote sensing data and machine learning algorithms in order to monitor threat status of plant species. This tool mashes multiple datasets, merges geospatial layers, to generate new insights, and provides a new use case of open data, further supporting the call for FAIR (Findable, Accessible, Interoperable and Reusable) data. Biodiversity monitoring is central to Sustainable Development Agenda, we propose to use this case-study as an example to promote spatialization and FAIR access of national biodiversity records currently held by various government agencies.*
> 
> \- d.burra@cgiar.org & CIAT team


## Website Installation/Usage

### Prerequisites

1. Raster (GeoTiff) files of species and deforestation generated from the modeling process and Terra-i.
2. NodeJS installed in your machine.
3. A stable internet connection for fetching the hosted rasters online.

#### Optional Prerequisites

Do the following steps if you will want to run the GeoServer map server and WMS itself in your local PC or an external online server. For more information, see GeoServer's [installation](http://docs.geoserver.org/stable/en/user/installation/win_installer.html) instructions.

1. Install [GeoServer](http://geoserver.org/) locally in your machine or in your online server. 
2. Create a workspace in GeoServer named `terrai-gbif`.
3. Upload GeoServer styles for rasters from `sld-styles`, using their filenames as names for the styles themselves. Use the `terrai-gbif` for workspace.
	- terrai-base.sld
	- terrai-species.sld
	- terra-add.sld
4. Upload the Geotiff files as **GeoTIFF Data Store**. For more information, see [Creating Geotiff Data Stores](https://geoserver.geo-solutions.it/edu/en/adding_data/add_geotiff.html). NOTE: Rename the geotiff files such that they have no spaces in between before setting as data source. Make sure they are named as follows to be referenced in the same naming convention used as in the website codes (or you can edit them in the website codes from `main.js: initializeMaps()`):

		asia_Terra-I_resampled_fromedit.tif
		picea_add.tif
		picea_asperata.tif
		taiwania_cryptomerioides.tif
		taiwania_add.tif
		latin_terra_I_resamp_fromedit.tif
		p_andina_add.tif
		p_andina_add_skype.tif
		p_salignus_add.tif
		p_uvi_add.tif
		pilgerodendron_uviferum.tif
		podocarpus_salignus.tif
		prumnopitys_andina.tif

5. Change the following lines from `js/map.js`to enable reading rasters from the local GeoServer. Change `ONLINE: true` to `ONLINE: false`:

		const SETTINGS = {
		    // flag to use the online or local maps GeoServer
		    ONLINE: true  // CHANGE true TO false
		};

### Accessing the Rasters from the Online GeoServer WMS

The raster layers can be accessed from the GeoServer instance hosted on [http://terrai-gbif.azurewebsites.net/](http://terrai-gbif.azurewebsites.net/) for this project.

The WMS and list of available rasters can be accessed by web mapping frameworks such as leafletJS through the a `GetCapabilities` request from GeoServer:

`http://terrai-gbif.azurewebsites.net/geoserver/wcs?SERVICE=WCS&REQUEST=GetCapabilities&VERSION=2.0.1`

### Local Website Installation (Running this website from your PC)

1. Clone or download this repository into your desktop.
2. Navigate inside the cloned directory using the command line, then run `npm install`
3. Using the command line, run `http-server`
4. Copy any of the links that will be generated and paste it in your browser.

<br>

**Date Created:** 20180905<br>
**Date Modified:** 20180905 