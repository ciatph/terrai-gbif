## rasters

This directory contains R-rendered GeoTIFF raster files of GBIF endangered species overlayed on top of Terra-i deforestation. Generated from `gbif_v3.R`.

These raster files are to be uploaded into `GeoServer` instance running in your local PC or other online hosting services. Please refer to the following guidelines for uploading the rasters:


### Raster Files Upload

GeoServer has various installation methods for different OS platforms in this [link](http://docs.geoserver.org/stable/en/user/installation/win_installer.html) instructions. 

(GeoServer + Apache Tomcat 8.5) 

For this project, we installed GeoServer with Apache Tomcat. More of its installation methods can be read from [here](https://geoserver.geo-solutions.it/edu/en/install_run/gs_install.html).

1. Install [GeoServer](http://geoserver.org/) locally in your machine or in your online server. 

2. Create a workspace in GeoServer named `terrai-gbif`.
	- Type the following for the **Namespace URI:** <br> 
		- for GeoServer hosted online _**Microsoft Azure**_ <br>
		`<PROJECT_NAME>.azurewebsites.net/geoserver/terrai-gbif` 
		- for GeoServer hosted in _**localhost**_ <br>
		`http://localhost:8080/geoserver/terrai-gbif` 
	- Check the *Set as Default Workspace* checkbox
	
3. Upload GeoServer styles for rasters from `sld-styles`, using their filenames as names for the styles themselves. Use the `terrai-gbif` for workspace.

	- terrai-base.sld
	- terrai-species.sld
	- terra-add.sld
	
4. Upload the Geotiff files as **GeoTIFF Data Store**. For more information, see [Creating Geotiff Data Stores](https://geoserver.geo-solutions.it/edu/en/adding_data/add_geotiff.html). 
	- for GeoServer hosted online _**Microsoft Azure**_ <br>
		- Upload the GeoTiff files via FTP to <br> `/site/wwwroot/bin/apache-tomcat-8.5.24/webapps/geoserver/data/data/raster/`
	- for GeoServer hosted in _**localhost**_: Put the GeoTiff files anywhere in your hard drive.
		
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

	- `terrai-base.sld` = asia\_Terra-I\_resampled\_fromedit, latin\_terra\_I\_resamp\_fromedit
	- `terra-add` = all rasters ending in \***\__add**_
	- `terrai-species` = the rest of the rasters



@ciatph <br>
**Date Created:** 20181108 <br>
**Date Created:** 20181108 <br>