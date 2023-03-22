<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="prop">
        <xsl:variable name="iri" select="@iri"/>
        <xsl:element name="prop">
            <xsl:attribute name="count">
                <xsl:value-of select="count(//prop[@iri = $iri])"/>
            </xsl:attribute>
            <xsl:attribute name="iri">
                <xsl:value-of select="@iri"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
