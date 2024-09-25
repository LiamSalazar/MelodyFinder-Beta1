<%@page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.ArrayList" %>

<%
   String id_usuario = request.getParameter("id");
   
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
   String sql = "SELECT * FROM Artista WHERE Id_artista = ?";
   PreparedStatement stmt = conn.prepareStatement(sql);
   stmt.setString(1, id_usuario);
   ResultSet rs = stmt.executeQuery();
   
   int idArtista = 0;
   String nombreArtista = "";
   String apellidoArtista = "";
   String correoElectronicoArtista = "";
   String passArtista = "";
   String nombreArtistico = "";
   String generoMusical = "";
   String ciudadArtista = "";
   String costoHora = "";
   int numeroIntegrantes = 0;
   String spotify = "";
   String facebook = "";
   String tiktok = "";
   String instagram = "";
   byte[] fotoPerfil = null;
   String puntualidad = "";
   String actitud = "";
   String expectativas = "";
   String rendimiento = "";
   String contratable = "";
   int promedio = 0;
   
   if (rs.next()) {
      idArtista = rs.getInt("Id_artista");
      nombreArtista = rs.getString("Nombre_artista");
      apellidoArtista = rs.getString("Apellido_artista");
      correoElectronicoArtista = rs.getString("Correo_electronico_artista");
      passArtista = rs.getString("Pass_artista");
      nombreArtistico = rs.getString("Nombre_artistico");
      generoMusical = rs.getString("Genero_musical");
      ciudadArtista = rs.getString("Ciudad_artista");
      costoHora = rs.getString("Costo_hora");
      numeroIntegrantes = rs.getInt("Numero_Integrantes");
      spotify = rs.getString("Spotify");
      facebook = rs.getString("Facebook");
      instagram = rs.getString("Instagram");
      tiktok = rs.getString("TikTok");
      fotoPerfil = rs.getBytes("Foto_perfil_artista");
      puntualidad = rs.getString("Puntualidad");
      actitud = rs.getString("Actitud");
      expectativas = rs.getString("Expectativas");
      rendimiento = rs.getString("Rendimiento");
      contratable = rs.getString("Contratable");
      promedio = rs.getInt("Promedio_numerico_artista");
   }
   
   rs.close();
   stmt.close();
   conn.close();
%>



 <html>
    <head>
        <title>Mi Cuenta</title>
        <link rel="stylesheet" href="Styles/Mi_Cuenta_ArtistaBD.css">
        <script src="scripts/Mi_Cuenta_ArtistaBD.js"></script>
        <script src="scripts/Calendario.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
           <script>
            function cambiarClase() {
            var div = document.getElementById("contenedor");
                if (div.classList.contains("active")) {
                 div.classList.remove("active");
                } else {
                 div.classList.add("active");
               }
            }
           
            </script>
        
    </head>
    <body>
                <div class="centro">
                    <div class="centro_superior">
                        <div class="area_imagen">
                            <div class="imagen_perfil" id="imagen_perfil" onclick="expandirImagen()" <% if (fotoPerfil != null) { %>style="background-image: url('data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(fotoPerfil) %>')" <% } %>></div>

                            <dialog id="modalImagen"   class="modalImagen">
                                <div class="imagen_perfil" <% if (fotoPerfil != null) { %>style="background-image: url('data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(fotoPerfil) %>')" <% } %>></div>
                            </dialog>

                            <div class="Editar">
                                <label for="editarHijo">
                                    <img src="Editar.png" alt="Agregar imagen" id="editarHijo" onclick="Modal_Perfil()">
                                </label>
                            </div>
                        </div>
                        
                        <dialog id="modal" class="modal">
                            <form action="uploadImage" method="post" enctype="multipart/form-data">
                                <p class="white-text">La imagen debe ser lo m�s cuadrada posible para evitar deformaciones.</p>
                                
                                <input type="hidden" name="id" value="<%= id_usuario %>" >
                                <input type="file" name="file-upload" id="file-upload" class="file-upload" onchange="posibilitarArchivo()">
                                <div class="btn_m">
                                  <button type="button" class="button1_m" name="cancelar_subida" id="cancelar_subida" >Cancelar</button>
                                  <button type="submit" class="button2_m" name="confirmar_subida" id="confirmar_subida" disabled>Confirmar</button>
                                </div>
                            </form>
                            <script>
                                function posibilitarArchivo() {
                                    var subir = document.getElementById("confirmar_subida");
                                    var archivoInput = document.getElementById("file-upload");
                                    if (archivoInput.files.length > 0) {
                                        subir.disabled = false;
                                    }
                                }
                            </script>
                        </dialog>


                        <div class="area_texto">
                            <div class="titulo">
                              <br><br><br>
                              <div class="banda">
                                <span><%=nombreArtistico%></span>
                              </div>
                              <div class="botones">
                                <div class="primerboton">
				<a href="Chat.jsp" style="text-decoration: none; color: inherit;">
                                    <button class="inbox-btn">
					<svg viewBox="0 0 512 512" height="16" xmlns="http://www.w3.org/2000/svg">
					  <path
					    d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"
					  ></path>
					</svg>
				    </button>
				</a>
                                </div>
                              </div>
                              <div class="promedio">
                                <span class="numero"><%= promedio %>.0</span>
                              </div>
                            </div>
                            <hr />
                            <br>
                            <div class="subtitulo">
                              <span><%=generoMusical%></span>
                              <span class="redes-sociales">Redes Sociales:</span>
                            </div>
                            
                              <div class="info">
                              <span><%=ciudadArtista%></span>
                              <span>$<%=costoHora%></span>
                              <div class="botones-grandes">
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
                              </div>
                            </div>

                            <div class="integrantes">
                              <span>Total de integrantes: <%=numeroIntegrantes%></span>
                            </div>
                            <br><br>
                            
                        </div>
                        <div class="contenedor-cuadros">
                            <%
                                if(actitud == null){
                            %>
                                    <div class="cuadro-puntual">Puntualidad</div>
                                    <div class="cuadro-puntual">Actitud</div>
                                    <div class="cuadro-puntual">Expectativas</div>
                                    <div class="cuadro-puntual">Rendimiento</div>
                                    <div class="cuadro-puntual">Contratable</div>
                            <%
                                } else{
                            %>
                                    <div class="cuadro-puntual"><%= puntualidad %></div>
                                    <div class="cuadro-puntual"><%= actitud %></div>
                                    <div class="cuadro-puntual"><%= expectativas %></div>
                                    <div class="cuadro-puntual"><%= rendimiento %></div>
                                    <div class="cuadro-puntual"><%= contratable %></div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="centro_inferior">
                        <div class="Titulos">
                            <div class="Titulo1">
                                <p id="Parrafo_titulo">Galer�a</p>
                                <label for="agregar_img">
                                    <img src="Simbolo_mas.png" id="abrirmuchos" alt="Agregar imagen" onclick="Modal_Muchos()">
                                </label>
                            </div>

                        <dialog id="modalmuchos" class="modal">
                            <form action="uploadManyImages" method="post" enctype="multipart/form-data">
                                <p class="white-text">Busca que tu imagen sea proporcional a 500 x 300 para evitar deformaciones.</p>
                                
                                <input type="hidden" name="id" value="<%= id_usuario %>" >
                                <input type="file" name="file-upload" id="file-upload" class="file-upload" onchange="posibilitarArchivomuchos()">
                                <div class="btn_m">
                                  <button type="button" class="button1_m" name="cancelar_subida" id="cancelar_subidamuchos">Cancelar</button>
                                  <button type="submit" class="button2_m" name="confirmar_subida" id="confirmar_subida" >Confirmar</button>
                                </div>
                            </form>
                            <script>
                                function posibilitarArchivomuchos() {
                                    var subir = document.getElementById("confirmar_subida");
                                    var archivoInput = document.getElementById("file-upload");
                                    if (archivoInput.files.length > 0) {
                                        subir.disabled = false;
                                    }
                                }
                            </script>
                        </dialog>
                            <br>
                            <div class="Titulo2">
                                <div class="Titulo2">
                                    <p id="Parrafo_titulo2">Disponibilidad</p>
                                    <img src="CalendarImg.png" id="abrirfecha" alt="Calendar" class="calendar-icon" onclick="openModal()">
                                </div>
                                
                                <dialog id="modalfecha" class="modal">
                                    <form action="SubirFecha.jsp" method="post">
                                        <p class="white-text">Ingrese las fechas que tenga ocupadas.</p>

                                        <input type="hidden" name="id" value="<%= id_usuario %>" >
                                        <input type="date" name="ocupados" id="ocupados" class="ocupadosd" onchange="posibilitarFecha()">
                                        <div class="btn_m">
                                          <button type="button" class="button1_m" name="cancelar_subida" id="cancelar_subidafecha" >Cancelar</button>
                                          <button type="submit" class="button2_m" name="confirmar_subida" id="confirmar_subidafecha" disabled>Confirmar</button>
                                        </div>
                                    </form>
                                    <script>
                                        function posibilitarFecha() {
                                            var subir = document.getElementById("confirmar_subidafecha");
                                            var fechaInput = document.getElementById("ocupados");
                                            if (fechaInput.value.trim() !== '') {
                                                subir.disabled = false;
                                            }
                                        }
                                    </script>
                                </dialog>
                            </div>
                        </div>
                        
                        <div class="Imagenes_izquierdo">
                            <%
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
                                String sqls = "SELECT * FROM Fotos_Artista INNER JOIN Fotos_Muestra ON Fotos_Artista.Id_Fotos_Artista = Fotos_Muestra.Id_Fotos_Artista WHERE Fotos_Artista.Id_artista = ?";
                                PreparedStatement st = con.prepareStatement(sqls);
                                st.setString(1, id_usuario);
                                ResultSet rss = st.executeQuery();

                                ArrayList<Integer> idFotosArtistaList = new ArrayList<>();
                                String imagenes = "";
                                int contador = 0;
                                while (rss.next()) {
                                    int idFotosArtista = rss.getInt("Id_Fotos_Artista");
                                    idFotosArtistaList.add(idFotosArtista);

                                    byte[] imagenBytes = rss.getBytes("Fotos_muestra");
                                    String imagenBase64 = Base64.getEncoder().encodeToString(imagenBytes);
                                    String imagenHtml = "";
                                    if (imagenBase64 != null && !imagenBase64.isEmpty()) {
                                        imagenHtml = "<div id=\"imagen_" + contador + "\" class=\"Contenedor_Individual_Imagen imagen\" style=\"background-image: url('data:image/jpeg;base64," + imagenBase64 + "')\" >" +
                                            "<a href=\"eliminar_imagen.jsp?idFotosArtista=" + idFotosArtista + "\">" +
                                            "<img id=\"abrirmod\" class=\"Tache_Imagen\" src=\"Tache.png\" alt=\"Tache\"></a></div>";
                                    }


                                    if (contador % 2 == 0) {
                                        imagenes += "<div class=\"fila\">" + imagenHtml;
                                    } else {
                                        imagenes += imagenHtml + "</div>";
                                    }
                                    contador++;
                                }
                                if (contador % 2 == 1) {
                                    imagenes += "</div>";
                                }

                                rss.close();
                                st.close();
                                con.close();
                            %>
                            <%= imagenes %>
                        </div>
                        
                        <div class="Calendario_derecho">
                            <% String url = "Calendario.jsp?id_usuario=" + id_usuario; %>
                            <iframe id="Example2"
                                name="Example2"
                                title="Example2"
                                width="400"
                                height="500"
                                frameborder="0"
                                scrolling="no"
                                marginheight="0"
                                marginwidth="0"
                                src="<%= url %>">
                            </iframe>
                        </div>
                    </div>
                </div>
          
            <script src="https://kit.fontawesome.com/26ab79e4eb.js" crossorigin="anonymous"></script>

    </body>
</html>
