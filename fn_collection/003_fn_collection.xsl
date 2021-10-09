<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xmls="https://briesenberg07.github.io/xml_stack/" 
    version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <get_stuff_from_collection>
            <!-- **syntax '?select=*.xml' is copied from a working example of fn:collection 
                and I don't actually understand how it works** -->
            <xsl:apply-templates select="collection('../docs/?select=*.xml')/xmls:doc"/>
        </get_stuff_from_collection>
    </xsl:template>
    <xsl:template match="xmls:doc">
        <xsl:for-each select=".">
            <label>
                <xsl:value-of select="xmls:info/xmls:label"/>
            </label>
        </xsl:for-each>
    </xsl:template>
    <!--
        TRANSFORMATION SUCCESSFUL
        
        <get_stuff_from_collection xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:xslt="https://briesenberg07.github.io/xslt/">
            <label>apple</label>
            <label>orange</label>
        </get_stuff_from_collection>
        
        So I can use a local path
        No success accessing xml docs in a directory via HTTP (see 001 and 002)
    -->
</xsl:stylesheet>
