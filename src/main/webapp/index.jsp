<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/index.css">
</head>
<body>
    <%@ include file="vistas/menu.jsp" %>

    <!-- Banner Hero con carrusel continuo de 3 fotos -->
    <header class="hero-banner-full">
        <!-- Pista deslizante de imágenes (3 fotos + clon inicial para bucle continuo) -->
        <div class="hero-slider-track" aria-hidden="true">
            <div class="hero-slide slide-huerta2"></div>
            <div class="hero-slide slide-hidroponia"></div>
            <div class="hero-slide slide-patio"></div>
            <div class="hero-slide slide-huerta2"></div>
        </div>

        <!-- Capa de degradado oscura fija para mantener legible el texto -->
        <div class="hero-overlay" aria-hidden="true"></div>

        <!-- Contenido fijo por delante -->
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