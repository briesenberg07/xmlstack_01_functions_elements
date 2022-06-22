# fn:transform

## RESOURCES
- XPath and XQuery Functions and Operators 3.1 > [fn:transform](https://www.w3.org/TR/xpath-functions-31/#func-transform)
- Saxon [fn:transform](https://www.saxonica.com/documentation11/index.html#!functions/fn/transform)

## NOTES
### 2022-06-22
- I've just basically reproduced [TG's `fn:transform` stylesheet](https://github.com/uwlib-cams/UWLibCatProfiles/blob/2473d772b115c565f063bede21565faab09be972/scripts/formatSpecificProfiles-all.xsl) here to create a baseline which will hopefully help me wrap multiple transformations in one stylesheet
- Still have lots of questions, including:
    - A basic question...
        - After using the [identify transform](), in the first stylesheet, it isn't clear to me why I don't need to include any parent elements in my template `match` attribute for `food` elements [here](https://github.com/briesenberg07/xml_stack/blob/8dcdeb7f24e6d03a584f55be57a17fdf303cc9da/fn_transform/xslt001.xsl#L17-L18) (I wouldn've thought that my template match would have to use an XPath beginning at the root element of the doc)
    - ...and `fn:transform` questions...
        - I believe that much of the syntax for the `xsl:sequence` `select` attribute comes from XQuery, which I have to experience with, so the bits like `:=` and `$transform?output` are quite mysterious to me
- TO DO
    - Answer the questions above
    - Add some additional functionality which would likely be needed in an implementation, like adding `stylesheet-params` to the map
