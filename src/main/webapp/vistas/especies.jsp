<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    Map especieEditar = (Map) request.getAttribute("especieEditar");
    boolean esEdicion = (especieEditar != null);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Especies - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/especies.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <%@ include file="menu.jsp" %>

    <h1>Gestión de Especies</h1>

    <% if (request.getAttribute("error") != null) { %>
        <div class="alerta-error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <h2><%= esEdicion ? "Modificar Especie" : "Agregar Nueva Especie" %></h2>

    <div class="seccion-formulario-logo">
        <div class="form-container">
            <form action="<%= request.getContextPath() %>/<%= esEdicion ? "EditarSv" : "AgregarSv" %>" method="POST">
                <input type="hidden" name="entidad" value="especies">
                <% if (esEdicion) { %>
                    <input type="hidden" name="id_especie" value="<%= especieEditar.get("id_especie") %>">
                <% } %>

                <div class="form-group">
                    <label>Nombre Especie:</label>
                    <input type="text" name="nombre_especie" value="<%= esEdicion ? especieEditar.get("nombre_especie") : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Tiempo Crecimiento (días):</label>
                    <input type="number" name="tiempo_crecimiento" min="1" value="<%= esEdicion ? especieEditar.get("tiempo_crecimiento") : "" %>" required placeholder="Ej. 90">
                </div>

                <div class="form-group">
                    <label>Riego Recomendado:</label>
                    <input type="text" name="riego_recomendado" value="<%= esEdicion ? especieEditar.get("riego_recomendado") : "" %>" required>
                </div>

                <button type="submit" class="btn-submit"><%= esEdicion ? "Guardar Cambios" : "Agregar Especie" %></button>
                <% if (esEdicion) { %>
                    <a href="<%= request.getContextPath() %>/LeerEspeciesSv" class="link-cancelar">Cancelar</a>
                <% } %>
            </form>
        </div>

       <div class="huerta-especies-container">
    <img src="<%= request.getContextPath() %>/img/huerta_especie_1.jpg" alt="Especie 1">
    <img src="<%= request.getContextPath() %>/img/huerta_especie_2.jpg" alt="Especie 2">
    <img src="<%= request.getContextPath() %>/img/huerta_especie_3.jpg" alt="Especie 3">
    <img src="<%= request.getContextPath() %>/img/huerta_especie_4.jpg" alt="Especie 4">
</div>
    </div>

    <hr>

    <h2>Listado de Especies</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Crecimiento (días)</th>
                <th>Riego Recomendado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                List lista = (List) request.getAttribute("listaEspecies");
                if (lista != null && !lista.isEmpty()) {
                    for (Object obj : lista) {
                        Map especie = (Map) obj;
            %>
            <tr>
                <td><%= especie.get("id_especie") %></td>
                <td><%= especie.get("nombre_especie") %></td>
                <td><%= especie.get("tiempo_crecimiento") %></td>
                <td><%= especie.get("riego_recomendado") %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/EditarSv?entidad=especies&id=<%= especie.get("id_especie") %>">Editar</a> | 
                    <a href="<%= request.getContextPath() %>/BorrarSv?entidad=especies&id=<%= especie.get("id_especie") %>" onclick="return confirm('¿Seguro que deseas eliminar esta especie?')">Borrar</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">No hay registros de especies.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <%@ include file="pie.jsp" %>
</body>
</html>