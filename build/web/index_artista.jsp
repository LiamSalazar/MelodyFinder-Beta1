<%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<%
   String id_usuario = request.getParameter("id");;
    
    String url = "jdbc:mysql://localhost:3306/melodyfinder";
   String user = "root";
   String password = "n0m3l0";
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;

 
%>

<html>
    <head>

        <title>MelodyFinder</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- estilos de funte de texto de google  -->

        <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@600;700&display=swap" rel="stylesheet">  

        <!-- estilos css style -->

        <link rel="stylesheet" href="Styles/index.css">


        <script>
            // funcion para activar el menu y desactivrlo
            function cambiarClase() {
                var div = document.getElementById("contenedor");
                if (div.classList.contains("active")) {
                    div.classList.remove("active");
                } else {
                    div.classList.add("active");

                }
            }
            // funcion para activar el buscador al entra en pestaña buscar
            window.onload = function () {
                var iframe = document.getElementById('iframe');

                if (iframe.src.includes("buscar.jsp") || iframe.src.includes("busqueda.jsp")) {
                    document.getElementById('buscador').style.display = 'flex';
                } else {
                    document.getElementById('buscador').style.display = 'none';
                }

                iframe.onload = function () {
                    if (iframe.src.includes("buscar.jsp") || iframe.src.includes("busqueda.jsp")) {
                        document.getElementById('buscador').style.display = 'flex';
                    } else {
                        document.getElementById('buscador').style.display = 'none';
                    }
                };
            };

        </script>
    </head>

    <body>


        <div class="contenedor active" id="contenedor">

            <!--header -------------------------------------------------------->
            <div class="header">

                <div class="boton_menu" > 
                    <button class="btn" id="boton-menuu" onclick="cambiarClase()"  > 
                        <span class="icon">
                            <svg viewBox="0 0 175 80" width="40" height="40">
                            <rect width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                            <rect y="30" width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                            <rect y="60" width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                            </svg>
                        </span>
                        <span class="text">MENU</span>
                    </button>
                </div>

                <div class="boton_inicio"> 
                    <a href="ContratacionesArtista.jsp?id_usuario=<%= id_usuario %>" target="iframe">
                        <input type="button" id="correo" style="display: none;">
                        <button class="campanita">
                            <svg viewBox="0 0 448 512" class="bell"><path d="M224 0c-17.7 0-32 14.3-32 32V49.9C119.5 61.4 64 124.2 64 200v33.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V200c0-75.8-55.5-138.6-128-150.1V32c0-17.7-14.3-32-32-32zm0 96h8c57.4 0 104 46.6 104 104v33.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V200c0-57.4 46.6-104 104-104h8zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z"></path></svg>
                        </button>
                    </a>
                </div>

                <div class="boton_crear"> 
                    <form action="Sesion.jsp" method="post">   
                        <button class="Btn_exit">
                            <div class="sign"><svg viewBox="0 0 512 512"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg></div>
                            <div class="text_exit">salir</div>
                        </button>
                    </form>  
                </div>

                <div class="buscador " id="buscador">

                    <div class="container-input" id="buscador_input">
                        <input type="text" placeholder="Search" name="text" class="input" id="temporal" onkeydown="handleKeyPress(event)">
                        <svg fill="#000000" width="20px" height="20px" viewBox="0 0 1920 1920" xmlns="http://www.w3.org/2000/svg">
                        <path d="M790.588 1468.235c-373.722 0-677.647-303.924-677.647-677.647 0-373.722 303.925-677.647 677.647-677.647 373.723 0 677.647 303.925 677.647 677.647 0 373.723-303.924 677.647-677.647 677.647Zm596.781-160.715c120.396-138.692 193.807-319.285 193.807-516.932C1581.176 354.748 1226.428 0 790.588 0S0 354.748 0 790.588s354.748 790.588 790.588 790.588c197.647 0 378.24-73.411 516.932-193.807l516.028 516.142 79.963-79.963-516.142-516.028Z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                </div>

                <div class="perfil" >
                    <%
                                    try {
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(url, user, password);
                   stmt = conn.createStatement();

                   // Realizar la consulta
                   String query = "SELECT * FROM Artista WHERE Id_artista = "+id_usuario;
                   rs = stmt.executeQuery(query);

                   if(rs.next()) {
                       byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                    %>
                    <div class="img_perfil" onclick="cambiarDireccion_MiCuenta()">
                        <%
                      String imagenSrc = "";
                      if (fotoPerfil != null) {
                          imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                      %>    
                        <img src="<%= imagenSrc %>">
                      <% } else {%>
                            <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,200" />
                            <span class="material-symbols-outlined">
                                person
                            </span>
                        <%
                            }
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
                    </div>
                </div>
            </div>

            <!-- barra lateral ---------------------------------------------- -->
            <nav class="barra_lateral"> 

                <a href="#" onclick="cambiarDireccion_home()" ><i class="fa-solid fa-house" style="color: #ffffff;">                    </i>Home</a>
                <a href="#"  onclick="cambiarDireccion_Procesos()">                        <i class="fa-solid fa-handshake" style="color: #ffffff;"></i>Contrataciones</a>


            </nav>

            <!-- space ---------------------------------------------------- -->
            <iframe id="iframe" src="home_artista.jsp" name="iframe" class="space" ></iframe>
            <script>

                    function cambiarDireccion_home() {
                        var iframe = document.getElementById("iframe");
                        iframe.classList.add("hidden");
                        setTimeout(function () {
                        iframe.src = "home_artista.jsp";
                            iframe.classList.remove("hidden");
                        }, 500);
                            }
                    ;
                    
                    function cambiarDireccion_MiCuenta() {
                    var iframe = document.getElementById("iframe");
                            iframe.classList.add("hidden");
                            setTimeout(function () {
                            iframe.src = "Mi_Cuenta_ArtistaBD.jsp?id=<%= id_usuario %>";
                                    iframe.classList.remove("hidden");
                        },  500);
         }
                    ;
                    function cambiarDireccion_Procesos()  {
                        var  iframe  =  document.getElementById("iframe");
                        iframe.classList.add("hidden");
                        setTimeout(function  ()  {
                            iframe.src  =  "ContratacionesArtista.jsp?id_usuario=<%= id_usuario %>";
                            iframe.classList.remove("hidden");
                        }, 500);
                    }
            <!--  buscador inmediato  --------------------------- --> 
                var inputTimeout;
                document.getElementById('temporal').addEventListener('input', function () {
                    clearTimeout(inputTimeout);

                    var inputValue = this.value.trim();

                    if (inputValue === '') {
                        inputTimeout = setTimeout(function () {
                            var iframe = document.getElementById("iframe");
                            iframe.src = "buscar.jsp";// Cambia 'direccion.html' por la dirección a la que deseas redirigir
                        }, 500);
                    } else {
                        inputTimeout = setTimeout(function () {
                            cambiarDireccion_jsp();
                        }, 500);
                    }
                });

                function cambiarDireccion_jsp(variable) {

                    var variable = document.getElementById("temporal").value;

                    var parentWindow = window.parent;
                    parentWindow.document.getElementById('iframe').src = "busqueda.jsp?nombreVariable=" + variable;
                }
                ;

            </script>
            <!--  Font asome "iconos" --------------------------- --> 
            <script src="https://kit.fontawesome.com/26ab79e4eb.js" crossorigin="anonymous"></script>

    </body>
</html>