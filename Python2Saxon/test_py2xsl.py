import os

# filepaths below are evaluated from *where the terminal is open*
    # is that the right way to say that? "where the terminal is open"?
os.system(f"java -cp ~/ries/saxon/saxon-he-10.3.jar net.sf.saxon.Transform -s:xsl/test_py2xsl.xsl -xsl:xsl/test_py2xsl.xsl word=theBird")
