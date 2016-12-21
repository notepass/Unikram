<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" /> <!-- Erst ab XSLT 2.0 xhtml, davor nur html, xml, text -->

    <xsl:template match="bookmarks">
        <html>
            <head>
                <title>
                    Bookmarks
                </title>
            </head>
            <body bgcolor="#ffffff">
                <table border="6">
                    <thead>
                        <tr>
                            <td>URL</td>
                            <td>Ranking</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="bookmark" />
                    </tbody>

                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="bookmark">
        <tr>
            <td>
                <a href="{.}">
                    <xsl:value-of select="." />
                </a>

            </td>

            <td>
                <xsl:value-of select="./@ranking" />
            </td>


        </tr>
    </xsl:template>

    <!-- Darf wegen der eingebauten Template-Regeln auch wegfallen: -->


</xsl:stylesheet>