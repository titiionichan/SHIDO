package com.app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    // URL con parámetros para evitar errores de SSL y zona horaria en MySQL
    private static final String URL = "jdbc:mysql://localhost:3306/shido_borrador?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USUARIO = "root";
    private static final String CLAVE = ""; // Si tu phpMyAdmin/XAMPP tiene contraseña, colócala aquí

    public static Connection obtenerConexion() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USUARIO, CLAVE);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver JDBC de MySQL no encontrado. Verifica que el JAR esté en WEB-INF/lib", e);
        }
    }
}