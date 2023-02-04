import os
# filepaths in the os.system command below are evaluated from *directory where the terminal is open*
# filepaths in the .xsl file are evaluated from that file's location
os.system(f"java -cp ~/ries/saxon/saxon-he-10.3.jar net.sf.saxon.Transform -s:xsl/test_py2xsl.xsl -xsl:xsl/test_py2xsl.xsl word=theBird")
