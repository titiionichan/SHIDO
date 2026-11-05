<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inicio - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <style>
        /* Banner superior con desvanecido sutil hacia el fondo de la página */
        .contenedor-logo-principal {
            width: 100%;
            padding: 85px 0 95px 0;
            background-image: linear-gradient(to bottom, transparent 65%, #f4f6f8 100%), 
                              url('<%= request.getContextPath() %>/img/huerta_img.png');
            background-size: cover;
            background-position: center 50%;
            background-repeat: no-repeat;
            text-align: center;
        }

        .logo-principal {
            width: 380px;
            max-width: 90%;
            height: auto;
            object-fit: contain;
            filter: drop-shadow(0 6px 15px rgba(0, 0, 0, 0.35));
        }

        /* Contenedor flotante organizado en 3 columnas */
        .contenedor-inicio {
            max-width: 1100px; /* Ampliado para permitir 3 columnas cómodamente */
            margin: -35px auto 40px auto;
            padding: 0 20px;
            text-align: center;
            position: relative;
            z-index: 2;
            display: grid; /* Activa la cuadrícula en columnas */
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }

        .tarjeta-info {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 24px 25px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
            border-top: 4px solid #2d6a4f; /* Borde verde en la parte superior */
            text-align: left;
        }

        .tarjeta-info h2 {
            color: #2d6a4f;
            margin-top: 0;
            margin-bottom: 12px;
            font-size: 1.35rem;
            margin-left: 0 !important;
            padding-left: 0 !important;
        }

        .tarjeta-info p {
            margin: 0;
            line-height: 1.6;
            color: #333333;
        }

        .lista-integrantes {
            list-style: none;
            padding-left: 0;
            margin-top: 12px;
            margin-bottom: 0;
        }

        .lista-integrantes li {
            padding: 4px 0;
            position: relative;
            padding-left: 20px;
            color: #333333;
        }

        .lista-integrantes li::before {
            content: "•";
            color: #2d6a4f;
            font-weight: bold;
            font-size: 1.2rem;
            position: absolute;
            left: 0;
            top: 2px;
        }

        /* Adaptación para pantallas chicas */
        @media (max-width: 850px) {
            .contenedor-inicio {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%@ include file="vistas/menu.jsp" %>

    <!-- Banner con imagen de huerta y logo -->
    <div class="contenedor-logo-principal">
        <img src="<%= request.getContextPath() %>/img/logo_shido.png" alt="Logo SHIDO" class="logo-principal">
    </div>

    <!-- Secciones informativas en 3 columnas -->
    <main class="contenedor-inicio">
        <section class="tarjeta-info">
            <h2>¿Qué problema resuelve?</h2>
            <p>Shido se encarga de que las personas no pierdan tiempo en ir a la huerta cuando no sea urgentemente necesario y que no se pierdan los datos de la misma.</p>
        </section>

        <section class="tarjeta-info">
            <h2>¿Para quién es?</h2>
            <p>Es principalmente para la gente del comedor escolar, ya que los alimentos que se cosechan en la huerta se envían al comedor.</p>
        </section>

        <section class="tarjeta-info">
            <h2>¿Quiénes somos?</h2>
            <p>Nosotros somos alumnos del Instituto Técnico Nuestra Señora de Fátima:</p>
            <ul class="lista-integrantes">
                <li>Tiziano Soliz</li>
                <li>Shantal Guzman</li>
                <li>Yoel Bautista</li>
                <li>Joaquin Suleta</li>
                <li>Agustin Suleta</li>
            </ul>
        </section>
    </main>

    <%@ include file="vistas/pie.jsp" %>
</body>
</html>