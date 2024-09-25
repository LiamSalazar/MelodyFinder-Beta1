<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%
    String variable = request.getParameter("nombreVariable");
     String id_cliente = request.getParameter("id");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Favoritos</title>
        <link rel="stylesheet" href="Styles/genero_busqueda.css">

    </head>
    <body>


        <div class="contendor">
            <h1 style="color: white;">Tus Artistas Favoritos</h1>
            <div class="grid_card">
                <%
                    // Establecer conexión con la base de datos
                    String url = "jdbc:mysql://localhost: 3306/melodyfinder";
                    String user = "root";
                    String password = "n0m3l0";
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    int contador_rock = 0;

                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(url, user, password);
                        stmt = conn.createStatement();

                        // Realizar la consulta
                        String query = "SELECT * FROM Artista INNER JOIN Enlista ON Artista.Id_artista = Enlista.Id_artista WHERE Enlista.Id_cliente = "+id_cliente+";";
                        rs = stmt.executeQuery(query);

                        // Mostrar los resultados en los divs
                        while (rs.next()) {
                            int id = rs.getInt("id_artista");
                            String nombreArtistico = rs.getString("nombre_artistico");
                            String generoMusical = rs.getString("genero_musical");
                            String promedioNumerico = rs.getString("promedio_numerico_artista");
                            byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                %>
                <div class="cuadrito" onclick="irACuentaArtista('<%= id %>', '<%= id_cliente %>')">
                    <div class="card-content">
                        <div class="centra_img">
                        <div class="image">
                              <%
                                                    String imagenSrc = "";
                                                    if (fotoPerfil != null) {
                                                        imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                                    }
                                                %>
                            <img src="<%= imagenSrc %>" alt=""> 
                        </div>
                        </div>

                        <div class="name-profession">
                            <span class="name"><center><%= nombreArtistico%></center></span>
                        </div>

                    </div>
                </div>
                         <script>
                            function irACuentaArtista(id, id_cliente) {
                                window.location.href = "Cuenta_ArtistaBD.jsp?id=" + encodeURIComponent(id) + "&id_cliente=" + encodeURIComponent(id_cliente);
                            }
                        </script>  
                 <%
                                            }
                                        } catch (ClassNotFoundException e) {
                                            e.printStackTrace();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        } finally {
                                            // Cerrar la conexión y liberar recursos
                                            if (rs != null) {
                                                try {
                                                    rs.close();
                                                } catch (SQLException e) {
                                                    e.printStackTrace();
                                                }
                                            }
                                            if (stmt != null) {
                                                try {
                                                    stmt.close();
                                                } catch (SQLException e) {
                                                    e.printStackTrace();
                                                }
                                            }
                                            if (conn != null) {
                                                try {
                                                    conn.close();
                                                } catch (SQLException e) {
                                                    e.printStackTrace();
                                                }
                                            }
                                        }
                                    %>



            </div>

        </div>
    </body>
</html>
