<%@page import="java.sql.*"%>
<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String correo = request.getParameter("email");
    String password = request.getParameter("password");
%>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/melodyfinder";
String usuario = "root";
String contraseña = "n0m3l0";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    // Cargar el driver de la base de datos
    Class.forName(driver);
    
    // Establecer la conexión
    conn = DriverManager.getConnection(url, usuario, contraseña);

    // Verificar si el correo electrónico existe en la tabla "Artista"
    String queryArtista = "SELECT * FROM Artista WHERE Correo_electronico_artista = ?";
    stmt = conn.prepareStatement(queryArtista);
    stmt.setString(1, correo);
    rs = stmt.executeQuery();

    if (rs.next()) {
        // El correo electrónico ya existe en la tabla "Artista"
        response.sendRedirect("Crear_Cuenta.jsp");
        out.println("<script>alert('Correo en uso, intente con otro.');</script>");
    } else {
        // Verificar si el correo electrónico existe en la tabla "Cliente"
        String queryCliente = "SELECT * FROM Cliente WHERE Correo_electronico_cliente = ?";
        stmt = conn.prepareStatement(queryCliente);
        stmt.setString(1, correo);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // El correo electrónico ya existe en la tabla "Cliente"
            response.sendRedirect("Crear_Cuenta.jsp");
            out.println("<script>alert('Correo en uso, intente con otro.');</script>");
        } else {
            // El correo electrónico no se encuentra en ninguna de las tablas
            //Generar Id_cliente automático
            int id_artista = 0;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
                PreparedStatement ps = con.prepareStatement("SELECT MAX(Id_artista) FROM Artista");
                rs = ps.executeQuery();
                if(rs.next()){
                    id_artista = rs.getInt(1) + 1;
                }else{
                    id_artista = 1;
                }
            }catch(Exception e){
                out.println(e);
            }
            %>
                <html>
                    <head>
                      <meta charset="UTF-8">
                      <title>Crear cuenta de artista</title>
                      <link rel="stylesheet" href="Styles/Alta_cuenta_artista.css">
                      <script src="scripts/Alta_cuenta_artista.js"></script>
                    </head>
                    <body style="background-color: #212121">
                        <form class="form_a" action="" method="post" id="form_a">

                          <input type="hidden" name="id" value="<%= id_artista %>" >
                          <input type="hidden" name="nombred" value="<%= nombre %>" >
                          <input type="hidden" name="apellidod" value="<%= apellido %>" >
                          <input type="hidden" name="correod" value="<%= correo %>" >
                          <input type="hidden" name="passwordd" value="<%= password %>" >

                          <p id="heading_a">Crea tu cuenta de Artista</p>
                          <div class="field_a">
                              <input type="text" class="input-field_a" id="nombre_artistico" name="nombre_artistico" onkeyup="validarTotal()" placeholder="Nombre artístico" required><br><br>
                          </div>
                          <div class="combos">
                              <select id="generos" class="generos" name="generos" required>
                                  <option value="" selected>Género Musical</option>
                                  <option value="Rap">Rap</option>
                                  <option value="Pop">Pop</option>
                                  <option value="Electrónica">Música electrónica</option>
                                  <option value="Indie">Indie</option>
                                  <option value="Salsa">Salsa</option>
                                  <option value="Rock">Rock</option>
                                  <option value="Rock and roll">Rock and roll</option>
                                  <option value="Jazz">Jazz</option>
                                  <option value="Merengue">Merengue</option>
                                  <option value="Punk">Punk</option>
                                  <option value="Country">Country</option>
                                  <option value="Heavymetal">Heavy Metal</option>
                                  <option value="Metal">Metal</option>
                                  <option value="Cumbia">Cumbia</option>
                                  <option value="Mariachi">Mariachi</option>
                                  <option value="Ranchera">Ranchera</option>
                              </select>
                              <br>
                          </div>
                          <div class="combos">
                              <select id="ciudad_artista" class="ciudad_artista" name="ciudad_artista" required>
                                  <option value="" selected>Ciudad</option>
                                  <option value="CDMX">CDMX</option>
                                  <option value="Estado de México">Estado de México</option>
                              </select>
                              <br>
                          </div>
                          <div class="filas_a">
                            <div class="juntos_a">
                              <input type="text" class="input-field_a" id="spotify" name="spotify"  placeholder="Spotify" required>
                            </div>
                            <div class="juntos_a">
                              <input type="text" class="input-field_a" id="tiktok" name="tiktok"  placeholder="TikTok" required><br><br>
                            </div>
                          </div>
                          <div class="filas_a">
                            <div class="juntos_a">
                              <input type="text" class="input-field_a" id="facebook" name="facebook"  placeholder="Facebook" required>
                            </div>
                            <div class="juntos_a">
                              <input type="text" class="input-field_a" id="instagram" name="instagram"  placeholder="Instagram" required><br><br>
                            </div>
                          </div>

                          <div class="filas_a">
                            <div class="juntos_a">
                              <input type="text" class="input-field_a" id="costo_promedio_hora" name="costo_promedio_hora" onkeyup="validarNumeros()" placeholder="Precio por hora" required>
                            </div>
                            <div class="juntos_a">
                              <input type="text" class="input-field_a" id="integrantes" name="integrantes" onkeyup="validarNumeros()" placeholder="Total de Integrantes" required><br><br>
                            </div>
                          </div>
                          <p style="text-align: left; margin-top: 1px; margin-bottom: 1px;" id="error_a"></p>
                          <br>
                          <input type="submit" class="button2_a" id="cuenta_artista" name="cuenta_artista" value="Cuenta Artista" formaction="Alta_cuenta_artista_2.jsp" onclick="comprobar_rellenado_Artista()">
                          <br>
                          <br>
                      </form>
                    </body>
                  </html>
            <%
        }
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Cerrar las conexiones y liberar los recursos
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

