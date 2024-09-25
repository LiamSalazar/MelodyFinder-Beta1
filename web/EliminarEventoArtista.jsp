<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
String Id_eventos = request.getParameter("idEvento");
String Id_usuario = request.getParameter("idUsuario");

try {
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String user = "root";
    String password = "n0m3l0";
    Connection conn = DriverManager.getConnection(url, user, password);
    Statement stmt = conn.createStatement();

    String deleteQuery = "DELETE FROM Eventos WHERE Id_Eventos = " + Id_eventos;
    stmt.executeUpdate(deleteQuery);
    
    response.sendRedirect("ContratacionesArtista.jsp?id_usuario=" + Id_usuario);

} catch (Exception e) {
    e.printStackTrace();
}
%>
