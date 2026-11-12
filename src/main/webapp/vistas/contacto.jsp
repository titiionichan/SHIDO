<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contacto - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <style>
        /* Banner superior enfocando la parte inferior de la foto */
        .banner-contacto {
            width: 100%;
            height: 280px;
            background-image: linear-gradient(rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.25)), 
                              url('<%= request.getContextPath() %>/img/huerta_img.png');
            background-size: cover;
            background-position: center bottom;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
        }

        /* Título del banner centrado */
        .titulo-contacto {
            color: #ffffff;
            font-size: 3.2rem;
            font-weight: 900;
            letter-spacing: 3px;
            margin: 0 !important;
            padding: 0 !important;
            text-transform: uppercase;
            text-shadow: 0px 4px 14px rgba(0, 0, 0, 0.7);
            text-align: center !important;
            width: 100% !important;
        }

        /* Grid de 2 columnas para las tarjetas */
        .contenedor-contacto-doble {
            max-width: 1050px;
            margin: 50px auto 80px auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            box-sizing: border-box;
        }

        /* Estilo base de los recuadros */
        .tarjeta-contacto {
            background-color: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 40px 30px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            box-sizing: border-box;
            width: 100%;
        }

        /* Recuadro 1: Párrafo de atención */
        .tarjeta-contacto p {
            font-size: 1.15rem;
            line-height: 1.7;
            color: #333333;
            margin: 0 !important;
            padding: 0 !important;
            text-align: center !important;
            width: 100%;
        }

        .tarjeta-contacto a {
            color: #3182ce;
            text-decoration: none;
            font-weight: 600;
        }

        .tarjeta-contacto a:hover {
            text-decoration: underline;
        }

        /* Recuadro 2: Anulación de márgenes globales heredados */
        .tarjeta-contacto h2.subtitulo-redes,
        .subtitulo-redes {
            font-size: 1.45rem;
            font-weight: 700;
            color: #1b4332;
            margin: 0 0 20px 0 !important; /* Elimina cualquier margin-left heredado */
            padding: 0 !important;
            text-align: center !important;
            width: 100% !important;
            display: block !important;
        }

        /* Botón de Instagram centrado */
        .item-instagram {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            text-decoration: none;
            color: #2d6a4f;
            font-size: 1.25rem;
            font-weight: 600;
            padding: 12px 28px;
            border-radius: 50px;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
            margin: 0 auto !important;
        }

        .item-instagram:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
            color: #e1306c;
            border-color: #fbb6ce;
        }

        .logo-instagram {
            width: 28px;
            height: 28px;
        }

        /* Adaptación móvil */
        @media (max-width: 768px) {
            .contenedor-contacto-doble {
                grid-template-columns: 1fr;
            }
            .titulo-contacto {
                font-size: 2.3rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>

    <!-- Banner principal centrado -->
    <header class="banner-contacto">
        <h1 class="titulo-contacto">CONTACTANOS</h1>
    </header>

    <!-- Sección con los 2 recuadros informativos -->
    <main class="contenedor-contacto-doble">
        
        <!-- Recuadro 1: Correo de atención -->
        <section class="tarjeta-contacto">
            <p>
                Para preguntas o comentarios de nuestro proyecto por favor comunicate con nosotros al siguiente mail:  
                <a href="https://mail.google.com/mail/?view=cm&fs=1&to=shido.itnsf@gmail.com" target="_blank">
    shido.itnsf@gmail.com
</a>.
            </p>
        </section>

        <!-- Recuadro 2: Redes Sociales perfectamente centradas -->
        <section class="tarjeta-contacto">
            <h2 class="subtitulo-redes">¡No te olvides de seguirnos!</h2>
            <a href="https://www.instagram.com/shido.vs" target="_blank" rel="noopener noreferrer" class="item-instagram">
                <svg class="logo-instagram" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                </svg>
                <span>shido.vs</span>
            </a>
        </section>

    </main>

    <%@ include file="pie.jsp" %>
</body>
</html>