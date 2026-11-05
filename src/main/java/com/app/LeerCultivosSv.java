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

@WebServlet("/LeerCultivosSv")
public class LeerCultivosSv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Map<String, String>> cultivos = new ArrayList<>();
        List<Map<String, String>> especiesOpt = new ArrayList<>();
        List<Map<String, String>> canterosOpt = new ArrayList<>();

        try (Connection conn = ConexionBD.obtenerConexion()) {
            
            // 1. Obtener Cultivos con nombres mediante LEFT JOIN
            String sqlCultivos = "SELECT c.*, e.nombre_especie, ca.ubicacion " +
                                 "FROM datos_cultivos_prueba c " +
                                 "LEFT JOIN datos_especies_prueba e ON c.id_especie = e.id_especie " +
                                 "LEFT JOIN datos_canteros_prueba ca ON c.id_cantero = ca.id_cantero";

            try (PreparedStatement stmt = conn.prepareStatement(sqlCultivos);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Map<String, String> cultivo = new HashMap<>();
                    cultivo.put("id_cultivo", String.valueOf(rs.getInt("id_cultivo")));
                    cultivo.put("nombre_cultivo", rs.getString("nombre_cultivo"));
                    cultivo.put("id_especie", String.valueOf(rs.getInt("id_especie")));
                    cultivo.put("id_cantero", String.valueOf(rs.getInt("id_cantero")));
                    cultivo.put("nombre_especie", rs.getString("nombre_especie") != null ? rs.getString("nombre_especie") : "Sin Especie");
                    cultivo.put("ubicacion_cantero", rs.getString("ubicacion") != null ? rs.getString("ubicacion") : "Sin Cantero");
                    cultivo.put("fecha_siembra", String.valueOf(rs.getDate("fecha_siembra")));
                    cultivo.put("estado", rs.getString("estado"));
                    cultivos.add(cultivo);
                }
            }

            // 2. Obtener Especies para el <select>
            String sqlEspecies = "SELECT id_especie, nombre_especie FROM datos_especies_prueba";
            try (PreparedStatement stmt = conn.prepareStatement(sqlEspecies);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Map<String, String> esp = new HashMap<>();
                    esp.put("id_especie", String.valueOf(rs.getInt("id_especie")));
                    esp.put("nombre_especie", rs.getString("nombre_especie"));
                    especiesOpt.add(esp);
                }
            }

            // 3. Obtener Canteros para el <select>
            String sqlCanteros = "SELECT id_cantero, ubicacion, tipo_tierra FROM datos_canteros_prueba";
            try (PreparedStatement stmt = conn.prepareStatement(sqlCanteros);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Map<String, String> can = new HashMap<>();
                    can.put("id_cantero", String.valueOf(rs.getInt("id_cantero")));
                    can.put("ubicacion", rs.getString("ubicacion"));
                    can.put("tipo_tierra", rs.getString("tipo_tierra"));
                    canterosOpt.add(can);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("listaCultivos", cultivos);
        request.setAttribute("listaEspeciesOpt", especiesOpt);
        request.setAttribute("listaCanterosOpt", canterosOpt);
        
        request.getRequestDispatcher("vistas/cultivos.jsp").forward(request, response);
    }
}