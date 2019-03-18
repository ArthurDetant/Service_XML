<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <h1>Message :</h1>
	<div>
		<xsl:value-of select="/civilisations/civilisation/Nom"/>
	</div>
  </xsl:template>
</xsl:stylesheet>
