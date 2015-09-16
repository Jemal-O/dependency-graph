<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:variable name="fileDep"
  select="packJSStructure/file/dependencies/dependency"/>
	<xsl:variable name="moduleDep"
  select="packJSStructure/module/dependencies/dependency"/>

 <xsl:template match="/"> 
  "use strict";
  window.links = [
   <xsl:variable name="varString">
   <xsl:apply-templates select = "$fileDep|$moduleDep"/>
   </xsl:variable>
		<xsl:value-of select="substring($varString,0,string-length($varString)-2)"/>
  ]
 </xsl:template> 

  
 <xsl:template match = "//dependency">
  {source: "<xsl:value-of select = "../../id"/>", target: "<xsl:value-of select = "."/>"},
 </xsl:template> 

</xsl:stylesheet> 