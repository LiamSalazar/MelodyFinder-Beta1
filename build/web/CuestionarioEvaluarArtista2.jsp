<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    String idEvento = request.getParameter("idEvento");
    String idCliente = request.getParameter("idCliente");
    String idArtista = request.getParameter("idArtista");
    String pregunta1 = request.getParameter("pregunta1");
    String pregunta2 = request.getParameter("pregunta2");
    String pregunta3 = request.getParameter("pregunta3");
    String pregunta4 = request.getParameter("pregunta4");
    String pregunta5 = request.getParameter("pregunta5");
%>

<%!

    // Método para calcular el promedio numérico
    public int calculatePromedioNumerico(String puntualidad, String actitud, String expectativas, String rendimiento, String contratable) {
        int promedio = 5;
        if (!puntualidad.equals("Puntual")) {
            promedio--;
        }
        if (!actitud.equals("Buena Actitud")) {
            promedio--;
        }
        if (!expectativas.equals("Cumple Expectativas")) {
            promedio--;
        }
        if (!rendimiento.equals("Buen Rendimiento")) {
            promedio--;
        }
        if (!contratable.equals("Contratable")) {
            promedio--;
        }
        return promedio;
    }
%>

<%
    int idGeneralArtista = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        PreparedStatement ps = con.prepareStatement("SELECT MAX(Id_Evaluacion_Artista) FROM Evaluacion_Artista");
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            idGeneralArtista = rs.getInt(1) + 1;
        } else {
            idGeneralArtista = 1;
        }
        
        // Insertar en la tabla Evaluacion_Artista
        ps = con.prepareStatement("INSERT INTO Evaluacion_Artista (Id_Evaluacion_Artista, Id_Eventos, Id_artista) VALUES (?, ?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setInt(2, Integer.parseInt(idEvento));
        ps.setInt(3, Integer.parseInt(idArtista));
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Puntualidad
        ps = con.prepareStatement("INSERT INTO Evaluacion_Puntualidad (Id_Evaluacion_Puntualidad, Id_Evaluacion_Artista) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setInt(2, idGeneralArtista);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Puntualidad_1
        ps = con.prepareStatement("INSERT INTO Evaluacion_Puntualidad_1 (Id_Evaluacion_Puntualidad, Puntualidad) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setString(2, pregunta1);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Actitud_Artista
        ps = con.prepareStatement("INSERT INTO Evaluacion_Actitud_Artista (Id_Evaluacion_Actitud_Artista, Id_Evaluacion_Artista) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setInt(2, idGeneralArtista);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Actitud_Artista_1
        ps = con.prepareStatement("INSERT INTO Evaluacion_Actitud_Artista_1 (Id_Evaluacion_Actitud_Artista, Actitud) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setString(2, pregunta2);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Expectativas
        ps = con.prepareStatement("INSERT INTO Evaluacion_Expectativas (Id_Evaluacion_Expectativas, Id_Evaluacion_Artista) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setInt(2, idGeneralArtista);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Expectativas_1
        ps = con.prepareStatement("INSERT INTO Evaluacion_Expectativas_1 (Id_Evaluacion_Expectativas, Expectativas) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setString(2, pregunta3);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Rendimiento
        ps = con.prepareStatement("INSERT INTO Evaluacion_Rendimiento (Id_Evaluacion_Rendimiento, Id_Evaluacion_Artista) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setInt(2, idGeneralArtista);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Rendimiento_1
        ps = con.prepareStatement("INSERT INTO Evaluacion_Rendimiento_1 (Id_Evaluacion_Rendimiento, Rendimiento) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setString(2, pregunta4);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Contratable
        ps = con.prepareStatement("INSERT INTO Evaluacion_Contratable (Id_Evaluacion_Contratable, Id_Evaluacion_Artista) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setInt(2, idGeneralArtista);
        ps.executeUpdate();
        
        // Insertar en la tabla Evaluacion_Contratable_1
        ps = con.prepareStatement("INSERT INTO Evaluacion_Contratable_1 (Id_Evaluacion_Contratable, Contratable) VALUES (?, ?)");
        ps.setInt(1, idGeneralArtista);
        ps.setString(2, pregunta5);
        ps.executeUpdate();
        
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }
    
    // Consultar los últimos 5 registros de cada tabla Evaluacion_*_1 para obtener los valores más repetidos
    String puntualidad = "";
    String actitud = "";
    String expectativas = "";
    String rendimiento = "";
    String contratable = "";

    try {
        // Consultar los últimos 5 registros de cada tabla Evaluacion_*_1 para obtener los valores más repetidos
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        // Consultar Evaluacion_Puntualidad_1
        String queryPuntualidad = "SELECT Puntualidad, COUNT(*) AS Count FROM Evaluacion_Puntualidad_1 " +
                "INNER JOIN Evaluacion_Puntualidad ON Evaluacion_Puntualidad_1.Id_Evaluacion_Puntualidad = Evaluacion_Puntualidad.Id_Evaluacion_Puntualidad " +
                "INNER JOIN Evaluacion_Artista ON Evaluacion_Puntualidad.Id_Evaluacion_Artista = Evaluacion_Artista.Id_Evaluacion_Artista " +
                "WHERE Evaluacion_Artista.Id_artista = ? " +
                "GROUP BY Puntualidad " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtPuntualidad = con.prepareStatement(queryPuntualidad);
        pstmtPuntualidad.setString(1, idArtista);
        ResultSet rsPuntualidad = pstmtPuntualidad.executeQuery();

        if (rsPuntualidad.next()) {
            puntualidad = rsPuntualidad.getString("Puntualidad");
        }

        // Consultar Evaluacion_Actitud_Artista_1
        String queryActitud = "SELECT Actitud, COUNT(*) AS Count FROM Evaluacion_Actitud_Artista_1 " +
                "INNER JOIN Evaluacion_Actitud_Artista ON Evaluacion_Actitud_Artista_1.Id_Evaluacion_Actitud_Artista = Evaluacion_Actitud_Artista.Id_Evaluacion_Actitud_Artista " +
                "INNER JOIN Evaluacion_Artista ON Evaluacion_Actitud_Artista.Id_Evaluacion_Artista = Evaluacion_Artista.Id_Evaluacion_Artista " +
                "WHERE Evaluacion_Artista.Id_artista = ? " +
                "GROUP BY Actitud " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtActitud = con.prepareStatement(queryActitud);
        pstmtActitud.setString(1, idArtista);
        ResultSet rsActitud = pstmtActitud.executeQuery();

        if (rsActitud.next()) {
            actitud = rsActitud.getString("Actitud");
        }

        // Consultar Evaluacion_Expectativas_1
        String queryExpectativas = "SELECT Expectativas, COUNT(*) AS Count FROM Evaluacion_Expectativas_1 " +
                "INNER JOIN Evaluacion_Expectativas ON Evaluacion_Expectativas_1.Id_Evaluacion_Expectativas = Evaluacion_Expectativas.Id_Evaluacion_Expectativas " +
                "INNER JOIN Evaluacion_Artista ON Evaluacion_Expectativas.Id_Evaluacion_Artista = Evaluacion_Artista.Id_Evaluacion_Artista " +
                "WHERE Evaluacion_Artista.Id_artista = ? " +
                "GROUP BY Expectativas " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtExpectativas = con.prepareStatement(queryExpectativas);
        pstmtExpectativas.setString(1, idArtista);
        ResultSet rsExpectativas = pstmtExpectativas.executeQuery();

        if (rsExpectativas.next()) {
            expectativas = rsExpectativas.getString("Expectativas");
        }

        // Consultar Evaluacion_Rendimiento_1
        String queryRendimiento = "SELECT Rendimiento, COUNT(*) AS Count FROM Evaluacion_Rendimiento_1 " +
                "INNER JOIN Evaluacion_Rendimiento ON Evaluacion_Rendimiento_1.Id_Evaluacion_Rendimiento = Evaluacion_Rendimiento.Id_Evaluacion_Rendimiento " +
                "INNER JOIN Evaluacion_Artista ON Evaluacion_Rendimiento.Id_Evaluacion_Artista = Evaluacion_Artista.Id_Evaluacion_Artista " +
                "WHERE Evaluacion_Artista.Id_artista = ? " +
                "GROUP BY Rendimiento " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtRendimiento = con.prepareStatement(queryRendimiento);
        pstmtRendimiento.setString(1, idArtista);
        ResultSet rsRendimiento = pstmtRendimiento.executeQuery();

        if (rsRendimiento.next()) {
            rendimiento = rsRendimiento.getString("Rendimiento");
        }

        // Consultar Evaluacion_Contratable_1
        String queryContratable = "SELECT Contratable, COUNT(*) AS Count FROM Evaluacion_Contratable_1 " +
                "INNER JOIN Evaluacion_Contratable ON Evaluacion_Contratable_1.Id_Evaluacion_Contratable = Evaluacion_Contratable.Id_Evaluacion_Contratable " +
                "INNER JOIN Evaluacion_Artista ON Evaluacion_Contratable.Id_Evaluacion_Artista = Evaluacion_Artista.Id_Evaluacion_Artista " +
                "WHERE Evaluacion_Artista.Id_artista = ? " +
                "GROUP BY Contratable " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtContratable = con.prepareStatement(queryContratable);
        pstmtContratable.setString(1, idArtista);
        ResultSet rsContratable = pstmtContratable.executeQuery();

        if (rsContratable.next()) {
            contratable = rsContratable.getString("Contratable");
        }
    
    
        // Actualizar el valor de Promedio_numerico_artista en la tabla Artista
        PreparedStatement ps = con.prepareStatement("UPDATE Artista SET Promedio_numerico_artista = ? WHERE Id_artista = ?");
        int promedioNumerico = calculatePromedioNumerico(puntualidad, actitud, expectativas, rendimiento, contratable);
        ps.setInt(1, promedioNumerico);
        ps.setInt(2, Integer.parseInt(idArtista));
        ps.executeUpdate();
        
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }

    // Actualizar los valores en la tabla Artista
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        PreparedStatement ps = con.prepareStatement("UPDATE Artista SET Puntualidad = ?, Actitud = ?, Expectativas = ?, Rendimiento = ?, Contratable = ? WHERE Id_artista = ?");
        ps.setString(1, puntualidad);
        ps.setString(2, actitud);
        ps.setString(3, expectativas);
        ps.setString(4, rendimiento);
        ps.setString(5, contratable);
        ps.setInt(6, Integer.parseInt(idArtista));
        ps.executeUpdate();
        
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }
%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%!
    public String obtenerEstadoActual(String idEvento, Connection conn) {
        String estadoActual = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT Estado FROM Eventos_1 WHERE Id_Eventos = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(idEvento));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                estadoActual = rs.getString("Estado");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return estadoActual;
    }   
%>
<%
    String idUsuario = request.getParameter("idCliente");

    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String user = "root";
    String pass = "n0m3l0";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        String estadoActual = obtenerEstadoActual(idEvento, conn); // Obtener el estado actual desde la base de datos

        if (estadoActual.equals("Terminó el Artista")) {
            String sql = "UPDATE Eventos_1 SET Estado = 'Terminado' WHERE Id_Eventos = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(idEvento));
            pstmt.executeUpdate();
        } else {
            String sql = "UPDATE Eventos_1 SET Estado = 'Terminó el Cliente' WHERE Id_Eventos = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(idEvento));
            pstmt.executeUpdate();
        }

        response.sendRedirect("ContratacionesCliente.jsp?id=" + idUsuario);
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
