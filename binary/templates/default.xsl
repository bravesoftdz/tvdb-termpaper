<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="GRID" />
 </xsl:template>

  <xsl:template match="GRID">
    <html>
    <head>
    <xsl:apply-templates select="TITLE" />
    <meta http-equiv="content-type" content="text/html" charset="windows-1251" />
    <link rel="stylesheet" href="../templates/default.css" type="text/css" />
    </head>
    <body>
      <div id="header">
        <h1>TVDatabase</h1>
      </div>
      <div id="container">
        <div id="gridheader">
          <h2>
            Экспорт таблицы &#171;<xsl:value-of select="TITLE"/>&#187;
          </h2>
        </div>
        <xsl:apply-templates select="ROWS" />
      </div>
      <div id="footer">
        TVDatabase, версия 2.0.1 &#169; 2009 <a href="mailto:sbmaxx@gmail.com">Роман Рождественский</a>
      </div>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="TITLE">
    <title>
    <xsl:value-of select="." />
    </title>
  </xsl:template>

  <xsl:template match="ROWS">
    <table id="grid">      
      <xsl:for-each select="ROW">
        <tr>
          <xsl:variable name="pos"><xsl:value-of select="position()"/></xsl:variable>
          <xsl:for-each select="CELL">
            <xsl:choose>
              <xsl:when test="$pos=1">
                <th>
                  <xsl:call-template name="CELL" />
                </th>
              </xsl:when>
              <xsl:otherwise>
                <td>
                  <xsl:call-template name="CELL" />
                </td>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <xsl:template name="CELL">
    <xsl:attribute name="nowrap"></xsl:attribute>
    <xsl:attribute name="colspan">
      <xsl:value-of select="@ColSpan" />
    </xsl:attribute>
    <xsl:attribute name="rowspan">
      <xsl:value-of select="@RowSpan" />
    </xsl:attribute>
    <xsl:choose>
      <xsl:when test="ROWS">
        <xsl:apply-templates select="ROWS" />
      </xsl:when>
      <xsl:when test="IMAGE">
        <xsl:apply-templates select="IMAGE" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="." />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="IMAGE">
    <img>
    <xsl:attribute name="src"><xsl:value-of select="@Src" /></xsl:attribute>
    </img>
  </xsl:template>

</xsl:stylesheet>
