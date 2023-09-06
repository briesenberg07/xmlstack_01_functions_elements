<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xmls="https://briesenberg07.github.io/xml_stack/" 
    xmlns:datacite="http://datacite.org/schema/kernel-4"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <get_stuff_from_collection>
            <!-- **RE: syntax '?select=*.xml' see
            https://www.saxonica.com/documentation12/index.html#!sourcedocs/collections/collection-directories -->
            <xsl:apply-templates select="collection('../../uwlswd/DataCite/?select=*.xml')/datacite:resource/datacite:titles/datacite:title"/>
        </get_stuff_from_collection>
    </xsl:template>
    <xsl:template match="datacite:title">
        <xsl:for-each select=".">
            <label>
                <xsl:value-of select="."/>
            </label>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
