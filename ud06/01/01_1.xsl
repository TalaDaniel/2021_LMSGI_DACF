<?xml version="1.0" encoding="UTF-8"?>

 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

 

    <xsl:template match="/edificio">
        <html>
            <head>
                <title>XSLT 01_1 Daniel Castaño Freile</title>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <!-- <xsl:apply-templates select="vivienda"/> -->
                <xsl:for-each select="vivienda">
                    <div>
                        Piso:<xsl:value-of select="piso"/>
                        Puerta:<xsl:value-of select="puerta"/>
                        <ol>
                            <!-- <xsl:apply-templates select="vecinos/nombre"/> -->
                            <xsl:for-each select="vecinos/nombre">
                                <li>
                                    <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                        </ol>
                    </div>
                </xsl:for-each>
                <div>Número de viviendas: <xsl:value-of select="count(vivienda)"/></div>
                <div>Número total de vecinos: <xsl:value-of select="count(//nombre)"/></div>
            </body>
        </html>
    </xsl:template>
    <!-- <xsl:template match="vivienda">
        <div>
            Piso:<xsl:value-of select="piso"/>
            Puerta:<xsl:value-of select="puerta"/>
            <ol>
                <xsl:apply-templates select="vecinos/nombre"/>
            </ol>
        </div>
    </xsl:template>
    <xsl:template match="vecinos/nombre">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template> -->
</xsl:stylesheet>
 