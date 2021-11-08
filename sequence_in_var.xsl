<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mapstor="https://uwlib-cams.github.io/map_storage/" version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="mapid_resource" select="'Manifestation'"/>
    <xsl:param name="mapid_format" select="'monograph'"/>
    <xsl:param name="mapid_user" select="'ries07'"/>

    <xsl:variable name="sorted_property" as="node()*">
        <xsl:for-each select="
                document('../map_storage/test_propSet_rda_Manifestation.xml')/mapstor:propSet/mapstor:prop
                [mapstor:platformSet/mapstor:sinopia/mapstor:implementationSet/mapstor:resource[@mapid_resource = $mapid_resource]
                [mapstor:format[@mapid_format = $mapid_format]]
                [mapstor:user[@mapid_user = $mapid_user]]]">
            <xsl:sort select="
                    mapstor:platformSet/mapstor:sinopia/mapstor:implementationSet/
                    mapstor:resource[@mapid_resource = $mapid_resource]
                    [mapstor:format[@mapid_format = $mapid_format]]
                    [mapstor:user[@mapid_user = $mapid_user]]/
                    mapstor:form_order/@value"/>
            <xsl:copy-of select="."/>
        </xsl:for-each>
    </xsl:variable>

    <xsl:template match="/">
        <sorted_set>
            <xsl:for-each select="$sorted_property">
                <label>
                    <xsl:value-of select="mapstor:prop_label"/>
                </label>
                <form_order>
                    <xsl:value-of select="
                            mapstor:platformSet/mapstor:sinopia/mapstor:implementationSet/
                            mapstor:resource/mapstor:form_order/@value"/>
                </form_order>
            </xsl:for-each>
        </sorted_set>
    </xsl:template>

</xsl:stylesheet>
<!-- attempt 2
    <xsl:variable name="sorted_list_2" as="node()*">
        <xsl:perform-sort select="
                mapstor:mapStorage[@mapid_institution = $mapid_institution]/
                mapstor:propSet/mapstor:prop
                [mapstor:platformSet/mapstor:sinopia/mapstor:implementationSet/
                mapstor:resource[@mapid_resource = $mapid_resource]
                [mapstor:format/@mapid_format = $mapid_format]
                [mapstor:user/@mapid_user = $mapid_user]]">
            <xsl:sort select="
                    mapstor:platformSet/mapstor:sinopia/mapstor:implementationSet/
                    mapstor:resource[@mapid_resource = $mapid_resource]
                    [mapstor:format/@mapid_format = $mapid_format]
                    [mapstor:user/@mapid_user = $mapid_user]/
                    mapstor:form_order/@value"/>
        </xsl:perform-sort>
    </xsl:variable>
    
    <xsl:template match="/">
        <try_for_sorted_set_2>
            <xsl:for-each select="$sorted_list_2/mapstor:prop">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </try_for_sorted_set_2>
    </xsl:template>  
    -->
<!-- attempt 3
    <xsl:variable name="tree">
            <xsl:sequence select="document('../map_storage/test_propSet_rdaManifestation.xml')/
                mapstor:propSet/mapstor:prop"/>
    </xsl:variable>
    <xsl:variable name="sorted_tree">
        <xsl:sort select="$tree/mapstor:platformSet/mapstor:sinopia/
            mapstor:implementationSet/mapstor:resource/mapstor:form_order/@value"
            data-type="number"/>
    </xsl:variable>
    -->
