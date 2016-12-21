<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:b="http://businesscard.org"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html"/> <!-- Erst ab XSLT 2.0 xhtml, davor nur html, xml, text -->

    <xsl:template match="b:cardCollection">
        <html>
            <head>
                <title>
                    <xsl:value-of select="./@name"/>
                </title>
            </head>
            <body bgcolor="#ffffff">
                <table border="6">
                    <xsl:apply-templates select="b:card"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Darf wegen der eingebauten Template-Regeln auch wegfallen: -->
    <xsl:template match="b:name|b:title|b:email|b:phone">
        <xsl:value-of select="."/>
    </xsl:template>


    <xsl:template match="b:card">
        <tr>
            <td>
                <xsl:if test="b:logo">
                    <img src="{b:logo/@uri}"/>
                </xsl:if>
            </td>
            <td>
                <xsl:apply-templates select="b:name"/>
                <xsl:text>,  </xsl:text>
                <xsl:apply-templates select="b:title"/>
                <p/>
                <tt>
                    <xsl:apply-templates select="b:email"/>
                </tt>
                <br/>
                <xsl:if test="b:phone">
                    Phone:
                    <xsl:apply-templates select="b:phone"/>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
