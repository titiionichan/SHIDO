<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/informacion.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <img src="<%= request.getContextPath() %>/img/huerta_tomates.jpeg" alt="Huerta bancales" class="img-bloque-info">
                    </div>
                </article>

                <!-- Bloque 2: La solución -->
                <article class="fila-info-item fila-invertida">
                    <div class="columna-imagen">
                        <img src="<%= request.getContextPath() %>/img/logo_shido.png" alt="Logo SHIDO" class="img-bloque-info">
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
                        <img src="<%= request.getContextPath() %>/img/patio_fatima_img.jpg" alt="Dónde está hoy" class="img-bloque-info">
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
        <p>Este proyecto está siendo desarrollado por estudiantes de Técnico en Computación del Instituto Técnico Nuestra Señora de Fátima:</p>
        
        <div class="grid-equipo-dos-columnas">
            <!-- Columna izquierda: Nombres y especialidades -->
            <ul class="lista-integrantes-horizontal">
                <li>
                    <span class="nombre-integrante">Tiziano Soliz</span>
                    <span class="flecha-especialidad" aria-hidden="true">→</span>
                    <span class="rol-integrante">Sitio web y bases de datos</span>
                </li>
                <li>
                    <span class="nombre-integrante">Shantal Guzman</span>
                    <span class="flecha-especialidad" aria-hidden="true">→</span>
                    <span class="rol-integrante">Hardware y carpeta de campo</span>
                </li>
                <li>
                    <span class="nombre-integrante">Yoel Bautista</span>
                    <span class="flecha-especialidad" aria-hidden="true">→</span>
                    <span class="rol-integrante">Hardware e IA</span>
                </li>
                <li>
                    <span class="nombre-integrante">Joaquin Suleta</span>
                    <span class="flecha-especialidad" aria-hidden="true">→</span>
                    <span class="rol-integrante">Diseño visual y hardware</span>
                </li>
                <li>
                    <span class="nombre-integrante">Agustin Suleta</span>
                    <span class="flecha-especialidad" aria-hidden="true">→</span>
                    <span class="rol-integrante">Sitio web y diseño visual</span>
                </li>
            </ul>

            <!-- Columna derecha: Foto del equipo -->
            <div class="columna-imagen-equipo">
                <img src="<%= request.getContextPath() %>/img/foto_quienes_somos.jpeg" alt="Equipo SHIDO" class="img-equipo-redondeada">
            </div>
        </div>
    </div>
</section>
    <%-- Pie de página --%>
    <%@ include file="pie.jsp" %>
</body>
</html>