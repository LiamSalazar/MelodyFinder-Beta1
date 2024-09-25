<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.text.*" %>

<%
    String id_usuario = request.getParameter("id");
    String fechaOcupada = request.getParameter("ocupados");
    int id_dias = 0;
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    if (fechaOcupada != null){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");

            // Obtener el último ID de días para utilizarlo como referencia
            PreparedStatement ps = con.prepareStatement("SELECT MAX(Id_Dias) FROM Dias");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id_dias = rs.getInt(1) + 1;
            } else {
                id_dias = 1;
            }

            // Insertar el registro en la tabla Dias
            pstmt = con.prepareStatement("INSERT INTO Dias (Id_Dias, Id_artista) VALUES (?, ?)");
            pstmt.setInt(1, id_dias);
            pstmt.setString(2, id_usuario);
            pstmt.executeUpdate();

            // Insertar la fecha ocupada en la tabla Dias_Ocupados
            pstmt = con.prepareStatement("INSERT INTO Dias_Ocupados (Id_Dias, Dias_Ocupados) VALUES (?, ?)");
            pstmt.setInt(1, id_dias);
            pstmt.setString(2, fechaOcupada);
            pstmt.executeUpdate();

            // Cerrar la conexión y redirigir a una página de éxito o realizar otras acciones necesarias
            con.close();
            response.sendRedirect("Mi_Cuenta_ArtistaBD.jsp?id=" + id_usuario);

        } catch (Exception e) {
            out.println(e);
        }
    }
    else {
        response.sendRedirect("Mi_Cuenta_ArtistaBD.jsp?id=" + id_usuario);
    }
%>
