package com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditarSv")
public class EditarSv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String entidad = request.getParameter("entidad");
        String id = request.getParameter("id");

        if (entidad != null && id != null) {
            try (Connection conn = ConexionBD.obtenerConexion()) {

                if ("canteros".equals(entidad)) {
                    String sql = "SELECT * FROM datos_canteros_prueba WHERE id_cantero = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, Integer.parseInt(id));
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                Map<String, String> canteroEditar = new HashMap<>();
                                canteroEditar.put("id_cantero", String.valueOf(rs.getInt("id_cantero")));
                                canteroEditar.put("ubicacion", rs.getString("ubicacion"));
                                canteroEditar.put("tipo_tierra", rs.getString("tipo_tierra"));
                                canteroEditar.put("tamano", rs.getString("tamano"));
                                request.setAttribute("canteroEditar", canteroEditar);
                            }
                        }
                    }
                    request.getRequestDispatcher("LeerCanterosSv").forward(request, response);
                    return;

                } else if ("cultivos".equals(entidad)) {
                    String sql = "SELECT * FROM datos_cultivos_prueba WHERE id_cultivo = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, Integer.parseInt(id));
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                Map<String, String> cultivoEditar = new HashMap<>();
                                cultivoEditar.put("id_cultivo", String.valueOf(rs.getInt("id_cultivo")));
                                cultivoEditar.put("nombre_cultivo", rs.getString("nombre_cultivo"));
                                cultivoEditar.put("id_especie", String.valueOf(rs.getInt("id_especie")));
                                cultivoEditar.put("id_cantero", String.valueOf(rs.getInt("id_cantero")));
                                cultivoEditar.put("fecha_siembra", String.valueOf(rs.getDate("fecha_siembra")));
                                cultivoEditar.put("estado", rs.getString("estado"));
                                request.setAttribute("cultivoEditar", cultivoEditar);
                            }
                        }
                    }
                    request.getRequestDispatcher("LeerCultivosSv").forward(request, response);
                    return;

                } else if ("especies".equals(entidad)) {
                    String sql = "SELECT * FROM datos_especies_prueba WHERE id_especie = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, Integer.parseInt(id));
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                Map<String, String> especieEditar = new HashMap<>();
                                especieEditar.put("id_especie", String.valueOf(rs.getInt("id_especie")));
                                especieEditar.put("nombre_especie", rs.getString("nombre_especie"));
                                especieEditar.put("tiempo_crecimiento", String.valueOf(rs.getInt("tiempo_crecimiento")));
                                especieEditar.put("riego_recomendado", rs.getString("riego_recomendado"));
                                request.setAttribute("especieEditar", especieEditar);
                            }
                        }
                    }
                    request.getRequestDispatcher("LeerEspeciesSv").forward(request, response);
                    return;

                } else if ("mediciones".equals(entidad)) {
                    String sql = "SELECT * FROM datos_mediciones_prueba WHERE id_medicion = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, Integer.parseInt(id));
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                Map<String, String> medicionEditar = new HashMap<>();
                                medicionEditar.put("id_medicion", String.valueOf(rs.getInt("id_medicion")));
                                medicionEditar.put("id_cultivo", String.valueOf(rs.getInt("id_cultivo")));
                                medicionEditar.put("fecha_medicion", String.valueOf(rs.getDate("fecha_medicion")));
                                medicionEditar.put("humedad", String.valueOf(rs.getFloat("humedad")));
                                medicionEditar.put("temperatura", String.valueOf(rs.getFloat("temperatura")));
                                request.setAttribute("medicionEditar", medicionEditar);
                            }
                        }
                    }
                    request.getRequestDispatcher("LeerMedicionesSv").forward(request, response);
                    return;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
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
                String idCantero = request.getParameter("id_cantero");
                String ubicacion = request.getParameter("ubicacion");
                String tipoTierra = request.getParameter("tipo_tierra");
                String tamano = request.getParameter("tamano");

                String sql = "UPDATE datos_canteros_prueba SET ubicacion = ?, tipo_tierra = ?, tamano = ? WHERE id_cantero = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, ubicacion);
                    stmt.setString(2, tipoTierra);
                    stmt.setString(3, tamano);
                    stmt.setInt(4, Integer.parseInt(idCantero));
                    stmt.executeUpdate();
                }

            } else if ("cultivos".equals(entidad)) {
                String idCultivo = request.getParameter("id_cultivo");
                String nombreCultivo = request.getParameter("nombre_cultivo");
                String idEspecie = request.getParameter("id_especie");
                String idCantero = request.getParameter("id_cantero");
                String fechaSiembra = request.getParameter("fecha_siembra");
                String estado = request.getParameter("estado");

                String sql = "UPDATE datos_cultivos_prueba SET nombre_cultivo = ?, id_especie = ?, id_cantero = ?, fecha_siembra = ?, estado = ? WHERE id_cultivo = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, nombreCultivo);
                    stmt.setInt(2, Integer.parseInt(idEspecie));
                    stmt.setInt(3, Integer.parseInt(idCantero));
                    stmt.setString(4, fechaSiembra);
                    stmt.setString(5, estado);
                    stmt.setInt(6, Integer.parseInt(idCultivo));
                    stmt.executeUpdate();
                }

            } else if ("especies".equals(entidad)) {
                String idEspecie = request.getParameter("id_especie");
                String nombreEspecie = request.getParameter("nombre_especie");
                String tiempoCrecimiento = request.getParameter("tiempo_crecimiento");
                String riegoRecomendado = request.getParameter("riego_recomendado");

                String sql = "UPDATE datos_especies_prueba SET nombre_especie = ?, tiempo_crecimiento = ?, riego_recomendado = ? WHERE id_especie = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, nombreEspecie);
                    stmt.setInt(2, Integer.parseInt(tiempoCrecimiento));
                    stmt.setString(3, riegoRecomendado);
                    stmt.setInt(4, Integer.parseInt(idEspecie));
                    stmt.executeUpdate();
                }

            } else if ("mediciones".equals(entidad)) {
                String idMedicion = request.getParameter("id_medicion");
                String idCultivo = request.getParameter("id_cultivo");
                String fechaMedicion = request.getParameter("fecha_medicion");
                String humedad = request.getParameter("humedad");
                String temperatura = request.getParameter("temperatura");

                String sql = "UPDATE datos_mediciones_prueba SET id_cultivo = ?, fecha_medicion = ?, humedad = ?, temperatura = ? WHERE id_medicion = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(idCultivo));
                    stmt.setString(2, fechaMedicion);
                    stmt.setFloat(3, Float.parseFloat(humedad));
                    stmt.setFloat(4, Float.parseFloat(temperatura));
                    stmt.setInt(5, Integer.parseInt(idMedicion));
                    stmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(redirectUrl);
    }
}