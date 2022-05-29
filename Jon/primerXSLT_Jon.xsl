<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
    <head>
        <!-- Seleccionamos el atributo nombre de la etiqueta principal ite, para que salga en 
        la pestaña del navegador. -->
        <title><xsl:value-of select="ite/@nombre"/></title>
       
    </head>
    <body>
        <!-- Establecemos como título el nombre de la empresa a través del atributo nombre de 
        la etiqueta ite(por medio de @)-->
        <header>
            <h1><xsl:value-of select="ite/@nombre"/></h1>
        </header>
        <main>
        <h3>Ciclos disponibles</h3>

        <!-- Incluimos en una tabla los datos de los grados disponibles del centro. Para ello 
        utilizamos for-each y después por medio de value-of vamos seleccionando los datos que 
        queremos que aparezcan-->
           <table border="2">
            <tr>
                <th>Nombre</th>
                <th>Nombre completo</th>
                <th>Tipo de Grado</th>
                <th>Año inicio curso</th>
            </tr>
            <xsl:for-each select="ite/ciclos/ciclo">   
                <tr>
                    <td><xsl:value-of select="@id"/></td>
                    <td><xsl:value-of select="nombre"/></td>
                    <td><xsl:value-of select="grado"/></td>
                    <td><xsl:value-of select="decretoTitulo/@año"/></td>
                </tr>
            </xsl:for-each>
    
        </table>

        <!-- Esta vez, en vez de una tabla, establecemos que los profesores aparezcan por medio
        de una lista ordenada. Para ello nos ayudamos nuevamente de un for-each y de value-of. -->
        <h3>Profesores</h3>
        <ol>
            <xsl:for-each select="ite/profesores/profesor">
            <li><xsl:value-of select="nombre"/></li>
            </xsl:for-each>
        </ol>

        <!-- Para los datos de la dirección, utilizamos nuevamente una tabla, donde salen los datos
        de los tabajadores. -->
        <h3>Equipo directivo</h3>
            <table border="3">
                <tr>
                    <th>Nombre</th>
                    <th>Despacho</th>
                    <th>Cargo</th>
                </tr>
                <tr>
                    <td><xsl:value-of select="ite/director/nombre"/></td>
                    <td><xsl:value-of select="ite/director/despacho"/></td>
                    <td>Dirección</td>
                </tr>
                <tr>
                    <td><xsl:value-of select="ite/jefe_estudios/nombre"/></td>
                    <td><xsl:value-of select="ite/jefe_estudios/despacho"/></td>
                    <td>Jefatura de estudios</td>
                </tr>
            </table>
        <!-- Creación del formulario de contacto, con diversas opciones disponibles. -->
         <section>
                    <article>                                    
                        <form action="procesarPeticion.jsp"  method="get">
                            <h3>Contacta con nosotros</h3>
                                <label for="nombre">Nombre: </label>
                                    <input id="nombre" type="text" name="nombre" placeholder="Introduzca su nombre"/>
                                <label for="apellidos">Apellidos: </label>
                                    <input id="apellidos" type="text" name="apellidos" placeholder="Introduzca sus apellidos"/><br/>
                                <label for="email">Email: </label>
                                    <input id="email" type="email" name="email" placeholder="Introduzca su email" />
                                <label for="telefono">Telefono: </label>
                                    <input id="telefono" type="tel" name="telefono" placeholder="Escribe su nº de telefono" /><br/>
                                <label for="sexo">Sexo: </label>
                                    <input id="sexo" class="check_bola" type="radio" name="sexo" value="H"/>Hombre
                                    <input class="check_bola" type="radio" name="sexo" value="M"/>Mujer<br/>	
                                <label for="referente">Ciclo formativo:</label>
                                    <select id="referente" name="referente">
                                        <option value="1">Administración de Sistemas Informáticos en Red</option>
                                        <option value="2">Desarrollo de Aplicaciones Web</option>
                                        <option value="3">Desarrollo de Aplicaciones Multiplataforma</option>
                                    </select> <br/>                                  
                                <label for="consulta">Consulta: </label>
                                    <textarea id="consulta" style="resize: none;" rows="5" cols="80" name="observaciones"></textarea><br/>
                                <label for="terminos">¿Desea recibir información en su correo sobre nuestros cursos? </label>	
                                    <input id="terminos" type="checkbox" name="terminos" value="Y"/> Sí, quiero recibir información.   
                                    <input id="informacion" type="checkbox" name="informacion" value="N"/> No, no deseo recibir información. <br/>                
                            <input type="submit" value="Enviar"/>
                            <input type="reset" value="Limpiar formulario"/>
                        
                        </form>
                    </article>
                </section>  
        </main> 
        <footer>
        <!-- Creamos un enlace que nos lleve a la página web del instituto en 
        donde utilizamos value-of en el valor del atributo de web en la etiqueta ite -->
            <p>Visita nuestra página web:</p>
            <a>
                <xsl:attribute name="href">
                <xsl:value-of select="ite/@web"/>
                </xsl:attribute>
                <p>Ir a la página de Instituto EDIX</p>
            </a>
            <p>Llama a nuestro número de teléfono: <xsl:value-of select="ite/telefono"/></p>

        </footer>
        


    </body>
    </html>
	</xsl:template>
</xsl:stylesheet>