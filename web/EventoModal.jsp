<%@page import="java.sql.*"%>
<%
    int idEventos = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        PreparedStatement ps = con.prepareStatement("SELECT MAX(Id_Eventos) FROM Eventos");
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            idEventos = rs.getInt(1) + 1;
        } else {
            idEventos = 1;
        }
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }
%>
<%
    int idArtista = Integer.parseInt(request.getParameter("id"));
    int idCliente = Integer.parseInt(request.getParameter("id_cliente"));
    String fecha = request.getParameter("fechaEvento");
    String horaInicio = request.getParameter("horaInicioEvento");
    String horaFin = request.getParameter("horaFinEvento");
    String estado = "Pendiente";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");

        // Insertar datos en la tabla Eventos
        PreparedStatement psEventos = con.prepareStatement("INSERT INTO Eventos (Id_Eventos, Id_cliente, Id_artista) VALUES (?, ?, ?)");
        psEventos.setInt(1, idEventos);
        psEventos.setInt(2, idCliente);
        psEventos.setInt(3, idArtista);
        psEventos.executeUpdate();

        // Insertar datos en la tabla Eventos_1
        PreparedStatement psEventos1 = con.prepareStatement("INSERT INTO Eventos_1 (Id_Eventos, Fecha, Hora_inicio, Hora_final, Estado) VALUES (?, ?, ?, ?, ?)");
        psEventos1.setInt(1, idEventos);
        psEventos1.setString(2, fecha);
        psEventos1.setString(3, horaInicio);
        psEventos1.setString(4, horaFin);
        psEventos1.setString(5, estado);
        psEventos1.executeUpdate();

        response.sendRedirect("Cuenta_ArtistaBD.jsp?id=" + idArtista + "&id_cliente=" + idCliente);


    } catch (ClassNotFoundException | SQLException e) {
        out.println(e);
    }
%>