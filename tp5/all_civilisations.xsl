<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>
<xsl:template match="/">
	<xsl:text>NomCivilisation NbSoldatsCAC NbSoldatsDist NbSoldatsCavalerie NbSoldatsPoudre NbTechs</xsl:text>.
<xsl:for-each select="/civilisations/civilisation/Nom">	
	<xsl:value-of select="." />,<xsl:value-of select="count(../Unites/Unite/StatsCAC)"/>, <xsl:value-of select="count(../Unites/Unite/StatsDist)"/>, <xsl:value-of select="count(../Unites/Unite/type[.='Cavalerie'])"/>,<xsl:value-of select="count(../Unites/Unite/type[.='Poudre'])"/>,<xsl:value-of select="count(../TechTree/Tech)"/>.
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>    
