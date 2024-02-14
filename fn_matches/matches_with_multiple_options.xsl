<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    exclude-result-prefixes="xs math"
    expand-text="yes"
    version="3.0">

    <xsl:variable name="tree">
        <tree>
            <branch attribute="strong">strong</branch>
            <branch attribute="all">all</branch>
            <branch attribute="weak">weak</branch>
        </tree>
    </xsl:variable>
    <xsl:variable name="branch_type">strong</xsl:variable>
    
    <xsl:template match="/">
        <xsl:for-each select="$tree/tree/branch
            [matches(., $branch_type) or matches(., 'all')]">
            {.}
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
