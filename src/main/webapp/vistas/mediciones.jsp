<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    Map medicionEditar = (Map) request.getAttribute("medicionEditar");
    boolean esEdicion = (medicionEditar != null);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mediciones - SHIDO</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/estilo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/estilos/mediciones.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <%@ include file="menu.jsp" %>

    <h1>Gestión de Mediciones</h1>

    <% if (request.getAttribute("error") != null) { %>
        <div class="alerta-error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <h2><%= esEdicion ? "Modificar Medición" : "Agregar Nueva Medición" %></h2>

    <div class="seccion-formulario-logo">
        <div class="form-container">
            <form action="<%= request.getContextPath() %>/<%= esEdicion ? "EditarSv" : "AgregarSv" %>" method="POST">
                <input type="hidden" name="entidad" value="mediciones">
                <% if (esEdicion) { %>
                    <input type="hidden" name="id_medicion" value="<%= medicionEditar.get("id_medicion") %>">
                <% } %>

                <div class="form-group">
                    <label>Cultivo:</label>
                    <select name="id_cultivo" required>
                        <option value="">-- Seleccionar Cultivo --</option>
                        <%
                            List cultivosOpt = (List) request.getAttribute("listaCultivosOpt");
                            if (cultivosOpt != null) {
                                for (Object obj : cultivosOpt) {
                                    Map cul = (Map) obj;
                                    String selected = (esEdicion && cul.get("id_cultivo").toString().equals(medicionEditar.get("id_cultivo").toString())) ? "selected" : "";
                        %>
                            <option value="<%= cul.get("id_cultivo") %>" <%= selected %>>
                                <%= cul.get("nombre_cultivo") %>
                            </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label>Fecha Medición:</label>
                    <input type="date" name="fecha_medicion" value="<%= esEdicion ? medicionEditar.get("fecha_medicion") : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Humedad (%):</label>
                    <input type="number" step="0.1" min="0" max="100" name="humedad" value="<%= esEdicion ? medicionEditar.get("humedad") : "" %>" required placeholder="Ej. 65">
                </div>

                <div class="form-group">
                    <label>Temperatura (°C):</label>
                    <input type="number" step="0.1" min="-10" max="60" name="temperatura" value="<%= esEdicion ? medicionEditar.get("temperatura") : "" %>" required placeholder="Ej. 22">
                </div>

                <button type="submit" class="btn-submit"><%= esEdicion ? "Guardar Cambios" : "Agregar Medición" %></button>
                <% if (esEdicion) { %>
                    <a href="<%= request.getContextPath() %>/LeerMedicionesSv" class="link-cancelar">Cancelar</a>
                <% } %>
            </form>
        </div>

        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/img/logo_shido.png" alt="Logo SHIDO">
        </div>
    </div>

    <hr>

    <h2>Listado de Mediciones</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Cultivo</th>
                <th>Fecha Medición</th>
                <th>Humedad (%)</th>
                <th>Temperatura (°C)</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                List lista = (List) request.getAttribute("listaMediciones");
                if (lista != null && !lista.isEmpty()) {
                    for (Object obj : lista) {
                        Map medicion = (Map) obj;
            %>
            <tr>
                <td><%= medicion.get("id_medicion") %></td>
                <td><%= medicion.get("nombre_cultivo") %></td>
                <td><%= medicion.get("fecha_medicion") %></td>
                <td><%= medicion.get("humedad") %></td>
                <td><%= medicion.get("temperatura") %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/EditarSv?entidad=mediciones&id=<%= medicion.get("id_medicion") %>">Editar</a> | 
                    <a href="<%= request.getContextPath() %>/BorrarSv?entidad=mediciones&id=<%= medicion.get("id_medicion") %>" onclick="return confirm('¿Seguro que deseas eliminar esta medición?')">Borrar</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">No hay registros de mediciones.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <%@ include file="pie.jsp" %>
</body>
</html>