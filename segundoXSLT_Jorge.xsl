<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
        <xsl:template match="/">
            <ite>
                <!-- Creamos la etiqueta nombre que contiene el atributo nombre de "ite",
                combinándolo con la etiqueta "empresa" separadas por un guión -->
                <nombre><xsl:value-of select="ite/@nombre"/> - <xsl:value-of select="ite/empresa"/></nombre>
                <telefono><xsl:value-of select="ite/telefono"/></telefono>
                <!-- Creamos como etiqueta el atributo "web" de "ite" -->
                <web><xsl:value-of select="ite/@web"/></web>
                <profesores>
                    <!-- For each para recorrer todas las etiquetas profesor -->
                    <xsl:for-each select="ite/profesores/profesor">
                        <profesor>
                            <!-- Incluimos como atributo la etiqueta "id" de "profesor"  -->
                            <xsl:attribute name="id">
                                <xsl:value-of select="id"/>
                            </xsl:attribute>
                            <nombre><xsl:value-of select="nombre"/></nombre>
                        </profesor>
                    </xsl:for-each>  
                </profesores>
                <!-- For each para recorrer todas las etiquetas director, si hubiera más de un director -->
                <xsl:for-each select="ite/director">
                    <director>
                        <nombre><xsl:value-of select="nombre"/></nombre>
                        <despacho><xsl:value-of select="despacho"/></despacho>
                    </director>
                </xsl:for-each>
                <!-- For each para recorrer todas las etiquetas jefe de estudios, si hubiera más de un jefe de estudios -->
                <xsl:for-each select="ite/jefe_estudios">
                    <jefe_estudios>
                        <nombre><xsl:value-of select="nombre"/></nombre>
                        <despacho><xsl:value-of select="despacho"/></despacho>
                    </jefe_estudios>
                </xsl:for-each>
                <ciclos>
                    <!-- For each para recorrer todas las etiquetas profesor -->
                    <xsl:for-each select="ite/ciclos/ciclo">          
                        <ciclo>
                            <!-- Creamos como etiqueta el atributo "id" de "ciclo" -->
                            <id><xsl:value-of select="@id"/></id>
                            <nombre><xsl:value-of select="nombre"/></nombre>
                            <!-- Cambiamos el nombre de la etiqueta "grado" a "formacion" -->
                            <formacion><xsl:value-of select="grado"/></formacion>
                            <decretoTitulo>
                                <!-- Creamos una etiqueta con el atributo "año" de "decretoTitulo" -->
                                <año><xsl:value-of select="decretoTitulo/@año"/></año>
                            </decretoTitulo>
                        </ciclo>
                    </xsl:for-each>  
                </ciclos>
            </ite>
        </xsl:template>
</xsl:stylesheet>