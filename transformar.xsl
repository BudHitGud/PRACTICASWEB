<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:m="https://www.w3schools.com"  exclude-result-prefixes="xsl m">   
  
   <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <body>
        <h1>Menú de Desayuno</h1>  <table>
          <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Descripción</th>
            <th>Calorías</th>
          </tr>
          <xsl:apply-templates select="m:breakfast_menu/m:food"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="m:food">
    <tr>
      <td><xsl:value-of select="m:name"/></td>
      <td><xsl:value-of select="m:price"/></td>
      <td><xsl:value-of select="m:description"/></td>
      <td><xsl:value-of select="m:calories"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
