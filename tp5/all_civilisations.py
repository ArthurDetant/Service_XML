
import lxml.etree as etree
dom = etree.parse("all_civilisations.xml") 
xslt_tree = etree.parse("all_civilisations.xsl")
xslt = etree.XSLT(xslt_tree)

tree = xslt(dom)
print(tree)
