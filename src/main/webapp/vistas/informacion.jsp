<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
</head>
<body>
    <%-- Menú superior de navegación --%>
    <%@ include file="menu.jsp" %>

    <!-- Sección Qué es SHIDO (Filas en zigzag) -->
    <section class="seccion-que-es-shido">
        <div class="contenedor-que-es">
            <h1 class="titulo-que-es">Qué es SHIDO</h1>
            <p class="subtitulo-que-es">
                Es un sistema que realiza un monitoreo a las huertas para que "ir y venir" no represente un desperdicio de tiempo.
            </p>

            <div class="lista-filas-info">
                <!-- Bloque 1: El problema -->
                <article class="fila-info-item">
                    <div class="columna-texto">
                        <div class="linea-acento-top"></div>
                        <h2>El problema</h2>
                        <p>
                            El desperdicio de tiempo innecesario en ir a la huerta cuando los cultivos probablemente están bien, cuando cambian los alumnos a cargo, llegan los fines de semana o vacaciones y nadie riega, entonces no se sabe qué se sembró en cada cantero ni si las plantas están enfermas, provocando que los cultivos se sequen y se pierda todo el trabajo realizado.
                        </p>
                    </div>
                    <div class="columna-imagen">
                        <img src="<%= request.getContextPath() %>/img/problema.png" alt="El problema" class="img-bloque-info">
                        <img src="<%= request.getContextPath() %>/img/huerta_bancales.png" alt="Huerta bancales" class="img-bloque-info">
                    </div>
                </article>

                <!-- Bloque 2: La solución -->
                <article class="fila-info-item fila-invertida">
                    <div class="columna-imagen">
                        <img src="<%= request.getContextPath() %>/img/solucion.png" alt="La solución" class="img-bloque-info">
                        <img src="<%= request.getContextPath() %>/img/huerta_macetitas.png" alt="Huerta macetitas" class="img-bloque-info">
                    </div>
                    <div class="columna-texto">
                        <div class="linea-acento-top"></div>
                        <h2>La solución</h2>
                        <p>
                            Ofrecemos un monitoreo agrícola. Este se encargará de recolectar información sobre cada planta a través de un vehículo robótico, que cuenta una cámara con IA integrada para recorrer la huerta, que registra el estado de las plantas, y mide, a través de diversos sensores, la humedad, temperatura y estado de la tierra.
                        </p>
                    </div>
                </article>

                <!-- Bloque 3: Dónde está hoy -->
                <article class="fila-info-item">
                    <div class="columna-texto">
                        <div class="linea-acento-top"></div>
                        <h2>Dónde está hoy</h2>
                        <p>
                            En prueba piloto dentro del Instituto Técnico Nuestra Señora de Fátima (A-893), en Villa Soldati. Los alimentos cosechados se envían directamente al comedor escolar.
                        </p>
                    </div>
                    <div class="columna-imagen">
                        <img src="<%= request.getContextPath() %>/img/donde_esta.png" alt="Dónde está hoy" class="img-bloque-info">
                    </div>
                </article>
            </div>
        </div>
    </section>

    <!-- Sección Impacto (Estilo con imagen a la izquierda y barra de acento a la derecha) -->
    <section class="seccion-impacto-historia">
        <div class="contenedor-que-es">
            <div class="grid-impacto-dos-columnas">
                
                <!-- Columna Izquierda: Imagen redondeada -->
                <div class="columna-imagen-impacto">
                    <img src="<%= request.getContextPath() %>/img/comedor_huerta.png" alt="Comedor escolar y huerta" class="img-impacto-redondeada">
                </div>

                <!-- Columna Derecha: Título, Párrafos y Bloque Destacado -->
                <div class="columna-texto-impacto">
                    <h2 class="titulo-impacto">¿A quiénes afecta y de qué manera?</h2>

                    <p class="p-impacto">
                        La huerta escolar se realiza con el fin de poder colaborar o hacer servicio comunitario con el comedor, por lo que las personas del comedor se verían directamente afectadas si en la huerta no se le da el cuidado correcto a las plantas.
                    </p>

                    <p class="p-impacto">
                        Si se pierden los datos o la información de estos cultivos, el comedor no va a poder brindarle los alimentos necesarios a la gente para su bienestar.
                    </p>

                    <!-- Bloque destacado con línea vertical verde a la izquierda -->
                    <div class="bloque-destacado-izq">
                        <span class="titulo-destacado-izq">Compromiso con el comedor</span>
                        <p>
                            Garantizar el seguimiento constante y preciso evita el desperdicio de cosechas y asegura el suministro alimentario del colegio.
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Sección Equipo / Quiénes somos -->
    <section class="seccion-equipo-simple" id="quienes-somos">
        <div class="contenedor-que-es">
            <div class="linea-acento-top"></div>
            <h2>Quiénes somos</h2>
            <p>Desarrollado por alumnos del Instituto Técnico Nuestra Señora de Fátima:</p>
            <ul class="lista-integrantes-horizontal">
                <li>Tiziano Soliz</li>
                <li>Shantal Guzman</li>
                <li>Yoel Bautista</li>
                <li>Joaquin Suleta</li>
                <li>Agustin Suleta</li>
            </ul>
        </div>
    </section>

    <%-- Pie de página --%>
    <%@ include file="pie.jsp" %>
</body>
</html>