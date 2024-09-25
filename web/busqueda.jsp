
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.ArrayList" %>
<%
// Establecer conexión con la base de datos
   String url = "jdbc:mysql://localhost:3306/melodyfinder";
   String user = "root";
   String password = "n0m3l0";
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   
  String id_cliente = request.getParameter("id");
    
 String variable = request.getParameter("nombreVariable");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Styles/busqueda.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String frase = "";
         int id_exepcion = 0;
                    
             
String searchTerm = request.getParameter("termino_busqueda"); // Obtén el término de búsqueda del parámetro de la solicitud
try {
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection(url, user, password);
   stmt = conn.createStatement();

   // Realizar la consulta
   String query = "SELECT * FROM Artista WHERE Nombre_artistico LIKE '%"+ variable +"%'";
   rs = stmt.executeQuery(query);

   if(rs.next()) {
       int id = rs.getInt("id_artista");
       String nombreArtistico = rs.getString("nombre_artistico");
       String generoMusical = rs.getString("genero_musical");
       String promedioNumerico = rs.getString("promedio_numerico_artista");
       byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
       String spotify = rs.getString("Spotify");
       int Promedio_numerico_artista = rs.getInt("Promedio_numerico_artista");
        String facebook = rs.getString("Facebook");
      String instagram = rs.getString("Instagram");
       String tiktok = rs.getString("TikTok");
       String palabraEliminar = "https://open.spotify.com/artist/";
       String resultado = spotify.replaceAll("\\b" + palabraEliminar + "\\b", "");
       frase = generoMusical;
       id_exepcion = id;
        %>
        <div class="contenedor">

            <div class="artista_buscado">
                <div class="perfil_artista">
                    <%
                       String imagenSrc = "";
                       if (fotoPerfil != null) {
                           imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                       }
                    %>
                    <div class="img_perfil"><img src="<%= imagenSrc %>"></div>
                    <div  class="seccion_derecha">
                        <div class="texto">
                            <h1 ><center></center><%=nombreArtistico%><span><center><%= generoMusical %></center></span> </h1>
                        </div>
                        <div class="redes_sociales">
                            <div class="instagram_cont">
                                <a href="<%=instagram%>" target="_blank">
                                    <label for="ig">
                                        <input type="button" id="ig" style="display: none;" data-redsocial="Instagram">
                                        <div class="icon_rs instagram">
                                            <span class="tooltip">Instagram</span>
                                            <i class="fa-brands fa-instagram fa-xl" ></i></div>
                                    </label>
                                </a>
                            </div>
                            <div class="tiktok_cont">
                                <a href="<%=tiktok%>" target="_blank">
                                    <label for="tk">
                                        <input type="button" id="tk" style="display: none;" data-redsocial="TikTok">
                                        <div class="icon_rs tiktok">
                                            <span class="tooltip">Tiktok</span>
                                            <i class="fa-brands fa-tiktok fa-xl" ></i></div>
                                    </label>
                                </a>
                            </div>
                            <div class="facebook_cont">
                                <a href="<%=facebook%>" target="_blank">
                                    <label for="fb">
                                        <input type="button" id="fb" style="display: none;" data-redsocial="Facebook">
                                        <div class="icon_rs facebook">
                                            <span class="tooltip">Facebook</span>
                                            <i class="fa-brands fa-facebook fa-xl"></i></div>
                                    </label>
                                </a>
                            </div>
                            <div class="spotify_cont">
                                <a href="<%=spotify%>" target="_blank">
                                    <label for="sp">
                                        <input type="button" id="sp" style="display: none;" data-redsocial="Spotify">
                                        <div class="icon_rs spotify">
                                            <span class="tooltip">Spotify</span>
                                            <i class="fa-brands fa-spotify fa-xl" ></i></div>
                                    </label>
                                </a>
                            </div>

                        </div>
                        <div class ="boton_perfil">
                            <button class="boton_contratar" onclick="irACuentaArtista('<%= id %>', '<%= id_cliente %>')">Contratar</button>
                        </div>
                        <script>
                            function irACuentaArtista(id, id_cliente) {
                                window.location.href = "Cuenta_ArtistaBD.jsp?id=" + encodeURIComponent(id) + "&id_cliente=" + encodeURIComponent(id_cliente);
                            }
                        </script>            
                    </div>
                    <div class="rating_perfil">
                        <i class="fas fa-star fa-2xl" id="star_1"></i>
                        <i class="fas fa-star fa-2xl" id="star_2"></i>
                        <i class="fas fa-star fa-2xl" id="star_3"></i>
                        <i class="fas fa-star fa-2xl" id="star_4"></i>
                        <i class="fas fa-star fa-2xl" id="star_5"></i>
                        <script>
                            valor_estrella = <%= Promedio_numerico_artista %>;
                            star_1 = document.getElementById("star_1");
                            star_2 = document.getElementById("star_2");
                            star_3 = document.getElementById("star_3");
                            star_4 = document.getElementById("star_4");
                            star_5 = document.getElementById("star_5");

                            function onPageLoad() {
                                if (valor_estrella <= 4) {
                                    star_5.classList.remove("fas");
                                    star_5.classList.add("far");
                                }
                                if (valor_estrella <= 3) {
                                    star_4.classList.remove("fas");
                                    star_4.classList.add("far");
                                }
                                if (valor_estrella <= 2) {
                                    star_3.classList.remove("fas");
                                    star_3.classList.add("far");
                                }
                                if (valor_estrella <= 1) {
                                    star_2.classList.remove("fas");
                                    star_2.classList.add("far");
                                }
                                if (valor_estrella === 0) {
                                    star_1.classList.remove("fas");
                                    star_1.classList.add("far");
                                }
                            }

                            // Asignar la función onPageLoad al evento onload de la ventana
                            window.onload = onPageLoad;
                        </script> 


                    </div>


                </div>
                <div class="spotify_artista">
                    <iframe style="border-radius:12px" src="https://open.spotify.com/embed/artist/<%= resultado %>?utm_source=generator&theme=0"
                            width="100%" height="100%" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
                </div>
            </div>
            <% 
           }
       } catch (ClassNotFoundException e) {    
          e.printStackTrace();
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          // Cerrar la conexión y liberar recursos
          if (rs != null) {
             try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
          }
          if (stmt != null) {
             try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
          }
          if (conn != null) {
             try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
          }
       }

         
            
            %>
            
            <h1  class="titulo2">Artistas Relacionados</h1>

            <div class ="artista_relacionado" >
                <section>
                    <div class="block-card">
                        <!-- card ------- -->



                        <%
                            // Establecer conexión con la base de datos
                           
                          try {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection(url, user, password);
                            stmt = conn.createStatement();
                            int contador_responsivo = 1;
                            // Realizar la consulta
                            String query = "SELECT id_artista, nombre_artistico, genero_musical, promedio_numerico_artista, foto_perfil_artista " +
                                           "FROM artista " +
                                           "WHERE genero_musical = '"+frase +"' AND Id_artista <> '"+ id_exepcion+
                                           "' ORDER BY id_artista DESC " +
                                           "LIMIT 7";
                            rs = stmt.executeQuery(query);

                            // Mostrar los resultados en los divs
                            while (rs.next()) {
                               int id = rs.getInt("id_artista");
                               
                                String nombreArtistico = rs.getString("nombre_artistico");
                                String generoMusical = rs.getString("genero_musical");
                                String promedioNumerico = rs.getString("promedio_numerico_artista");
                                byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                        %>
                        <div class=" card delet_<%= contador_responsivo%>">
                            <div class="card-content">
                                <div class="image">
                                    <%
                                       contador_responsivo = contador_responsivo +1;
                                       String imagenSrc = "";
                                       if (fotoPerfil != null) {
                                           imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                       }
                                    %>
                                    <img src="<%= imagenSrc %>" alt="">
                                </div>

                                <div class="name-profession">
                                    <center><span class="name"><%= nombreArtistico%></span></center>
                                                <% if(promedioNumerico == null){
                                                %>
                                                    <span class="profession">Cuenta Nueva</span>
                                                <%} else { %>
                                                <span class="profession"><%= promedioNumerico%></span>
                                                <%}%>
                                </div>


                                <div class="button">
                                    <button class="aboutMe" onclick="irACuentaArtista('<%= id %>', '<%= id_cliente %>')">Contratar</button>
                                </div>
                                <script>
                            function irACuentaArtista(id, id_cliente) {
                                window.location.href = "Cuenta_ArtistaBD.jsp?id=" + encodeURIComponent(id) + "&id_cliente=" + encodeURIComponent(id_cliente);
                            }
                        </script>  
                            </div>
                        </div>
                        <!-- card ------- end-->
                        <% 
                 }
              }catch (ClassNotFoundException e) {    
                e.printStackTrace();
             } catch (SQLException e) {
                e.printStackTrace();
             } finally {
                // Cerrar la conexión y liberar recursos
                if (rs != null) {
                   try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (stmt != null) {
                   try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
                if (conn != null) {
                   try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
             }
                        %>
                    </div>
                </section>
            </div>
        </div>

        <script src="https://kit.fontawesome.com/26ab79e4eb.js" crossorigin="anonymous"></script>

    </body>
</html>
