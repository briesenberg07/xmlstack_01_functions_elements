<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <!-- see questions in xslt001 -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="place">
        <xsl:for-each select=".">
            <xsl:if test="matches(., '^Paris$|^Montana$')">
                <fact>
                    <xsl:text>Here's a matching place: </xsl:text>
                    <xsl:value-of select="."/>
                </fact>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
