<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <h1>Généré par le XSLT</h1>
		<h2>Meteo de <xsl:value-of select = "/weatherdata/location/name"></xsl:value-of> (<xsl:value-of select = "/weatherdata/location/country"></xsl:value-of>)</h2>
		<h3>Altitude: <xsl:value-of select = "/weatherdata/location/location/@altitude"></xsl:value-of> Latitude: <xsl:value-of select = "/weatherdata/location/location/@latitude"></xsl:value-of> Longitude: <xsl:value-of select = "/weatherdata/location/location/@longitude"></xsl:value-of></h3>
		<h3>Température: <xsl:value-of select = "/weatherdata/forecast/time/temperature/@value"></xsl:value-of>°C</h3>
		<h3>Vent: <xsl:value-of select = "/weatherdata/forecast/time/windDirection/@name"></xsl:value-of></h3>
		<h3>Météo actuelle: <xsl:value-of select = "/weatherdata/forecast/time/symbol/@name"></xsl:value-of></h3>
		<img src="http://openweathermap.org/img/w/{//symbol/@var}.png"/>
		
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="1000" height="1000">
		<rect x="50" y="10" width="100" height="40" rx="15" style="stroke:#000"/>
		</svg> 
    
    
    </xsl:template>
    


</xsl:stylesheet>

