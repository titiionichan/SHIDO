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

@WebServlet("/LeerCanterosSv")
public class LeerCanterosSv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Map<String, String>> canteros = new ArrayList<>();
        String sql = "SELECT * FROM datos_canteros_prueba";

        try (Connection conn = ConexionBD.obtenerConexion();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, String> cantero = new HashMap<>();
                cantero.put("id_cantero", String.valueOf(rs.getInt("id_cantero")));
                cantero.put("ubicacion", rs.getString("ubicacion"));
                cantero.put("tipo_tierra", rs.getString("tipo_tierra"));
                cantero.put("tamano", rs.getString("tamano"));
                canteros.add(cantero);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("listaCanteros", canteros);
        request.getRequestDispatcher("vistas/canteros.jsp").forward(request, response);
    }
}