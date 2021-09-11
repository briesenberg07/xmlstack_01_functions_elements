<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    version="3.0">

    <xsl:output method="text"/>
    
    <!-- I made this map (I think)... -->
    <xsl:variable name="acronyms" as="map(*)">
        <xsl:map>
            <xsl:map-entry key="'YAYA'" select="'You And Your Acronyms'"/>
            <xsl:map-entry key="'HT'" select="'Hello There'"/>
        </xsl:map>
    </xsl:variable>

    <!-- ...I don't know what to do with it -->
    <xsl:template match="/">
        <xsl:value-of select="map:find($acronyms, 'YAYA')"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="map:get($acronyms, 'YAYA')"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="map:contains($acronyms, 'HT')"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="map:contains($acronyms, 'TGIF')"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="map:keys($acronyms)"/>
        <xsl:text>&#xA;</xsl:text>
        <!-- ... see https://www.w3.org/TR/xpath-functions-31/#map-functions -->
    </xsl:template>
</xsl:stylesheet>
