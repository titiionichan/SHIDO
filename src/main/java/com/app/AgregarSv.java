package com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AgregarSv")
public class AgregarSv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String entidad = request.getParameter("entidad");
        String redirectUrl = "index.jsp";

        if ("canteros".equals(entidad)) redirectUrl = "LeerCanterosSv";
        else if ("cultivos".equals(entidad)) redirectUrl = "LeerCultivosSv";
        else if ("especies".equals(entidad)) redirectUrl = "LeerEspeciesSv";
        else if ("mediciones".equals(entidad)) redirectUrl = "LeerMedicionesSv";

        try (Connection conn = ConexionBD.obtenerConexion()) {
            
            if ("canteros".equals(entidad)) {
                String ubicacion = request.getParameter("ubicacion");
                String tipoTierra = request.getParameter("tipo_tierra");
                String tamano = request.getParameter("tamano");

                String sql = "INSERT INTO datos_canteros_prueba (ubicacion, tipo_tierra, tamano) VALUES (?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, ubicacion);
                    stmt.setString(2, tipoTierra);
                    stmt.setString(3, tamano);
                    stmt.executeUpdate();
                }

            } else if ("cultivos".equals(entidad)) {
                String nombreCultivo = request.getParameter("nombre_cultivo");
                int idEspecie = Integer.parseInt(request.getParameter("id_especie"));
                int idCantero = Integer.parseInt(request.getParameter("id_cantero"));
                Date fechaSiembra = Date.valueOf(request.getParameter("fecha_siembra")); // YYYY-MM-DD
                String estado = request.getParameter("estado");

                String sql = "INSERT INTO datos_cultivos_prueba (nombre_cultivo, id_especie, id_cantero, fecha_siembra, estado) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, nombreCultivo);
                    stmt.setInt(2, idEspecie);
                    stmt.setInt(3, idCantero);
                    stmt.setDate(4, fechaSiembra);
                    stmt.setString(5, estado);
                    stmt.executeUpdate();
                }

            } else if ("especies".equals(entidad)) {
                String nombreEspecie = request.getParameter("nombre_especie");
                int tiempoCrecimiento = Integer.parseInt(request.getParameter("tiempo_crecimiento"));
                String riegoRecomendado = request.getParameter("riego_recomendado");

                // Validación: Tiempo de crecimiento debe ser estrictamente positivo
                if (tiempoCrecimiento <= 0) {
                    request.setAttribute("error", "El tiempo de crecimiento debe ser un número entero mayor a 0.");
                    request.getRequestDispatcher(redirectUrl).forward(request, response);
                    return;
                }

                String sql = "INSERT INTO datos_especies_prueba (nombre_especie, tiempo_crecimiento, riego_recomendado) VALUES (?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, nombreEspecie);
                    stmt.setInt(2, tiempoCrecimiento);
                    stmt.setString(3, riegoRecomendado);
                    stmt.executeUpdate();
                }

            } else if ("mediciones".equals(entidad)) {
                int idCultivo = Integer.parseInt(request.getParameter("id_cultivo"));
                Date fechaMedicion = Date.valueOf(request.getParameter("fecha_medicion")); // YYYY-MM-DD
                float humedad = Float.parseFloat(request.getParameter("humedad"));
                float temperatura = Float.parseFloat(request.getParameter("temperatura"));

                // Validación: Humedad entre 0% y 100%
                if (humedad < 0 || humedad > 100) {
                    request.setAttribute("error", "La humedad debe estar comprendida entre 0% y 100%.");
                    request.getRequestDispatcher(redirectUrl).forward(request, response);
                    return;
                }

                // Validación: Rango de temperatura razonable
                if (temperatura < -10 || temperatura > 60) {
                    request.setAttribute("error", "La temperatura debe estar entre -10°C y 60°C.");
                    request.getRequestDispatcher(redirectUrl).forward(request, response);
                    return;
                }

                String sql = "INSERT INTO datos_mediciones_prueba (id_cultivo, fecha_medicion, humedad, temperatura) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, idCultivo);
                    stmt.setDate(2, fechaMedicion);
                    stmt.setFloat(3, humedad);
                    stmt.setFloat(4, temperatura);
                    stmt.executeUpdate();
                }
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese números válidos en los campos numéricos.");
            request.getRequestDispatcher(redirectUrl).forward(request, response);
            return;
        } catch (Exception e) {
            System.err.println("--- ERROR AL INSERTAR EN " + entidad + " ---");
            e.printStackTrace();
            request.setAttribute("error", "Ocurrió un error al procesar el registro en la base de datos.");
            request.getRequestDispatcher(redirectUrl).forward(request, response);
            return;
        }

        response.sendRedirect(redirectUrl);
    }
}