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
    <style>
        .seccion-formulario-logo {
            display: flex;
            align-items: center; /* Alinea verticalmente los centros de la tarjeta y del logo */
            justify-content: flex-start;
            gap: 100px;
            margin: -15px 0 20px 0; /* Sube la sección hacia el título */
            flex-wrap: wrap;
        }
        .form-container {
            max-width: 400px;
            width: 100%;
            background-color: #ffffff;
            padding: 18px 22px;
            border-radius: 8px;
            border-left: 5px solid #2d6a4f;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        .form-group {
            display: block;
            margin-bottom: 12px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #1b4332;
            margin-bottom: 4px;
        }
        .form-group input, 
        .form-group select {
            display: block;
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 0.95rem;
        }
        .btn-submit {
            display: block;
            background-color: #2d6a4f;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-submit:hover {
            background-color: #1b4332;
        }
        .logo-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0;
            transform: translateY(-35px); /* Eleva el logo para que su centro coincida exactamente con la tarjeta */
        }
        .logo-container img {
            width: 340px;
            max-width: 100%;
            height: auto;
            object-fit: contain;
            filter: drop-shadow(0 4px 10px rgba(0,0,0,0.1));
        }
    </style>
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
                    <a href="<%= request.getContextPath() %>/LeerCultivosSv" style="display:inline-block; margin-top:10px;">Cancelar</a>
                <% } %>
            </form>
        </div>

        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/img/logo_shido.png" alt="Logo SHIDO">
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