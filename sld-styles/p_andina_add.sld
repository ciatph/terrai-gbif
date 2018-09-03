<?xml version="1.0" ?>
<sld:StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:gml="http://www.opengis.net/gml" xmlns:ogc="http://www.opengis.net/ogc" xmlns:sld="http://www.opengis.net/sld">
    <sld:UserLayer>
        <sld:LayerFeatureConstraints>
            <sld:FeatureTypeConstraint/>
        </sld:LayerFeatureConstraints>
        <sld:UserStyle>
            <sld:Name>p_andina_add</sld:Name>
            <sld:Title/>
            <sld:FeatureTypeStyle>
                <sld:Name/>
                <sld:Rule>
                    <sld:RasterSymbolizer>
                        <sld:Geometry>
                            <ogc:PropertyName>grid</ogc:PropertyName>
                        </sld:Geometry>
                        <sld:Opacity>1</sld:Opacity>
                        <sld:ColorMap>
                            <sld:ColorMapEntry color="#d7191c" label="0" opacity="0.0" quantity="0"/>
                            <sld:ColorMapEntry color="#fc8d59" label="0.5" opacity="1.0" quantity="0.5"/>
                            <sld:ColorMapEntry color="#00ff00" label="1" opacity="1.0" quantity="1"/>
                            <sld:ColorMapEntry color="#abdda4" label="1.5" opacity="1.0" quantity="1.5"/>
                            <sld:ColorMapEntry color="#2b83ba" label="2" opacity="1.0" quantity="2"/>
                        </sld:ColorMap>
                    </sld:RasterSymbolizer>
                </sld:Rule>
            </sld:FeatureTypeStyle>
        </sld:UserStyle>
    </sld:UserLayer>
</sld:StyledLayerDescriptor>
