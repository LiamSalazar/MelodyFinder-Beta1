<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
    String idEvento = request.getParameter("idEvento");
    String idUsuario = request.getParameter("idUsuario");

    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String user = "root";
    String pass = "n0m3l0";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        String sql = "UPDATE Eventos_1 SET Estado = 'Activo' WHERE Id_Eventos = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(idEvento));
        pstmt.executeUpdate();

        response.sendRedirect("ContratacionesArtista.jsp?id_usuario=" + idUsuario);
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<html>
    <head>
        <title>MelodyFinder</title>
    <body>
        <input type="hidden" value="<%= idEvento %>">
        <input type="hidden" value="<%= idUsuario %>">
    </body>
</html>
