<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xmls="https://briesenberg07.github.io/xml_stack/" 
    version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <get_stuff_from_collection>
            <xsl:apply-templates
                select="collection('https://briesenberg07.github.io/xmlstack_01_functions_elements/fn_collection/?select=*.xml')/"
            />
        </get_stuff_from_collection>
    </xsl:template>
    <xsl:template match="xmls:doc">
        <xsl:for-each select=".">
            <internal_label>
                <xsl:value-of select="xmls:info/xmls:label"/>
            </internal_label>
        </xsl:for-each>
    </xsl:template>
    <!--
        FAILED
    -->
</xsl:stylesheet>
