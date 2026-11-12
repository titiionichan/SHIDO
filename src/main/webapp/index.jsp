<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inicio - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
</head>
<body>
    <%@ include file="vistas/menu.jsp" %>

    <!-- Banner Hero con degradado horizontal de izquierda a derecha (#13302D) -->
    <header class="hero-banner-full" style="background-image: linear-gradient(to right, rgba(19, 48, 45, 0.95) 0%, rgba(19, 48, 45, 0.75) 40%, rgba(19, 48, 45, 0.25) 75%, transparent 100%), url('<%= request.getContextPath() %>/img/huerta_img_2.jpg');">
        <div class="hero-content">
            <span class="hero-tag">TECNOLOGÍA AGRÍCOLA</span>
            <h1 class="hero-title">BIENVENIDO A SHIDO</h1>
            <p class="hero-subtitle">
                Shido se encarga de que las personas no pierdan tiempo en ir a la huerta cuando no sea urgentemente necesario y que no se pierdan los datos de la misma.
            </p>
            <a href="<%= request.getContextPath() %>/vistas/informacion.jsp" class="btn-hero-outline">
                Ver más <span class="flecha">→</span>
            </a>
        </div>
    </header>

    <%@ include file="vistas/pie.jsp" %>
</body>
</html>