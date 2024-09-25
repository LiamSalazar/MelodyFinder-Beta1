<%@page import="java.sql.*, java.io.*"%>
<%
    String nombreArtistico = request.getParameter("nombre_artistico");
    String generoMusical = request.getParameter("generos");
    String ciudadArtista = request.getParameter("ciudad_artista");
    int costoPromedioHora = Integer.parseInt(request.getParameter("costo_promedio_hora"));
    int totalIntegrantes = Integer.parseInt(request.getParameter("integrantes"));
    int idArtista = Integer.parseInt(request.getParameter("id"));
    
    String nombre = request.getParameter("nombred");
    String apellido = request.getParameter("apellidod");
    String correo = request.getParameter("correod");
    String password = request.getParameter("passwordd");
    String sp = request.getParameter("spotify");
    String fb = request.getParameter("facebook");
    String tk = request.getParameter("tiktok");
    String ig = request.getParameter("instagram");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        PreparedStatement ps = con.prepareStatement("INSERT INTO Artista(Id_artista, Nombre_artista, Apellido_artista, Correo_electronico_artista, Pass_artista) VALUES(?,?,?,?,?)");
        ps.setInt(1, idArtista);
        ps.setString(2, nombre);
        ps.setString(3, apellido);
        ps.setString(4, correo);
        ps.setString(5, password);
        ps.executeUpdate();
    }catch(Exception e){
        out.println(e);
    }
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
        PreparedStatement ps = con.prepareStatement("UPDATE Artista SET Nombre_artistico=?, Genero_musical=?, Ciudad_artista=?, Costo_hora=?, Numero_Integrantes=?, Instagram=?, Facebook=?, TikTok=?, Spotify=? WHERE Id_artista=?");
        ps.setString(1, nombreArtistico);
        ps.setString(2, generoMusical);
        ps.setString(3, ciudadArtista);
        ps.setInt(4, costoPromedioHora);
        ps.setInt(5, totalIntegrantes);
        ps.setString(6, ig);
        ps.setString(7, fb);
        ps.setString(8, tk);
        ps.setString(9, sp);
        ps.setInt(10, idArtista);
        ps.executeUpdate();
        response.sendRedirect("Sesion.jsp");
    }catch(Exception e){
        out.println(e);
    }
%>