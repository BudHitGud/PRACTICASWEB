<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="https://www.w3schools.com"  
  exclude-result-prefixes="xsl">    

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
          <xsl:apply-templates select="breakfast_menu/food"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="food">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="price"/></td>
      <td><xsl:value-of select="description"/></td>
      <td><xsl:value-of select="calories"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
