<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:breakfast="https://www.w3schools.com">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <body>
        <table>
          <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Descripción</th>
            <th>Calorías</th>
          </tr>
          <xsl:apply-templates select="breakfast:breakfast_menu/breakfast:food"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="breakfast:food">
    <tr>
      <td><xsl:value-of select="breakfast:name"/></td>
      <td><xsl:value-of select="breakfast:price"/></td>
      <td><xsl:value-of select="breakfast:description"/></td>
      <td><xsl:value-of select="breakfast:calories"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>