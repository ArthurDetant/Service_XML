<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

           
   
       <h1>Méteo de  <xsl:value-of select="//location/name"/>, <xsl:value-of select="//location/country"/> <img src="http://openweathermap.org/img/w/{//symbol/@var}.png"/></h1>
       <div class = "coord">Latitude : <xsl:value-of select="//location/location/@latitude"/>
                            Longitude : <xsl:value-of select="//location/location/@longitude"/>
                            Altitude : <xsl:value-of select="//location/location/@altitude"/> </div> 
       <div class = "Temperature"><xsl:value-of select="//temperature/@value"/>°C</div>

   <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="400" height="150">
	   <!-- Abs ord -->
       <line x1="20" y1="95" x2="20" y2="5" style="stroke:rgb(0,0,0);stroke-width:2" />
       <line x1="20" y1="95" x2="390" y2="95" style="stroke:rgb(0,0,0);stroke-width:2" />
       
       <!-- graduations  -->
       <line x1="20" y1="5" x2="25" y2="5" style="stroke:rgb(0,0,0);stroke-width:2" />
       <text x="0" y="15" fill="red">30</text>
       <line x1="20" y1="35" x2="25" y2="35" style="stroke:rgb(0,0,0);stroke-width:2" /> 
       <text x="0" y="45" fill="orange">20</text>
       <line x1="20" y1="65" x2="25" y2="65" style="stroke:rgb(0,0,0);stroke-width:2" />
       <text x="0" y="75" fill="green">10</text>
       <text x="0" y="100" fill="blue">0</text>


       <xsl:variable name="nbForecast" select="count(//time)"/>
       <xsl:variable name="largeurPixel"><xsl:value-of select="370 div $nbForecast "/></xsl:variable>
        

       <xsl:variable name="point">
        <xsl:for-each select="//time">
        
          <xsl:variable name="x">
            <xsl:value-of select ="position() * $largeurPixel + 10"/>
          </xsl:variable>

          <xsl:variable name="yValue">
            <xsl:value-of select="./temperature/@value"/>
          </xsl:variable>

          <xsl:variable name="y"><xsl:value-of select="95 - (90 div 30 * $yValue)"/></xsl:variable>

          <xsl:value-of select="$x"/> <xsl:text>,</xsl:text> <xsl:value-of select="$y"/> <xsl:text> </xsl:text> 
        </xsl:for-each>
       </xsl:variable>
      <polyline fill="none" stroke="blue" points = "{$point}"/>

       <xsl:variable name="sday">
        <xsl:value-of select="substring(//time[1]/@to,1,10)"/>
       </xsl:variable>

      <xsl:variable name="day">
        <xsl:choose>
          <xsl:when test="$sday != substring(//time[2]/@to,1,10)">2</xsl:when>
          <xsl:when test="$sday != substring(//time[3]/@to,1,10)">3</xsl:when>
          <xsl:when test="$sday != substring(//time[4]/@to,1,10)">4</xsl:when>
          <xsl:when test="$sday != substring(//time[5]/@to,1,10)">5</xsl:when>
          <xsl:when test="$sday != substring(//time[6]/@to,1,10)">6</xsl:when>
          <xsl:when test="$sday != substring(//time[7]/@to,1,10)">7</xsl:when>
          <xsl:when test="$sday != substring(//time[8]/@to,1,10)">8</xsl:when>      
          <xsl:otherwise>8</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:variable name="xRate"><xsl:value-of select="370 div $nbForecast"/></xsl:variable>

      <xsl:variable name="x1"><xsl:value-of select="$day * $xRate"/></xsl:variable>
      <xsl:variable name="x2"><xsl:value-of select="(8 * $xRate)+($day * $xRate)"/></xsl:variable>
      <xsl:variable name="x3"><xsl:value-of select="(16 * $xRate)+($day * $xRate)"/></xsl:variable>
      <xsl:variable name="x4"><xsl:value-of select="(24 * $xRate)+($day * $xRate)"/></xsl:variable>
      <xsl:variable name="x5"><xsl:value-of select="(32 * $xRate)+($day * $xRate)"/></xsl:variable>
      
      <!-- dates + graduations  -->
      <line x1="{$x1}" y1="90" x2="{$x1}" y2="95" style="stroke:rgb(0,0,0);stroke-width:2" />
      <text x="{$x1}" y="115" fill="black"><xsl:value-of select="substring(//time[1]/@to,9,2)"/>/<xsl:value-of select="substring(//time[1]/@to,6,2)"/></text>

      <line x1="{$x2}" y1="90" x2="{$x2}" y2="95" style="stroke:rgb(0,0,0);stroke-width:2" />
      <text x="{$x2}" y="115" fill="black"> <xsl:value-of select="substring(//time[1]/@to,9,2)+1"/>/<xsl:value-of select="substring(//time[1]/@to,6,2)"/> </text>

      <line x1="{$x3}" y1="90" x2="{$x3}" y2="95" style="stroke:rgb(0,0,0);stroke-width:2" />
      <text x="{$x3}" y="115" fill="black"> <xsl:value-of select="substring(//time[1]/@to,9,2)+2"/>/<xsl:value-of select="substring(//time[1]/@to,6,2)"/> </text>

      <line x1="{$x4}" y1="90" x2="{$x4}" y2="95" style="stroke:rgb(0,0,0);stroke-width:2" />
      <text x="{$x4}" y="115" fill="black"> <xsl:value-of select="substring(//time[1]/@to,9,2)+3"/>/<xsl:value-of select="substring(//time[1]/@to,6,2)"/> </text>

      <line x1="{$x5}" y1="90" x2="{$x5}" y2="95" style="stroke:rgb(0,0,0);stroke-width:2" />
      <text x="{$x5}" y="115" fill="black"> <xsl:value-of select="substring(//time[1]/@to,9,2)+4"/>/<xsl:value-of select="substring(//time[1]/@to,6,2)"/> </text>


            
      </svg>


    
      


        
    </xsl:template>

</xsl:stylesheet>
