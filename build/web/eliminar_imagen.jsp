<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.Base64" %>

<%
    
    String imagenId = request.getParameter("idFotosArtista");
    // Obtener el id del artista asociado a la imagen eliminada
    String idArtista = "";
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
    String sql3 = "SELECT Id_artista FROM Fotos_Artista WHERE Id_Fotos_Artista = ?";
    PreparedStatement stmt3 = con2.prepareStatement(sql3);
    stmt3.setString(1, imagenId);
    ResultSet rs = stmt3.executeQuery();
    if (rs.next()) {
        idArtista = rs.getString("Id_artista");
    }
    stmt3.close();
    con2.close();
    

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
    String sql = "DELETE FROM Fotos_Muestra WHERE Id_Fotos_Artista = ?";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, imagenId);
    stmt.executeUpdate();
    
    String sql2 = "DELETE FROM Fotos_Artista WHERE Id_Fotos_Artista = ?";
    PreparedStatement stmt2 = con.prepareStatement(sql2);
    stmt2.setString(1, imagenId);
    stmt2.executeUpdate();

    stmt.close();
    con.close();
    
    // Redireccionar a Mi_Cuenta_ArtistaBD.jsp con el id del artista como parámetro
    String redirectUrl = "Mi_Cuenta_ArtistaBD.jsp?id=" + idArtista;
    response.sendRedirect(redirectUrl);
%>
