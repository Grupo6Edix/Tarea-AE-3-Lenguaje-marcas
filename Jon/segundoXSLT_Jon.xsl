<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
        <xsl:template match="/">
            <ite>
                <!-- Para empezar utilizamos los atributos nombre y web que estaban en el título
                como nuevas etiquetas -->
                <nombre><xsl:value-of select="ite/@nombre"/></nombre>
                <web><xsl:value-of select="ite/@web"/></web>
                <empresa><xsl:value-of select="ite/empresa"/></empresa>
                <telefono><xsl:value-of select="ite/telefono"/></telefono>
                <!-- Creamos la etiqueta trabajadores, donde luego subdividimos y especificamos el 
                puesto de trabajo que ocupa cada trabajador, es decir, unificamos a todos los trabajadores
                y luego especificamos que puesto ocupan, ya sea profesor, director o jefe de estudios. Para 
                ello, utilizamos for-each para que nos busque entre todas las etiquetas que corresponden 
                con la búsqueda. -->
                <trabajadores>
                    <tipo>
                            <xsl:for-each select="ite/profesores/profesor">
                            <profesor>
                                <id><xsl:value-of select="id"/></id>
                                <nombre><xsl:value-of select="nombre"/></nombre>
                            </profesor>
                            </xsl:for-each>
                            
                            <xsl:for-each select="ite/jefe_estudios">
                            <jefe_estudios>
                                <nombre><xsl:value-of select="nombre"/></nombre>
                                <despacho><xsl:value-of select="despacho"/></despacho>
                            </jefe_estudios>
                            </xsl:for-each>
                            
                            <xsl:for-each select="ite/director">
                            <director>
                                <nombre><xsl:value-of select="nombre"/></nombre>
                                <despacho><xsl:value-of select="despacho"/></despacho>
                            </director>
                            </xsl:for-each>
                           
                        
                    </tipo>
                </trabajadores>
                <!-- Creamos las etiquetas id y añoDecreto, dónde utilizamos los datos que 
                antes habíamos indicado como atributos. -->
                <ciclos>
                    <xsl:for-each select="ite/ciclos/ciclo">
                        <ciclo>
                            <id><xsl:value-of select="@id"/></id>
                            <nombre><xsl:value-of select="nombre"/></nombre>
                            <tipo_formacion><xsl:value-of select="grado"/></tipo_formacion>
                            <añoDecreto><xsl:value-of select="decretoTitulo/@año"/></añoDecreto>
                        </ciclo>
                    </xsl:for-each>
                </ciclos>

                            

            </ite> 
        </xsl:template>
</xsl:stylesheet>   
                