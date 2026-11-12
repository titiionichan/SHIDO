<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="footer">

    <!-- Ola animada -->
    <div class="footer-ola" aria-hidden="true">
        <div class="footer-ola-track">
            <svg viewBox="0 0 1440 90" preserveAspectRatio="none">
                <path d="M0,50 C120,10 240,10 360,45 C480,80 600,80 720,50 C840,10 960,10 1080,45 C1200,80 1320,80 1440,50 L1440,90 L0,90 Z"/>
            </svg>
            <svg viewBox="0 0 1440 90" preserveAspectRatio="none">
                <path d="M0,50 C120,10 240,10 360,45 C480,80 600,80 720,50 C840,10 960,10 1080,45 C1200,80 1320,80 1440,50 L1440,90 L0,90 Z"/>
            </svg>
        </div>
    </div>

    <!-- Zona del Logo -->
    <div class="footer-brand">
        <img src="<%= request.getContextPath() %>/img/logo_shido.png" alt="Logo SHIDO" class="footer-logo">
    </div>

    <!-- Zona central: Botones "Conócenos" y "Contacto" -->
    <div class="footer-nav-container">
        <div class="footer-btn-group">
            <a href="<%= request.getContextPath() %>/vistas/informacion.jsp#quienes-somos" class="footer-btn-pill">Conócenos</a>
            <a href="<%= request.getContextPath() %>/vistas/contacto.jsp" class="footer-btn-pill">Contactanos</a>
        </div>
    </div>

    <!-- Barra inferior -->
    <div class="footer-info">
        Instituto Técnico Nuestra Señora de Fátima (A-893) · Villa Soldati, Ciudad de Buenos Aires, Argentina
    </div>

    <div class="footer-copyright">
        © 2026 Shido
    </div>
</footer>