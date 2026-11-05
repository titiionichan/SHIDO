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
                    <a href="<%= request.getContextPath() %>/LeerCanterosSv" style="display:inline-block; margin-top:10px;">Cancelar</a>
                <% } %>
            </form>
        </div>

        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/img/logo_shido.png" alt="Logo SHIDO">
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