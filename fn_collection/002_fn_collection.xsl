<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xslt="https://briesenberg07.github.io/xslt/" 
    version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <get_stuff_from_collection>
            <!-- **syntax '?select=*.xml' is copied from a working example of fn:collection and I don't actually understand how it works** -->
            <xsl:apply-templates
                select="collection('https://briesenberg07.github.io/xslt/?select=*.xml')/xslt:doc"
            />
        </get_stuff_from_collection>
    </xsl:template>
    <xsl:template match="xslt:doc">
        <xsl:for-each select=".">
            <internal_label>
                <xsl:value-of select="xslt:info/xslt:label"/>
            </internal_label>
        </xsl:for-each>
    </xsl:template>
    <!--
        FAILED
        'I/O error reported by XML parser processing https://briesenberg07.github.io/xslt/: 404 Not Found for: https://briesenberg07.github.io/xslt/'
    -->
</xsl:stylesheet>
