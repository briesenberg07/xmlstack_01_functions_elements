# xsl:key + fn:key
## Note
- `fn:key` and `xsl:key` are still difficult for me! TO DO is read dh.obdurodon.org [on the xsl:key element](http://dh.obdurodon.org/xslt-basics-2.xhtml)
## Resources
### xsl:key
- [Saxon documentation](https://www.saxonica.com/html/documentation/xsl-elements/key.html)
- [From the XSLT 3.0 spec](https://www.w3.org/TR/xslt-30/#element-key)
### fn:key
- [Saxon documentation](https://www.saxonica.com/html/documentation/functions/fn/key.html)
- [From the XSLT 3.0 spec](https://www.w3.org/TR/xslt-30/#func-key)
## Example 1
- [RDF/XML for processing](https://raw.githubusercontent.com/CECSpecialistI/UWLibCatProfiles/master/xml/fusekiCurl-20200406.rdf) 
- [UW source RDA profile in JSON-in-XML](https://raw.githubusercontent.com/CECSpecialistI/UWLibCatProfiles/b08374b0570df95d3b2ef3c00600bc627d955c05/xml/WAU.profile.RDA.xml) (see var `$profile` below)
- XSLT

```
[...]

<xsl:key name="rda" match="pro:array[@key = 'propertyTemplates']/pro:map" use="tokenize(pro:string[@key = 'propertyURI'], '/')[last()]"/>
<xsl:variable name="profile" select="document('<URL for UW source RDA profile in JSON-in-XML>')"/>

[...]

<xsl:for-each-group select="rdf:Description" group-by="@rdf:about">
    [...]
    <xsl:for-each select="current-group()/*">
        [...]
        <xsl:choose>
            <xsl:when test="key('rda', local-name(.), $profile)">
                <xsl:value-of select="key('rda', local-name(.), $profile)/pro:string[@key = 'propertyLabel']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="local-name(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
    
[...]

</xsl:for-each-group>
```
### Example 1 Discussion
- The `xsl:choose` > `xsl:when` element above uses the key function to create a condition. So what is the condition specified in the `key()` function?
#### `key` (with arguments listed out of order)
**`(`**
- `local-name(.)` When the [local name](https://www.saxonica.com/html/documentation/functions/fn/local-name.html) of the context-node element...
- ...matches the pattern provided in the `rda` key's match and use attributes (`match="pro:array[@key = 'propertyTemplates']/pro:map" use="tokenize(pro:string[@key = 'propertyURI'], '/')[last()]` from above), *when applied to* the tree specified in the 'top' argument of the function...
- `$profile`. That is, the [UW source RDA profile in JSON-in-XML](https://raw.githubusercontent.com/CECSpecialistI/UWLibCatProfiles/b08374b0570df95d3b2ef3c00600bc627d955c05/xml/WAU.profile.RDA.xml), provided in a variable.

**`)`**

- [At this point](https://github.com/CECSpecialistI/UWLibCatProfiles/blob/ed602c72ed2cffe38ee34ef18bbd02ae629ff47a/scripts/rdfxml-to-html5.xsl#L25) I'm copying this pattern almost exactly in the new RDF/XML-to-HTML script. But I wanted to find a way to get rid of the fn:tokenize in the key `@use` and instead use a function for [the fn:key args](https://github.com/CECSpecialistI/UWLibCatProfiles/blob/ed602c72ed2cffe38ee34ef18bbd02ae629ff47a/scripts/rdfxml-to-html5.xsl#L62) that would expand the prefixed element (property) names to check against `propertyURI` values in the profile. I don't currently have experience with any such function though (2020-05-14).
###### tags: `xslt`
