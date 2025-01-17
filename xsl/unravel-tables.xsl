<?xml version="1.0"?>
<!-- { introduction -->
<!--
Author: T. V. Raman <raman@cs.cornell.edu>
Copyright: (C) T. V. Raman, 2001 - 2022,   All Rights Reserved.
License: GPL
Description: Factor out nested tables to the end of document.
Each nested table is replaced with an anchor that links to
the  actual table which appears in a final section of the
document.

The default mode, which is the first pass, passes everything
except tables unmodified.

Tables are matched by rule match = //tables//table 
which creates the required anchor element, deferring the
copying out of the table to the second-pass.

During the second pass, nested tables get recursively
processed by calling apply-templates which by default
applies rules from the first pass.


We then perform a second-pass using a for-each iterator over
nodeset //table//table.
Compare this with 2pass-unravel-tables.xsl which uses a
named mode 'second-pass'
instead of a for-each iterator.
Using for-each allows this style to correctly number the
nested tables during the second-pass; this numbering can be
used as the table-index for extract-tables.xsl.

-->
<!-- } -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:set="http://exslt.org/sets"
  version="1.0"
  exclude-result-prefixes="set">
  <xsl:output method="html" indent="yes"
  encoding="UTF-8"/>
  <xsl:include href="object.xsl"/>
  <xsl:include href="identity.xsl"/>
  <!-- { html body  -->
  <!-- nuke these -->
  <xsl:template match="//script|//meta|//iframe"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="head">
    <head>
      <xsl:apply-templates select="title"/>
      <xsl:if test="string-length($base) &gt; 0">
        <xsl:element name="base">
          <xsl:attribute name="href">
            <xsl:value-of select="$base"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:if>
    </head>
  </xsl:template>
  <xsl:template match="body">
    <xsl:element name="body">
      <xsl:apply-templates select="@*"/>
      <xsl:if test="count(//table//table)  &gt; 0">
        <table>
          <caption>
            <a href="#__about_unravel_tables">Tables Unravelled</a>
          </caption>
          <tr>
            <td>
              <a href="#__nested_tables"><xsl:value-of select="count(//table//table)"/>
                nested tables
              </a>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:apply-templates/>
      <h2>
        <a name="__nested_tables" id="__nested_tables"> 
          <xsl:value-of select="count(//table//table)"/>
          Nested Tables 
        </a>
      </h2>
      <xsl:variable name="i" select="//table//table"/>
      <xsl:for-each select="$i">
        <xsl:element name="a">
          <xsl:attribute name="name">
            <xsl:value-of select="generate-id(.)"/>
          </xsl:attribute>
          <em>
            Table <xsl:value-of select="position()"/>
          </em>
        </xsl:element>
        <br/>
        <xsl:element name="table">
          <xsl:apply-templates select="@*"/>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:for-each>
      <h2>
        <a name="__about_unravel_tables">About This Style</a>
      </h2>
      <p>
        Note that nested tables have been moved to  section <a href="#__nested_tables">nested tables</a>.
        The table cell that contained the nested table has been
        replaced with a hyperlink that navigates to the actual
        table. If the author has provided a summary and or
        caption for the nested table, those will be displayed
        as the hyperlink text.
        The caption appearing above each table gives a table-index
        that can be used when extracting a table with extract-table.xsl.
      </p>
    </xsl:element>
  </xsl:template>
  <xsl:template match="//table//table">
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text><xsl:value-of select="generate-id(.)"/>
      </xsl:attribute>
      <xsl:value-of select="caption"/>
      [Table <xsl:value-of select="@summary"/>
      ]
    </xsl:element>
  </xsl:template>
  <!-- } -->
</xsl:stylesheet>
<!--
Local Variables:
mode: nxml
sgml-indent-step: 2
sgml-indent-data: t
sgml-set-face: nil
sgml-insert-missing-element-comment: nil
folded-file: t
End:
-->
