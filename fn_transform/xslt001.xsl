<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <!-- how exactly does this match work? -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <!-- how exactly does this select work?? -->
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- why don't I need any of the parent elements in this XPath??? -->
    <xsl:template match="food">
        <xsl:for-each select=".">
            <xsl:if test="matches(., '^sushi$|^pizza$')">
                <fact>
                    <xsl:text>Here's a matching food: </xsl:text>
                    <xsl:value-of select="."/>
                </fact>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
