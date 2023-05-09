<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    expand-text="yes"
    version="3.0">
    
    <xsl:template match="/">
        {current-dateTime() => format-dateTime('[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]Z')}
    </xsl:template>
    
</xsl:stylesheet>