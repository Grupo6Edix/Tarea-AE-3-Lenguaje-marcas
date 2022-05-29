<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <head>
            <!--  -->
            <!-- Seleccionamos el atributo nombre de la etiqueta "ite" para que aparezca el nombre
            del instituto en la pestaña del navegador -->
            <title> <xsl:value-of select="ite/@nombre"/> </title>
            <link rel="stylesheet" href="css/primerXML.css"></link>
        </head>
        <body>
            <!-- En el header incorporamos la etiqueta xsl "value-of" seleccionando con "@" el atributo
            "nombre" para que muestre el nombre de la empresa -->
            <header>
                <h1> <xsl:value-of select="ite/@nombre"/> </h1>
                <!-- Incorporamos la lista (no ordenada) requerida en el enunciado como un submenú
                para poder acceder a las 3 partes que componen el archivo -->
                <nav>
                    <ul>
                        <!-- Incorporamos enlaces a otras partes del documento, requerimiento del enunciado,
                        y como son a la misma página y siempre está visible el menú en el encabezado, se abren
                        en la misma pestaña del navegador -->
                        <li><a href="#docentes">Docentes</a></li>
                        <li><a href="#formacion">Formación</a></li>
                        <li><a href="#formulario">Contacta con nosotros</a></li>
                    </ul>
                </nav>
            </header>
            <main>
                <section>
                    <article>
                        <!-- Primera tabla requerida en el enunciado, enumerando los docentes del centro -->
                        <table class="docentes" id="docentes" cellspacing="10px">
                            <thead>
                                <tr>
                                    <th colspan="3">
                                        <h3>Docentes</h3>     
                                    </th>                                   
                                </tr> 
                            </thead>                          
                            <tbody>                                    
                                <tr>
                                    <th><h4>Director</h4>
                                        <tr>
                                            <!-- Mediante la etiqueta "for-each", hacemos que recorra todos los directores (por si hay mas de uno) -->
                                            <xsl:for-each select="ite/jefe_estudios">
                                                <!-- Seleccionamos el nombre del directo -->
                                                <td><xsl:value-of select="nombre"/><br/></td>
                                                <!-- Seleccionamos el despacho del director -->
                                                <td>Despacho: <xsl:value-of select="despacho"/></td>
                                            </xsl:for-each>
                                        </tr>
                                    </th>    
                                    <th><h4>Jefe de estudios</h4>
                                        <tr>
                                            <!-- Mismo caso que con directores -->
                                            <xsl:for-each select="ite/jefe_estudios">
                                                <td><xsl:value-of select="nombre"/><br/></td>
                                                <td>Despacho: <xsl:value-of select="despacho"/></td>
                                            </xsl:for-each>
                                        </tr>
                                    </th>
                                    <th><h4>Profesores</h4>
                                        <tr>
                                            <!-- Mismo caso que con directores -->
                                            <xsl:for-each select="ite/profesores/profesor">
                                                <td><xsl:value-of select="nombre"/><br/></td>
                                            </xsl:for-each>
                                        </tr>
                                    </th>                               
                                </tr>
                            </tbody>
                        </table>
                    </article>
                    <article>
                        <!-- Segunda tabla requerida en el enunciado, enumerando las formaciones que se imparten en el centro -->
                        <table class="formacion" id="formacion" cellspacing="10px">
                            <thead>
                                <tr>
                                    <th colspan="3">
                                        <h3>Formación superior</h3>
                                    </th>
                                </tr>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Grado</th>
                                    <th>Año Decreto</th>  
                                </tr>
                            </thead>
                            <tbody>                                    
                                <tr>
                                    <!-- Enlace hacia la formación en la web del centro, requerimiento del enunciado -->
                                    <!-- Con la sentencia ciclo[1], seleccionamos el primer ciclo  -->
                                    <td><a href="https://www.edix.com/es/fp/ASIR" target="_blank"><xsl:value-of select="/ite/ciclos/ciclo[1]/nombre"/></a></td>
                                    <td><xsl:value-of select="/ite/ciclos/ciclo[1]/grado"/></td>
                                    <td><xsl:value-of select="/ite/ciclos/ciclo[1]/decretoTitulo/@año"/></td>
                                </tr>
                                <tr>
                                    <!-- Enlace hacia la formación en la web del centro, requerimiento del enunciado -->
                                    <!-- Con la sentencia ciclo[2], seleccionamos el segundo ciclo -->
                                    <td><a href="https://www.edix.com/es/fp/daw-desarrollo-de-aplicaciones-web/" target="_blank"><xsl:value-of select="/ite/ciclos/ciclo[2]/nombre"/></a></td>
                                    <td><xsl:value-of select="/ite/ciclos/ciclo[2]/grado"/></td>
                                    <td><xsl:value-of select="/ite/ciclos/ciclo[2]/decretoTitulo/@año"/></td>
                                </tr>
                                <tr>
                                    <!-- Enlace hacia la formación en la web del centro, requerimiento del enunciado -->
                                    <!-- Con la sentencia ciclo[3], seleccionamos el tercer ciclo -->
                                    <td><a href="https://www.edix.com/es/fp/desarrollo-de-aplicaciones-multiplataforma-dam/" target="_blank"><xsl:value-of select="/ite/ciclos/ciclo[3]/nombre"/></a></td>
                                    <td><xsl:value-of select="/ite/ciclos/ciclo[3]/grado"/></td>
                                    <td><xsl:value-of select="/ite/ciclos/ciclo[3]/decretoTitulo/@año"/></td>
                                </tr>                      
                            </tbody>
                        </table>
                    </article>
                </section>
                <section>
                    <article> 
                        <!-- Formulario requerido en el enunciado, para poder pedir información de las formaciones,
                        seleccionandolo en un desplegable con las opciones -->              
                        <form action="procesarPeticion.jsp" id="formulario" method="get">
                            <h3>Contacta con nosotros</h3>
                                <label for="nombre">Nombre: </label>
                                    <input id="nombre" type="text" name="nombre" placeholder="Introduzca su nombre"/>
                                <label for="apellidos">Apellidos: </label>
                                    <input id="apellidos" type="text" name="apellidos" placeholder="Introduzca sus apellidos"/>
                                <label for="email">Email: </label>
                                    <input id="email" type="email" name="email" placeholder="Introduzca su email" />
                                <label for="telefono">Telefono: </label>
                                    <input id="telefono" type="tel" name="telefono" placeholder="Escribe su nº de telefono" />
                                <label for="referente">Ciclo formativo:</label>
                                    <select id="referente" name="referente">
                                        <option value="1">Administración de Sistemas Informáticos en Red</option>
                                        <option value="2">Desarrollo de Aplicaciones Web</option>
                                        <option value="3">Desarrollo de Aplicaciones Multiplataforma</option>
                                    </select>
                                <label for="consulta">Consulta: </label>
                                    <textarea id="consulta" style="resize: none;" rows="5" cols="80" name="observaciones"></textarea>
                                <label for="terminos">¿Desea recibir información en su correo sobre nuestros cursos? </label>	
                                    <input id="terminos" type="checkbox" name="terminos" value="Y"/> Sí, quiero recibir información.                   
                            <input type="submit" value="Enviar"/>
                            <input type="reset" value="Limpiar formulario"/>
                        <img src="img/edix.png" width="300" height="300" alt="edix"/>
                        </form>
                    </article>
                </section>         
            </main>
            <footer>
                <!-- Pie de página incluyendo el nombre de empresa, telefono, y un enlace a la página del centro -->
                <h2> <xsl:value-of select="ite/empresa"/> </h2>
                <p> Teléfono de contacto: <xsl:value-of select="ite/telefono"/> </p>
                <!-- Para el enlace a la web, utilizamos una etiqueta value of seleccionando la web aportada en el XML,
                para ello creamos la etiqueta a, añadiéndole el atributo href que abre la página deseada, y para incluirlo
                añadimos dentro la etiqueta value-of seleccionando el atributo web de ite.
                Volvemos a utilizar la misma etiqueta value-of para que sea el mismo texto sobre el que pinchar -->
                <p> Visita nuestra página web: 
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="ite/@web"/>
                        </xsl:attribute>
                        <xsl:value-of select="ite/@web"/>
                    </a>
                </p>
            </footer>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>