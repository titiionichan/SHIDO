<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar">
    <div class="nav-brand">
        <a href="<%= request.getContextPath() %>/index.jsp">
            <img src="<%= request.getContextPath() %>/img/logo_shido_pie.png" alt="Logo SHIDO" class="nav-logo">
        </a>
    </div>
    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/index.jsp">Inicio</a>
        <a href="<%= request.getContextPath() %>/LeerCanterosSv">Canteros</a>
        <a href="<%= request.getContextPath() %>/LeerEspeciesSv">Especies</a>
        <a href="<%= request.getContextPath() %>/LeerCultivosSv">Cultivos</a>
        <a href="<%= request.getContextPath() %>/LeerMedicionesSv">Mediciones</a>
    </div>
</nav>