<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contacto - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/contacto.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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