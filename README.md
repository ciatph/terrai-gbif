# terrai-gbif


A data visualization tool developed for the [2018 Ebbe Nielsen Challenge](https://www.gbif.org/news/1GQURfK5jS4Iq4O06Y0EK4/2018-gbif-ebbe-nielsen-challenge-seeks-open-data-innovations-for-biodiversity) that overlays modeled GBIF species loss data over [Terra-i's](http://terra-i.org/terra-i.html) deforestation information for closer look-up and information.

Figshare [link](https://figshare.com/s/0b556b9d4c4a5d6f0e9c)

## Introduction

*Here we present a methodology and a prototype tool powered by machine learning algorithms that allows for near real time threat (and loss) monitoring of vulnerable plant species, using open data (ground-truthed and remotely sensed). Improvements in machine learning algorithms and access to high quality remotely sensed data (top down) has enabled “remote” monitoring of the earth’s status. The applicability of insights obtained can be further improved by incorporating ground truthed (bottom up) data. The proposed tool leverages upon the ease at which one can access GBIF’s high quality spatialized data in a standardized format at scale, further augments this with remote sensing data and machine learning algorithms in order to monitor threat status of plant species. This tool mashes multiple datasets, merges geospatial layers, to generate new insights, and provides a new use case of open data, further supporting the call for FAIR (Findable, Accessible, Interoperable and Reusable) data. Biodiversity monitoring is central to Sustainable Development Agenda, we propose to use this case-study as an example to promote spatialization and FAIR access of national biodiversity records currently held by various government agencies.*
> 
> \- d.burra@cgiar.org & CIAT team


## Website Installation/Usage

The geoTiff files have been previously modeled and generated by algorithms mentioned in the Introduction. Please refer to `gbif_v3.R` for more details.

### Prerequisites

1. Generate raster (GeoTiff) files of species and deforestation generated from the modeling process and Terra-i. 
2. NodeJS installed in your machine.
3. A stable internet connection for fetching the hosted rasters online.

#### Optional Prerequisites

Do the following steps if you will want to run the GeoServer map server and WMS itself in your local PC or an external online server. GeoServer has various installation methods for different OS platforms in this [link](http://docs.geoserver.org/stable/en/user/installation/win_installer.html) instructions. 

(GeoServer + Apache Tomcat 8.5) 

For this project, we installed GeoServer with Apache Tomcat. More of its installation methods can be read from [here](https://geoserver.geo-solutions.it/edu/en/install_run/gs_install.html).

1. Install [GeoServer](http://geoserver.org/) locally in your machine or in your online server. 

2. Create a workspace in GeoServer named `terrai-gbif`.
	- Type the following for the **Namespace URI:** <br> 
		- for GeoServer hostedonline Microsoft Azure <br>
		`<PROJECT_NAME>.azurewebsites.net/geoserver/terrai-gbif` 
		- for GeoServer hoster in localhost <br>
		`http://localhost:8080/geoserver/terrai-gbif` 
	- Check the *Set as Default Workspace* checkbox
	
3. Upload GeoServer styles for rasters from `sld-styles`, using their filenames as names for the styles themselves. Use the `terrai-gbif` for workspace.

	- terrai-base.sld
	- terrai-species.sld
	- terra-add.sld
	
4. Upload the Geotiff files as **GeoTIFF Data Store**. For more information, see [Creating Geotiff Data Stores](https://geoserver.geo-solutions.it/edu/en/adding_data/add_geotiff.html). 

	 - Upload the GeoTiff files via FTP to <br> `/site/wwwroot/bin/apache-tomcat-8.5.24/webapps/geoserver/data/data/raster/`
	 - NOTE: Rename the geotiff files such that they have no spaces in between before setting as data source. Make sure they are named as follows to be referenced in the same naming convention used as in the website codes (or you can edit them in the website codes from `main.js: initializeMaps()`):

			(ASIA)
			asia_Terra-I_resampled_fromedit.tif
			picea_add.tif
			picea_asperata.tif
			taiwania_cryptomerioides.tif
			taiwania_add.tif

			(SOUTH AMERICA)
			latin_terra_I_resamp_fromedit.tif
			p_andina_add.tif
			p_salignus_add.tif
			p_uviferum_add.tif
			pilgerodendron_uviferum.tif 	
			podocarpus_salignus.tif 
			prumnopitys_andina.tif => p_andina.tif

5. Apply the uploaded *.sld styles* to the GeoTiffs.  This can be accessed by setting the **Default Style** in the _**Publishing**_ tab.  Detailed instructions can be read in the [publishing tutorial](http://docs.geoserver.org/latest/en/user/gettingstarted/shapefile-quickstart/index.html) tutorial. Set the following sld styles to their corresponding GeoTiffs:

	- `terrai-base.sld` = asia_Terra-I_resampled_fromedit, latin_terra_I_resamp_fromedit
	- `terra-add` = all rasters ending in \***\__add**_
	- `terrai-species` = the rest of the rasters

6. Change the following lines from `js/map.js`to enable reading rasters from the local GeoServer. Change `ONLINE: true` to `ONLINE: false`:

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

### Embedding the Matomo Website analytics Widget

The website uses a self-hosted [**matomo**](https://matomo.org/) instance running on a *free tier* [000webhost](https://www.000webhost.com/) account. Matomo is an open-source analytics platform that have options for paid versions. Data analytics can be accessed by embedding the following iframe into a website's body:


	<div id="widgetIframe"><iframe width="100%" height="750" src="https://ciatph.000webhostapp.com/analytics/index.php?module=Widgetize&action=iframe&containerId=VisitOverviewWithGraph&widget=1&moduleToWidgetize=CoreHome&actionToWidgetize=renderWidgetContainer&idSite=2&period=day&date=2018-09-10&disableLink=1&widget=1&updated=1" scrolling="no" frameborder="0" marginheight="0" marginwidth="0"></iframe></div>

The self-hosted instance can be accessed by approved at [https://ciatph.000webhostapp.com/analytics](https://ciatph.000webhostapp.com/analytics). An in-depth tutorial, installation and usage guide for Matomo can be read from [here](https://github.com/ciatph/pagemetrics). 


<br>

**Date Created:** 20180905<br>
**Date Modified:** 20180910