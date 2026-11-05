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

@WebServlet("/LeerEspeciesSv")
public class LeerEspeciesSv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Map<String, String>> especies = new ArrayList<>();
        String sql = "SELECT * FROM datos_especies_prueba";

        try (Connection conn = ConexionBD.obtenerConexion();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, String> especie = new HashMap<>();
                especie.put("id_especie", String.valueOf(rs.getInt("id_especie")));
                especie.put("nombre_especie", rs.getString("nombre_especie"));
                especie.put("tiempo_crecimiento", String.valueOf(rs.getInt("tiempo_crecimiento")));
                especie.put("riego_recomendado", rs.getString("riego_recomendado"));
                especies.add(especie);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("listaEspecies", especies);
        request.getRequestDispatcher("vistas/especies.jsp").forward(request, response);
    }
}