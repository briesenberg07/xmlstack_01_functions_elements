<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"
    version="3.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <!-- An array is an item -->
        <xsl:value-of select="count((1, 2, 3))"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="count([1, 2, 3])"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="array:size([1, 500, ['hello', 'there'], 'you'])"/>
        <!-- More array functions https://www.w3.org/TR/xpath-functions-31/#array-functions -->
        
    </xsl:template>
    
</xsl:stylesheet>