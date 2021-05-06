<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>02 XSLT Daniel Castaño Freile</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Daniel Castaño Freile"/>
                <meta name="application-name" content="Información de tickets"/>
                <meta name="description" content="Información de tickets"/>
                <meta name="keywords" content="tickets, total, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
                <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="favicon.ico" type="image/x-icon"/>
                <style>
                    table, td, th{
                        border: 1px solid black;
                    }
                    table{
                        border-collapse: collapse;
                    }
                    h3{
                        border: 2px solid black;
                        color:green;
                        border-color: #00FF00;
                    }
                    h2{
                        border: 1px solid black;
                        background-color: green;
                        color:#CDCDCD;
                        border-color:white;
                    }
                    h1{
                        border: 1px solid black;
                        background-color: #CDCDCD;
                        color:green;
                        border-color:white;
                    }
                </style>
            </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                    <h2>Listado de tickets</h2>
                    <xsl:apply-templates match="listatickets/ticket"/>
                </header>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="comment()">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
    </xsl:template>
    
    <xsl:template match="listatickets/ticket">
        <h3>Tickets: <xsl:value-of select="numero"/></h3>
        <table>
            <tr>
                <th></th>
                <th>Producto</th>
                <th>Precio</th>
            </tr>
            <tr>
                <th>Total</th>
                <xsl:variable name="preciototal" select="0"/>
                <th>
                    <xsl:for-each select="producto/precio">
                        <xsl:variable name="preciototal">
                            <xsl:value-of select="$preciototal+number(current())"/>
                        </xsl:variable>
                        <xsl:value-of select="$preciototal"/>
                        <br/>
                    </xsl:for-each>
                </th>
            </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="producto">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td>
                <xsl:value-of select="precio"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
