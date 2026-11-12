<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    Map<String, String> canteroEditar = (Map<String, String>) request.getAttribute("canteroEditar");
    boolean esEdicion = (canteroEditar != null);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Canteros - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/canteros.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <%@ include file="menu.jsp" %>

    <h1>Gestión de Canteros</h1>

    <h2><%= esEdicion ? "Modificar Cantero" : "Agregar Nuevo Cantero" %></h2>

    <div class="seccion-formulario-logo">
        <div class="form-container">
            <form action="<%= request.getContextPath() %>/<%= esEdicion ? "EditarSv" : "AgregarSv" %>" method="POST">
                <input type="hidden" name="entidad" value="canteros">
                <% if (esEdicion) { %>
                    <input type="hidden" name="id_cantero" value="<%= canteroEditar.get("id_cantero") %>">
                <% } %>

                <div class="form-group">
                    <label>Ubicación:</label>
                    <input type="text" name="ubicacion" value="<%= esEdicion ? canteroEditar.get("ubicacion") : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Tipo de Tierra:</label>
                    <input type="text" name="tipo_tierra" value="<%= esEdicion ? canteroEditar.get("tipo_tierra") : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Tamaño:</label>
                    <input type="text" name="tamano" value="<%= esEdicion ? canteroEditar.get("tamano") : "" %>" required>
                </div>

                <button type="submit" class="btn-submit"><%= esEdicion ? "Guardar Cambios" : "Agregar Cantero" %></button>
                <% if (esEdicion) { %>
                    <a href="<%= request.getContextPath() %>/LeerCanterosSv" class="link-cancelar">Cancelar</a>
                <% } %>
            </form>
        </div>

        <div class="huerta-imagen-container">
            <img src="<%= request.getContextPath() %>/img/huerta_bancales.jpeg" alt="Imagen De Bancales">
        </div>
    </div>

    <hr>

    <h2>Listado de Canteros</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Ubicación</th>
                <th>Tipo de Tierra</th>
                <th>Tamaño</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Map<String, String>> lista = (List<Map<String, String>>) request.getAttribute("listaCanteros");
                if (lista != null && !lista.isEmpty()) {
                    for (Map<String, String> cantero : lista) {
            %>
            <tr>
                <td><%= cantero.get("id_cantero") %></td>
                <td><%= cantero.get("ubicacion") %></td>
                <td><%= cantero.get("tipo_tierra") %></td>
                <td><%= cantero.get("tamano") %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/EditarSv?entidad=canteros&id=<%= cantero.get("id_cantero") %>">Editar</a> | 
                    <a href="<%= request.getContextPath() %>/BorrarSv?entidad=canteros&id=<%= cantero.get("id_cantero") %>" onclick="return confirm('¿Seguro que deseas eliminar este cantero?')">Borrar</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">No hay registros de canteros.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
<%@ include file="/vistas/pie.jsp" %>

</body>
</html>