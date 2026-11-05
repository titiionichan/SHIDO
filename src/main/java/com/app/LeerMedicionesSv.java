package com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LeerMedicionesSv")
public class LeerMedicionesSv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Map<String, String>> mediciones = new ArrayList<>();
        List<Map<String, String>> cultivosOpt = new ArrayList<>();

        try (Connection conn = ConexionBD.obtenerConexion()) {
            
            // 1. Obtener Mediciones uniendo con Cultivos
            String sqlMediciones = "SELECT m.*, c.nombre_cultivo " +
                                   "FROM datos_mediciones_prueba m " +
                                   "LEFT JOIN datos_cultivos_prueba c ON m.id_cultivo = c.id_cultivo";

            try (PreparedStatement stmt = conn.prepareStatement(sqlMediciones);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Map<String, String> medicion = new HashMap<>();
                    medicion.put("id_medicion", String.valueOf(rs.getInt("id_medicion")));
                    medicion.put("id_cultivo", String.valueOf(rs.getInt("id_cultivo")));
                    medicion.put("nombre_cultivo", rs.getString("nombre_cultivo") != null ? rs.getString("nombre_cultivo") : "Sin Cultivo");
                    medicion.put("fecha_medicion", String.valueOf(rs.getDate("fecha_medicion")));
                    medicion.put("humedad", String.valueOf(rs.getFloat("humedad")));
                    medicion.put("temperatura", String.valueOf(rs.getFloat("temperatura")));
                    mediciones.add(medicion);
                }
            }

            // 2. Obtener Cultivos para el <select>
            String sqlCultivos = "SELECT id_cultivo, nombre_cultivo FROM datos_cultivos_prueba";
            try (PreparedStatement stmt = conn.prepareStatement(sqlCultivos);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Map<String, String> cul = new HashMap<>();
                    cul.put("id_cultivo", String.valueOf(rs.getInt("id_cultivo")));
                    cul.put("nombre_cultivo", rs.getString("nombre_cultivo"));
                    cultivosOpt.add(cul);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("listaMediciones", mediciones);
        request.setAttribute("listaCultivosOpt", cultivosOpt);
        
        request.getRequestDispatcher("vistas/mediciones.jsp").forward(request, response);
    }
}