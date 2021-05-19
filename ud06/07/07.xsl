<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="corregido" select="'no'" />
    <xsl:template match="/examen">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="estilo.css" />
                <title>
                    07 XSLT Test <xsl:value-of select="datos/nombreModulo" />
                </title>
            </head>
            <body>
                <div id="contenido">
                    <h1>
                        <xsl:value-of select="datos/nombreCiclo" />
                    </h1>
                    <h2>                       
                        <xsl:value-of select="document('1dawModulos.xml')//modulo[@codM=current()/datos/nombreModulo]"/>
                    </h2>
                    <h3>Fecha: 
                        <xsl:value-of select="datos/fecha/dia" /> 
                        de  <xsl:value-of select="document('meses.xml')//mes[@id=current()/datos/fecha/mes]"/> 
                        de <xsl:value-of select="datos/fecha/anyo" />
                    </h3>
                    <form action="#alta.php" method="get">
                        <fieldset>
                            <xsl:apply-templates select="//preguntas/pregunta" />
                        </fieldset>
                        <xsl:if test="$corregido='no'">
                            <p>
                                <input type="button" value="Enviar formulario" accesskey="e"  />
                                <input type="reset" value="Borrar formulario"  accesskey="e"/> 
                            </p>		
                        </xsl:if>
                    </form>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pregunta" >
        <div class="pregunta">
            <xsl:value-of select="concat(@id,'.-',enunciado)" />
            <xsl:apply-templates select="respuestas/respuesta" >
                <xsl:with-param name="num_p"  select="@id" />
            </xsl:apply-templates> 
        </div>
    </xsl:template>
    <xsl:template match="respuesta">
        <xsl:param name="num_p" />
        <div class="respuesta">		
            <input type="radio" >
                <xsl:attribute name="name" >
                    <xsl:value-of select="concat('p',$num_p)" />
                </xsl:attribute>
                <xsl:attribute name="value" >
                    <xsl:value-of select="position()" />
                </xsl:attribute>
                <xsl:if test="$corregido='si'">
                    <xsl:attribute name="disabled" >disabled</xsl:attribute>
                    <xsl:if test="@correcta='correcta'">
                        <xsl:attribute name="checked" >checked</xsl:attribute>
                    </xsl:if>
                </xsl:if> 				
            </input> 
            <xsl:value-of select="." />
        </div>
    </xsl:template>
</xsl:stylesheet>
