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
    <style>
        .seccion-formulario-logo {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 100px;
            margin: -15px 0 20px 0;
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
            transform: translateY(-35px);
        }
        .logo-container img {
            width: 340px;
            max-width: 100%;
            height: auto;
            object-fit: contain;
            filter: drop-shadow(0 4px 10px rgba(0,0,0,0.1));
        }
        .alerta-error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-weight: bold;
        }
    </style>
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
                    <a href="<%= request.getContextPath() %>/LeerEspeciesSv" style="display:inline-block; margin-top:10px;">Cancelar</a>
                <% } %>
            </form>
        </div>

        <div class="logo-container">
            <img src="<%= request.getContextPath() %>/img/logo_shido.png" alt="Logo SHIDO">
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