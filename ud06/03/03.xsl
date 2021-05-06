<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/horario">
        <html>
            <head>
                <title>XSLT 03 Daniel Castaño Freile</title>
                <style>
                    
                </style>
            </head>
            <body>
                <h1>HORARIOS DEL CURSO <xsl:value-of select="@curso"/></h1>
                <table>
                    <tr>
                        <th>Codigo del modulo</th>
                        <th>Nombre del modulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo"/>
                </table>
                <table>
                    <tr>
                        <th>Codigo del profesor</th>
                        <th>Nombre del profesor</th>
                    </tr>
                    <xsl:apply-templates select="profesores/profesor"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <!-- Mostrar los modulos -->
    <xsl:template match="modulos/modulo">
        <tr>
            <td>
                <abbr>
                    <xsl:attribute name="title">
                        <xsl:value-of select="current()/text()"/>
                    </xsl:attribute>
                    <xsl:value-of select="@codM"/>
                </abbr>
            </td>
            <td>
                <xsl:value-of select="current()/text()"/>
            </td>
        </tr>
        <xsl:apply-templates select="profesores/profesor"/>
    </xsl:template>
    <xsl:template match="profesores/profesor">
        <tr>
            <td>
                <abbr>
                    <xsl:attribute name="title">
                        <xsl:value-of select="current()/text()"/>
                    </xsl:attribute>
                <xsl:value-of select="@codP"/>
                </abbr>
            </td>
            <td>
                <xsl:value-of select="current()/text()"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
