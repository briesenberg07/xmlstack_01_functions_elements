<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:uwmaps="https://uwlib-cams.github.io/map_storage/xsd/"
    xmlns:uwsinopia="https://uwlib-cams.github.io/sinopia_maps/xsd/"
    exclude-result-prefixes="xs uwmaps uwsinopia" version="3.0">

    <!-- 
        transformation scenario in sinopia_maps uses 
        OUTPUT = ${currentFileURL}
        But I don't believe this will make a difference
    -->

    <xsl:output method="xml" indent="1"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="uwmaps:prop_set/uwmaps:prop/uwmaps:sinopia/uwsinopia:implementation_set">
        <xsl:variable name="position" select="position()"/>
        <uwsinopia:implementation_set
            localid_implementation_set="{concat(../../@localid_prop, '_is_', $position)}">
            <xsl:copy-of select="node()"/>
        </uwsinopia:implementation_set>
    </xsl:template>

</xsl:stylesheet>
