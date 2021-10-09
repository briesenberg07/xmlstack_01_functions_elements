<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:propfile="http://faculty.washington.edu/tgis/schemasProject/xsd4md" version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <get_stuff_from_collection>
            <!-- **syntax '?select=*.xml' is copied from a working example of fn:collection and I don't actually understand how it works** -->
            <xsl:apply-templates
                select="collection('https://github.com/UniverityOfWashingtonLibrariesSchemas/schemasProject/raw/ssdc/properties-files/?select=*.xml')/propfile:property"
            />
        </get_stuff_from_collection>
    </xsl:template>
    <xsl:template match="propfile:property">
        <xsl:for-each select=".">
            <internal_label>
                <xsl:value-of select="propfile:platformIndependent"/>
            </internal_label>
        </xsl:for-each>
    </xsl:template>
    <!--
    FAILED
    'Attribute name "crossorigin" associated with an element type "link" must be followed by the ' = ' character.'
    -->
</xsl:stylesheet>
