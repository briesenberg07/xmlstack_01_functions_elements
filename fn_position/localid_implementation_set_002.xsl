<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:uwmaps="https://uwlib-cams.github.io/map_storage/xsd/"
    xmlns:uwsinopia="https://uwlib-cams.github.io/sinopia_maps/xsd/"
    exclude-result-prefixes="xs uwmaps uwsinopia" expand-text="true" version="3.0">

    <!-- 
        transformation scenario in sinopia_maps uses 
        OUTPUT = ${currentFileURL}
        But I don't believe this will make a difference
    -->

    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="1"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <!-- starting on Theo's fine-tuned version below... incomplete -->
    <xsl:template match="uwsinopia:implementation_set">
        <xsl:copy>
            <!-- other than apply-templates, only copy attribute and create new value (?) -->
            <xsl:attribute name=""/>
            <xsl:apply-templates/>
        </xsl:copy>

    </xsl:template>

</xsl:stylesheet>
