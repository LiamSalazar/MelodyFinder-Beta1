package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    // Configuración de la base de datos
    static String url = "jdbc:mysql://localhost:3306/melodyfinder";
    static String usuario = "root";
    static String password = "n0m3l0";
    
    // Método para obtener la conexión a la base de datos
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexión establecida con la base de datos");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar con la base de datos: " + e.getMessage());
        }
        return con;
    }
}
