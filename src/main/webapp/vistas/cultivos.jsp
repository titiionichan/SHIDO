<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    Map<String, String> cultivoEditar = (Map<String, String>) request.getAttribute("cultivoEditar");
    boolean esEdicion = (cultivoEditar != null);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cultivos - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/cultivos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <%@ include file="menu.jsp" %>

    <h1>Gestión de Cultivos</h1>

    <h2><%= esEdicion ? "Modificar Cultivo" : "Agregar Nuevo Cultivo" %></h2>

    <div class="seccion-formulario-logo">
        <div class="form-container">
            <form action="<%= request.getContextPath() %>/<%= esEdicion ? "EditarSv" : "AgregarSv" %>" method="POST">
                <input type="hidden" name="entidad" value="cultivos">
                <% if (esEdicion) { %>
                    <input type="hidden" name="id_cultivo" value="<%= cultivoEditar.get("id_cultivo") %>">
                <% } %>

                <div class="form-group">
                    <label>Nombre Cultivo:</label>
                    <input type="text" name="nombre_cultivo" value="<%= esEdicion ? cultivoEditar.get("nombre_cultivo") : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Especie:</label>
                    <select name="id_especie" required>
                        <option value="">-- Seleccionar Especie --</option>
                        <%
                            List<Map<String, String>> especiesOpt = (List<Map<String, String>>) request.getAttribute("listaEspeciesOpt");
                            if (especiesOpt != null) {
                                for (Map<String, String> esp : especiesOpt) {
                                    String selected = (esEdicion && esp.get("id_especie").equals(cultivoEditar.get("id_especie"))) ? "selected" : "";
                        %>
                            <option value="<%= esp.get("id_especie") %>" <%= selected %>>
                                <%= esp.get("nombre_especie") %>
                            </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label>Cantero:</label>
                    <select name="id_cantero" required>
                        <option value="">-- Seleccionar Cantero --</option>
                        <%
                            List<Map<String, String>> canterosOpt = (List<Map<String, String>>) request.getAttribute("listaCanterosOpt");
                            if (canterosOpt != null) {
                                for (Map<String, String> can : canterosOpt) {
                                    String selected = (esEdicion && can.get("id_cantero").equals(cultivoEditar.get("id_cantero"))) ? "selected" : "";
                        %>
                            <option value="<%= can.get("id_cantero") %>" <%= selected %>>
                                <%= can.get("ubicacion") %> (<%= can.get("tipo_tierra") %>)
                            </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label>Fecha Siembra:</label>
                    <input type="date" name="fecha_siembra" value="<%= esEdicion ? cultivoEditar.get("fecha_siembra") : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Estado:</label>
                    <input type="text" name="estado" value="<%= esEdicion ? cultivoEditar.get("estado") : "" %>" required>
                </div>

                <button type="submit" class="btn-submit"><%= esEdicion ? "Guardar Cambios" : "Agregar Cultivo" %></button>
                <% if (esEdicion) { %>
                    <a href="<%= request.getContextPath() %>/LeerCultivosSv" class="link-cancelar">Cancelar</a>
                <% } %>
            </form>
        </div>

        <div class="huerta-cultivos-container">
            <img src="<%= request.getContextPath() %>/img/huerta_cultivos.jpg" alt="Huerta Cultivos">
        </div>
    </div>

    <hr>

    <h2>Listado de Cultivos</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Especie</th>
                <th>Cantero</th>
                <th>Fecha Siembra</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Map<String, String>> lista = (List<Map<String, String>>) request.getAttribute("listaCultivos");
                if (lista != null && !lista.isEmpty()) {
                    for (Map<String, String> cultivo : lista) {
            %>
            <tr>
                <td><%= cultivo.get("id_cultivo") %></td>
                <td><%= cultivo.get("nombre_cultivo") %></td>
                <td><%= cultivo.get("nombre_especie") %></td>
                <td><%= cultivo.get("ubicacion_cantero") %></td>
                <td><%= cultivo.get("fecha_siembra") %></td>
                <td><%= cultivo.get("estado") %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/EditarSv?entidad=cultivos&id=<%= cultivo.get("id_cultivo") %>">Editar</a> | 
                    <a href="<%= request.getContextPath() %>/BorrarSv?entidad=cultivos&id=<%= cultivo.get("id_cultivo") %>" onclick="return confirm('¿Seguro que deseas eliminar este cultivo?')">Borrar</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7">No hay registros de cultivos.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
<%@ include file="/vistas/pie.jsp" %>
    
</body>
</html>