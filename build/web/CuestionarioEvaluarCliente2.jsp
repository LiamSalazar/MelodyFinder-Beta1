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
    public int calculatePromedioNumerico(String seguridad, String actitud, String organizacion, String experiencia, String cumplimiento) {
        int promedio = 5;
        if (!seguridad.equals("Seguro")) {
            promedio--;
        }
        if (!actitud.equals("Buena Actitud")) {
            promedio--;
        }
        if (!organizacion.equals("Buena Organizacion")) {
            promedio--;
        }
        if (!experiencia.equals("Contratable")) {
            promedio--;
        }
        if (!cumplimiento.equals("Cumple con lo Acordado")) {
            promedio--;
        }
        return promedio;
    }
%>

<%
    int idGeneralCliente = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        PreparedStatement ps = con.prepareStatement("SELECT MAX(Id_Evaluacion_Cliente) FROM Evaluacion_Cliente");
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            idGeneralCliente = rs.getInt(1) + 1;
        } else {
            idGeneralCliente = 1;
        }
  
        // Inserción en la tabla Evaluacion_Cliente
        PreparedStatement insertEvaluacionCliente = con.prepareStatement("INSERT INTO Evaluacion_Cliente (Id_Evaluacion_Cliente, Id_Eventos, Id_cliente) VALUES (?, ?, ?)");
        insertEvaluacionCliente.setInt(1, idGeneralCliente);
        insertEvaluacionCliente.setInt(2, Integer.parseInt(idEvento));
        insertEvaluacionCliente.setInt(3, Integer.parseInt(idCliente));
        insertEvaluacionCliente.executeUpdate();
        
        // Inserción en la tabla Evaluacion_Seguridad y Evaluacion_Seguridad_1
        PreparedStatement insertEvaluacionSeguridad = con.prepareStatement("INSERT INTO Evaluacion_Seguridad (Id_Evaluacion_Seguridad, Id_Evaluacion_Cliente) VALUES (?, ?)");
        PreparedStatement insertEvaluacionSeguridad1 = con.prepareStatement("INSERT INTO Evaluacion_Seguridad_1 (Id_Evaluacion_Seguridad, Seguridad) VALUES (?, ?)");
        int idEvaluacionSeguridad = idGeneralCliente;
        insertEvaluacionSeguridad.setInt(1, idEvaluacionSeguridad);
        insertEvaluacionSeguridad.setInt(2, idGeneralCliente);
        insertEvaluacionSeguridad.executeUpdate();
        insertEvaluacionSeguridad1.setInt(1, idEvaluacionSeguridad);
        insertEvaluacionSeguridad1.setString(2, pregunta1);
        insertEvaluacionSeguridad1.executeUpdate();

        // Inserción en la tabla Evaluacion_Actitud_Cliente y Evaluacion_Actitud_Cliente_1
        PreparedStatement insertEvaluacionActitudCliente = con.prepareStatement("INSERT INTO Evaluacion_Actitud_Cliente (Id_Evaluacion_Actitud_Cliente, Id_Evaluacion_Cliente) VALUES (?, ?)");
        PreparedStatement insertEvaluacionActitudCliente1 = con.prepareStatement("INSERT INTO Evaluacion_Actitud_Cliente_1 (Id_Evaluacion_Actitud_Cliente, Actitud) VALUES (?, ?)");
        int idEvaluacionActitudCliente = idGeneralCliente;
        insertEvaluacionActitudCliente.setInt(1, idEvaluacionActitudCliente);
        insertEvaluacionActitudCliente.setInt(2, idGeneralCliente);
        insertEvaluacionActitudCliente.executeUpdate();
        insertEvaluacionActitudCliente1.setInt(1, idEvaluacionActitudCliente);
        insertEvaluacionActitudCliente1.setString(2, pregunta2);
        insertEvaluacionActitudCliente1.executeUpdate();

        // Inserción en la tabla Evaluacion_Organizacion y Evaluacion_Organizacion_1
        PreparedStatement insertEvaluacionOrganizacion = con.prepareStatement("INSERT INTO Evaluacion_Organizacion (Id_Evaluacion_Organizacion, Id_Evaluacion_Cliente) VALUES (?, ?)");
        PreparedStatement insertEvaluacionOrganizacion1 = con.prepareStatement("INSERT INTO Evaluacion_Organizacion_1 (Id_Evaluacion_Organizacion, Organización) VALUES (?, ?)");
        int idEvaluacionOrganizacion = idGeneralCliente;
        insertEvaluacionOrganizacion.setInt(1, idEvaluacionOrganizacion);
        insertEvaluacionOrganizacion.setInt(2, idGeneralCliente);
        insertEvaluacionOrganizacion.executeUpdate();
        insertEvaluacionOrganizacion1.setInt(1, idEvaluacionOrganizacion);
        insertEvaluacionOrganizacion1.setString(2, pregunta3);
        insertEvaluacionOrganizacion1.executeUpdate();

        // Inserción en la tabla Evaluacion_Experiencia y Evaluacion_Experiencia_1
        PreparedStatement insertEvaluacionExperiencia = con.prepareStatement("INSERT INTO Evaluacion_Experiencia (Id_Evaluacion_Experiencia, Id_Evaluacion_Cliente) VALUES (?, ?)");
        PreparedStatement insertEvaluacionExperiencia1 = con.prepareStatement("INSERT INTO Evaluacion_Experiencia_1 (Id_Evaluacion_Experiencia, Experiencia) VALUES (?, ?)");
        int idEvaluacionExperiencia = idGeneralCliente;
        insertEvaluacionExperiencia.setInt(1, idEvaluacionExperiencia);
        insertEvaluacionExperiencia.setInt(2, idGeneralCliente);
        insertEvaluacionExperiencia.executeUpdate();
        insertEvaluacionExperiencia1.setInt(1, idEvaluacionExperiencia);
        insertEvaluacionExperiencia1.setString(2, pregunta4);
        insertEvaluacionExperiencia1.executeUpdate();

        // Inserción en la tabla Evaluacion_Cumplimiento y Evaluacion_Cumplimiento_1
        PreparedStatement insertEvaluacionCumplimiento = con.prepareStatement("INSERT INTO Evaluacion_Cumplimiento (Id_Evaluacion_Cumplimiento, Id_Evaluacion_Cliente) VALUES (?, ?)");
        PreparedStatement insertEvaluacionCumplimiento1 = con.prepareStatement("INSERT INTO Evaluacion_Cumplimiento_1 (Id_Evaluacion_Cumplimiento, Cumplimiento) VALUES (?, ?)");
        int idEvaluacionCumplimiento = idGeneralCliente;
        insertEvaluacionCumplimiento.setInt(1, idEvaluacionCumplimiento);
        insertEvaluacionCumplimiento.setInt(2, idGeneralCliente);
        insertEvaluacionCumplimiento.executeUpdate();
        insertEvaluacionCumplimiento1.setInt(1, idEvaluacionCumplimiento);
        insertEvaluacionCumplimiento1.setString(2, pregunta5);
        insertEvaluacionCumplimiento1.executeUpdate();
        
        con.close();
    }catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }
    
    
    
    
    
    

    // Consultar los últimos 5 registros de cada tabla Evaluacion_*_1 para obtener los valores más repetidos
    String seguridad = "";
    String actitud = "";
    String organizacion = "";
    String experiencia = "";
    String cumplimiento = "";
    
     try {
        // Consultar los últimos 5 registros de cada tabla Evaluacion_*_1 para obtener los valores más repetidos
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        // Consultar Evaluacion_Puntualidad_1
        String querySeguridad = "SELECT Seguridad, COUNT(*) AS Count FROM Evaluacion_Seguridad_1 " +
                "INNER JOIN Evaluacion_Seguridad ON Evaluacion_Seguridad_1.Id_Evaluacion_Seguridad = Evaluacion_Seguridad.Id_Evaluacion_Seguridad " +
                "INNER JOIN Evaluacion_Cliente ON Evaluacion_Seguridad.Id_Evaluacion_Cliente = Evaluacion_Cliente.Id_Evaluacion_Cliente " +
                "WHERE Evaluacion_Cliente.Id_cliente = ? " +
                "GROUP BY Seguridad " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtSeguridad = con.prepareStatement(querySeguridad);
        pstmtSeguridad.setString(1, idCliente);
        ResultSet rsSeguridad = pstmtSeguridad.executeQuery();

        if (rsSeguridad.next()) {
            seguridad = rsSeguridad.getString("Seguridad");
        }

        // Consultar Evaluacion_Actitud_Artista_1
        String queryActitud = "SELECT Actitud, COUNT(*) AS Count FROM Evaluacion_Actitud_Cliente_1 " +
                "INNER JOIN Evaluacion_Actitud_Cliente ON Evaluacion_Actitud_Cliente_1.Id_Evaluacion_Actitud_Cliente = Evaluacion_Actitud_Cliente.Id_Evaluacion_Actitud_Cliente " +
                "INNER JOIN Evaluacion_Cliente ON Evaluacion_Actitud_Cliente.Id_Evaluacion_Cliente = Evaluacion_Cliente.Id_Evaluacion_Cliente " +
                "WHERE Evaluacion_Cliente.Id_cliente = ? " +
                "GROUP BY Actitud " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtActitud = con.prepareStatement(queryActitud);
        pstmtActitud.setString(1, idCliente);
        ResultSet rsActitud = pstmtActitud.executeQuery();

        if (rsActitud.next()) {
            actitud = rsActitud.getString("Actitud");
        }

        // Consultar Evaluacion_Expectativas_1
        String queryOrganizacion = "SELECT Organización, COUNT(*) AS Count FROM Evaluacion_Organizacion_1 " +
                "INNER JOIN Evaluacion_Organizacion ON Evaluacion_Organizacion_1.Id_Evaluacion_Organizacion = Evaluacion_Organizacion.Id_Evaluacion_Organizacion " +
                "INNER JOIN Evaluacion_Cliente ON Evaluacion_Organizacion.Id_Evaluacion_Cliente = Evaluacion_Cliente.Id_Evaluacion_Cliente " +
                "WHERE Evaluacion_Cliente.Id_cliente = ? " +
                "GROUP BY Organización " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtOrganizacion = con.prepareStatement(queryOrganizacion);
        pstmtOrganizacion.setString(1, idCliente);
        ResultSet rsOrganizacion = pstmtOrganizacion.executeQuery();

        if (rsOrganizacion.next()) {
            organizacion = rsOrganizacion.getString("Organización");
        }

        // Consultar Evaluacion_Rendimiento_1
        String queryExperiencia = "SELECT Experiencia, COUNT(*) AS Count FROM Evaluacion_Experiencia_1 " +
                "INNER JOIN Evaluacion_Experiencia ON Evaluacion_Experiencia_1.Id_Evaluacion_Experiencia = Evaluacion_Experiencia.Id_Evaluacion_Experiencia " +
                "INNER JOIN Evaluacion_Cliente ON Evaluacion_Experiencia.Id_Evaluacion_Cliente = Evaluacion_Cliente.Id_Evaluacion_Cliente " +
                "WHERE Evaluacion_Cliente.Id_cliente = ? " +
                "GROUP BY Experiencia " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtExperiencia = con.prepareStatement(queryExperiencia);
        pstmtExperiencia.setString(1, idCliente);
        ResultSet rsExperiencia = pstmtExperiencia.executeQuery();

        if (rsExperiencia.next()) {
            experiencia = rsExperiencia.getString("Experiencia");
        }

        // Consultar Evaluacion_Contratable_1
        String queryCumplimiento = "SELECT Cumplimiento, COUNT(*) AS Count FROM Evaluacion_Cumplimiento_1 " +
                "INNER JOIN Evaluacion_Cumplimiento ON Evaluacion_Cumplimiento_1.Id_Evaluacion_Cumplimiento = Evaluacion_Cumplimiento.Id_Evaluacion_Cumplimiento " +
                "INNER JOIN Evaluacion_Cliente ON Evaluacion_Cumplimiento.Id_Evaluacion_Cliente = Evaluacion_Cliente.Id_Evaluacion_Cliente " +
                "WHERE Evaluacion_Cliente.Id_cliente = ? " +
                "GROUP BY Cumplimiento " +
                "ORDER BY Count DESC " +
                "LIMIT 5";
        PreparedStatement pstmtCumplimiento = con.prepareStatement(queryCumplimiento);
        pstmtCumplimiento.setString(1, idCliente);
        ResultSet rsCumplimiento = pstmtCumplimiento.executeQuery();

        if (rsCumplimiento.next()) {
            cumplimiento = rsCumplimiento.getString("Cumplimiento");
        }

        // Actualizar el valor de Promedio_numerico_artista en la tabla Artista
        PreparedStatement ps = con.prepareStatement("UPDATE Cliente SET Promedio_numerico_cliente = ? WHERE Id_cliente = ?");
        int promedioNumerico = calculatePromedioNumerico(seguridad, actitud, organizacion, experiencia, cumplimiento);
        ps.setInt(1, promedioNumerico);
        ps.setInt(2, Integer.parseInt(idCliente));
        ps.executeUpdate();

        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }




    
    // Actualizar los valores en la tabla Artista
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        PreparedStatement ps = con.prepareStatement("UPDATE Cliente SET Seguridad = ?, Actitud = ?, Organización = ?, Experiencia = ?, Cumplimiento = ? WHERE Id_cliente = ?");
        ps.setString(1, seguridad);
        ps.setString(2, actitud);
        ps.setString(3, organizacion);
        ps.setString(4, experiencia);
        ps.setString(5, cumplimiento);
        ps.setInt(6, Integer.parseInt(idCliente));
        ps.executeUpdate();
        
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }

%>



<%@ page import="java.sql.*" %>
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
    String idUsuario = request.getParameter("idArtista");

    String url = "jdbc:mysql://localhost:3306/melodyfinder"; 
    
    String user = "root";
    String pass = "n0m3l0";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        String estadoActual = obtenerEstadoActual(idEvento, conn); // Obtener el estado actual desde la base de datos

        if (estadoActual.equals("Terminó el Cliente")) {
            String sql = "UPDATE Eventos_1 SET Estado = 'Terminado' WHERE Id_Eventos = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(idEvento));
            pstmt.executeUpdate();
        } else {
            String sql = "UPDATE Eventos_1 SET Estado = 'Terminó el Artista' WHERE Id_Eventos = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(idEvento));
            pstmt.executeUpdate();
        }

        response.sendRedirect("ContratacionesArtista.jsp?id_usuario=" + idUsuario);
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
