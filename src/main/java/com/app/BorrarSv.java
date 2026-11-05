package com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BorrarSv")
public class BorrarSv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String entidad = request.getParameter("entidad");
        String id = request.getParameter("id");

        if (entidad != null && id != null) {
            try (Connection conn = ConexionBD.obtenerConexion()) {
                String sql = "";
                String redirect = "";

                switch (entidad) {
                    case "canteros":
                        sql = "DELETE FROM datos_canteros_prueba WHERE id_cantero = ?";
                        redirect = "LeerCanterosSv";
                        break;
                    case "cultivos":
                        sql = "DELETE FROM datos_cultivos_prueba WHERE id_cultivo = ?";
                        redirect = "LeerCultivosSv";
                        break;
                    case "especies":
                        sql = "DELETE FROM datos_especies_prueba WHERE id_especie = ?";
                        redirect = "LeerEspeciesSv";
                        break;
                    case "mediciones":
                        sql = "DELETE FROM datos_mediciones_prueba WHERE id_medicion = ?";
                        redirect = "LeerMedicionesSv";
                        break;
                }

                if (!sql.isEmpty()) {
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, Integer.parseInt(id));
                        stmt.executeUpdate();
                    }
                    response.sendRedirect(redirect);
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("index.jsp");
    }
}