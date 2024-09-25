<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%
    String id_cliente = request.getParameter("id");
%>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- estilos de funte de texto de google  -->

        <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@600;700&display=swap" rel="stylesheet">  

        <!-- estilos css style -->

        <link rel="stylesheet" href="Styles/home.css">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="Styles/slider_home.css">

    </head>
    <body>
        <!-- space ---------------------------------------------------- -->
        <div class="space">
		 <div class="videos-principales">

                <section class="home"  >
                    <video class="video-slide active" src="videos_slider_principal/1.mp4" autoplay  id="1_v" ></video>
                    <video class="video-slide" src="videos_slider_principal/2.mp4"   id="2_v"></video>
                    <video class="video-slide" src="videos_slider_principal/3.mp4"   id="3_v"></video>
                    <video class="video-slide" src="videos_slider_principal/4.mp4"   id="4_v" ></video>
                    <video class="video-slide" src="videos_slider_principal/5.mp4"   id="5_v"></video>
                    <div class="content active" id="1_c" >
                        <h1>MelodyFinder<br><span>La mejor opción</span></h1>

                    </div>
                    <div class="content" id="2_c">
                        <h1>MelodyFinder<br><span>La mejor opción</span></h1>

                    </div>
                    <div class="content" id="3_c">
                       <h1>MelodyFinder<br><span>La mejor opción</span></h1>

                    </div>
                    <div class="content" id="4_c">
                        <h1>MelodyFinder<br><span>La mejor opción</span></h1>

                    </div>
                    <div class="content"id="5_c">
                        <h1>MelodyFinder<br><span>La mejor opción</span></h1>

                    </div>

                    <div class="media-icons">
                        <a href="#" onclick="mute_all()" ><i class="fa-solid fa-volume-high   fa-xl " style="color: #ffffff;" id="sonido_slider"></i></a>
                    </div>

                    <div class="slider-navigation">
                        <div class="nav-btn active" id="1_s" onclick="cliclc_1()"></div>
                        <div class="nav-btn" id="2_s" onclick="cliclc_2()"></div>
                        <div class="nav-btn" id="3_s" onclick="cliclc_3()"></div>
                        <div class="nav-btn" id="4_s" onclick="cliclc_4()"></div>
                        <div class="nav-btn" id="5_s"onclick="cliclc_5()"></div>
                    </div>
                </section>

            </div>

            <!-- script de slider videos -----------------------------------> 
            <script type="text/javascript">
                //Javacript for video slider navigation
                const btns = document.querySelectorAll(".nav-btn");
                const slides = document.querySelectorAll(".video-slide");
                const contents = document.querySelectorAll(".content");

                var sliderNav = function (manual) {
                    btns.forEach((btn) => {
                        btn.classList.remove("active");
                    });

                    slides.forEach((slide) => {
                        slide.classList.remove("active");
                    });

                    contents.forEach((content) => {
                        content.classList.remove("active");
                    });

                    btns[manual].classList.add("active");

                    slides[manual].classList.add("active");
                    contents[manual].classList.add("active");
                };

                btns.forEach((btn, i) => {
                    btn.addEventListener("click", () => {
                        sliderNav(i);
                    });
                });

                var sonido_slider = document.getElementById("sonido_slider");

                function mute_all() {


                    if (videoPlayer2.muted) {
                        sonido_slider.classList.remove("fa-volume-xmark");
                        sonido_slider.classList.add("fa-volume-high");

                        videoPlayer1.muted = false;
                        videoPlayer2.muted = false;
                        videoPlayer3.muted = false;
                        videoPlayer4.muted = false;
                        videoPlayer5.muted = false;
                    } else {
                        sonido_slider.classList.remove("fa-volume-high");
                        sonido_slider.classList.add("fa-volume-xmark");

                        videoPlayer1.muted = true;
                        videoPlayer2.muted = true;
                        videoPlayer3.muted = true;
                        videoPlayer4.muted = true;
                        videoPlayer5.muted = true;
                    }
                }

                //funcion de clicl sibre bolitas de navegacion 
                function playVideo(videoPlayer) {
                    // Pausa todos los videos
                    videoPlayer1.pause();
                    videoPlayer2.pause();
                    videoPlayer3.pause();
                    videoPlayer4.pause();
                    videoPlayer5.pause();

                    // Reinicia el tiempo de reproducción de todos los videos
                    videoPlayer1.currentTime = 0;
                    videoPlayer2.currentTime = 0;
                    videoPlayer3.currentTime = 0;
                    videoPlayer4.currentTime = 0;
                    videoPlayer5.currentTime = 0;

                    // Reproduce el video seleccionado
                    videoPlayer.play();
                }

                function cliclc_1() {
                    var videoPlayer = document.getElementById('1_v');
                    playVideo(videoPlayer);
                }

                function cliclc_2() {
                    var videoPlayer = document.getElementById('2_v');
                    playVideo(videoPlayer);
                }

                function cliclc_3() {
                    var videoPlayer = document.getElementById('3_v');
                    playVideo(videoPlayer);
                }

                function cliclc_4() {
                    var videoPlayer = document.getElementById('4_v');
                    playVideo(videoPlayer);
                }

                function cliclc_5() {
                    var videoPlayer = document.getElementById('5_v');
                    playVideo(videoPlayer);
                }

                var videoPlayer1 = document.getElementById("1_v");
                var videoPlayer2 = document.getElementById("2_v");
                var videoPlayer3 = document.getElementById("3_v");
                var videoPlayer4 = document.getElementById("4_v");
                var videoPlayer5 = document.getElementById("5_v");

                videoPlayer1.volume = 0.15;
                videoPlayer2.volume = 0.15;
                videoPlayer3.volume = 0.25;
                videoPlayer4.volume = 0.15;
                videoPlayer5.volume = 0.15;


                var cont1 = document.getElementById("1_c");
                var cont2 = document.getElementById("2_c");
                var cont3 = document.getElementById("3_c");
                var cont4 = document.getElementById("4_c");
                var cont5 = document.getElementById("5_c");


                var punt1 = document.getElementById("1_s");
                var punt2 = document.getElementById("2_s");
                var punt3 = document.getElementById("3_s");
                var punt4 = document.getElementById("4_s");
                var punt5 = document.getElementById("5_s");



                //funcion que al terminar el vidoe reprodusca el siguiente

                videoPlayer1.addEventListener("ended", function () {
                    videoPlayer2.play();


                    cont2.classList.add("active");
                    punt2.classList.add("active");
                    videoPlayer2.classList.add("active");

                    cont1.classList.remove("active");
                    punt1.classList.remove("active");
                    videoPlayer1.classList.remove("active");

                });

                videoPlayer2.addEventListener("ended", function () {
                    videoPlayer3.play();

                    cont3.classList.add("active");
                    punt3.classList.add("active");
                    videoPlayer3.classList.add("active");

                    cont2.classList.remove("active");
                    punt2.classList.remove("active");
                    videoPlayer2.classList.remove("active");

                });

                videoPlayer3.addEventListener("ended", function () {
                    videoPlayer4.play();

                    cont4.classList.add("active");
                    punt4.classList.add("active");
                    videoPlayer4.classList.add("active");

                    cont3.classList.remove("active");
                    punt3.classList.remove("active");
                    videoPlayer3.classList.remove("active");

                });

                videoPlayer4.addEventListener("ended", function () {
                    videoPlayer5.play();

                    cont5.classList.add("active");
                    punt5.classList.add("active");
                    videoPlayer5.classList.add("active");

                    cont4.classList.remove("active");
                    punt4.classList.remove("active");
                    videoPlayer4.classList.remove("active");

                });

                videoPlayer5.addEventListener("ended", function () {
                    videoPlayer1.play();

                    cont1.classList.add("active");
                    punt1.classList.add("active");
                    videoPlayer1.classList.add("active");

                    cont5.classList.remove("active");
                    punt5.classList.remove("active");
                    videoPlayer5.classList.remove("active");

                });


            </script>
            <!-- script de slider videos -----------------------------------> 

            <div class="contenedor-generos-sliders">


                <!-- slider gneros ---------------------------------------------->
                <div class="contenedor-slider-generos">

                    <h1 style="color: #ffffff;">Rock</h1>

                    <div class="slider">
                        <div class="contenedor-slider-block">
                            <section class="section-block" id="section-block"> 
                                <div class="block-card">

                                    <%
                                        // Establecer conexión con la base de datos
                                        String url = "jdbc:mysql://localhost: 3306/melodyfinder";
                                        String user = "root";
                                        String password = "n0m3l0";
                                        Connection conn = null;
                                        Statement stmt = null;
                                        ResultSet rs = null;
                                        int contador_rock = 0;

                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection(url, user, password);
                                            stmt = conn.createStatement();

                                            // Realizar la consulta
                                            String query = "SELECT id_artista, nombre_artistico, genero_musical, promedio_numerico_artista, foto_perfil_artista "
                                                    + "FROM artista "
                                                    + "WHERE genero_musical = 'Rock' "
                                                    + "ORDER BY id_artista DESC "
                                                    + "LIMIT 18";
                                            rs = stmt.executeQuery(query);

                                            // Mostrar los resultados en los divs
                                            while (rs.next()) {
                                                int id = rs.getInt("id_artista");
                                                String nombreArtistico = rs.getString("nombre_artistico");
                                                String generoMusical = rs.getString("genero_musical");
                                                String promedioNumerico = rs.getString("promedio_numerico_artista");
                                                byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                                    %>
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="image">
                                                <%
                                                    String imagenSrc = "";
                                                    if (fotoPerfil != null) {
                                                        imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                                    }
                                                %>

                                                <img src="<%= imagenSrc%>" alt="">
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
                                                <button class="aboutMe" onclick="irACuentaArtista('<%= id%>', '<%= id_cliente%>')">Contratar</button>
                                            </div>

                                            <script>
                                                function irACuentaArtista(id, id_cliente) {
                                                    window.location.href = "Cuenta_ArtistaBD.jsp?id=" + encodeURIComponent(id) + "&id_cliente=" + encodeURIComponent(id_cliente);
                                                }
                                            </script>

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
                            </section>
                        </div>
                        <div class="arrow next" id="next" onclick="next_slider()"> <i class="fa-solid fa-chevron-right fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="arrow prev" id="prev"  onclick="prev_slider()"> <i class="fa-solid fa-chevron-left fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="nav-bar"> 
                            <div class="punto-nav-bar t1" id="t1" onclick="cambio_tamaño_nav_t1()"></div>
                            <div class="punto-nav-bar t2"id="t2" onclick="cambio_tamaño_nav_t2()"></div>
                            <div class="punto-nav-bar t3" id="t3" onclick="cambio_tamaño_nav_t3()"></div>
                        </div>

                        <script type="text/javascript">

                            var t1 = document.getElementById("t1");
                            var t2 = document.getElementById("t2");
                            var t3 = document.getElementById("t3");
                            var next = document.getElementById("next");
                            var prev = document.getElementById("prev");
                            var section = document.getElementById("section-block");

                            var blockindex = 0;

                            function next_slider() {
                                if (blockindex === 2) {
                                    blockindex = 0;
                                } else {
                                    blockindex = (blockindex < 2) ? blockindex + 1 : 2;
                                }
                                section.style.transform = 'translateX(' + (blockindex) * -33.33 + '%)';
                                console.log(blockindex);
                                if (blockindex === 0) {
                                    cambio_tamaño_nav_t1();
                                }
                                if (blockindex === 1) {
                                    cambio_tamaño_nav_t2();
                                }
                                if (blockindex === 2) {
                                    cambio_tamaño_nav_t3();
                                }


                            }
                            function prev_slider() {
                                if (blockindex === 0) {
                                    blockindex = 2;
                                } else {
                                    blockindex = (blockindex > 0) ? blockindex - 1 : 0;
                                }
                                section.style.transform = 'translateX(' + (blockindex) * -33.33 + '%)';
                                console.log(blockindex);
                                if (blockindex === 0) {
                                    cambio_tamaño_nav_t1();
                                }
                                if (blockindex === 1) {
                                    cambio_tamaño_nav_t2();
                                }
                                if (blockindex === 2) {
                                    cambio_tamaño_nav_t3();
                                }
                            }

                            function cambio_tamaño_nav_t1() {
                                t1.style.transform = "scale(1.1)";
                                t2.style.transform = "scale(0.8)";
                                t3.style.transform = "scale(0.55)";
                                t1.style.opacity = '1';
                                t2.style.opacity = '0.8';
                                t3.style.opacity = '0.5';
                                section.style.transform = "translateX(0%)";
                            }
                            function cambio_tamaño_nav_t2() {
                                t1.style.transform = "scale(0.8)";
                                t2.style.transform = "scale(1.1)";
                                t3.style.transform = "scale(0.8)";
                                t1.style.opacity = '0.8';
                                t2.style.opacity = '1';
                                t3.style.opacity = '0.8';
                                section.style.transform = "translateX(-33.33%)";
                            }

                            function cambio_tamaño_nav_t3() {
                                t1.style.transform = "scale(0.55)";
                                t2.style.transform = "scale( 0.8)";
                                t3.style.transform = "scale(1.1)";
                                t1.style.opacity = '0.5';
                                t2.style.opacity = '0.8';
                                t3.style.opacity = '1';
                                section.style.transform = "translateX(-66.66%)";
                            }



                        </script> 


                    </div>
                </div>
                <!-- slider gneros ---------------------------------------------->
                <div class="contenedor-slider-generos">

                    <h1 style="color: #ffffff;">Pop</h1>

                    <div class="slider">
                        <div class="contenedor-slider-block">
                            <section class="section-block" id="section-block-pop"> 
                                <div class="block-card">

                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection(url, user, password);
                                            stmt = conn.createStatement();

                                            // Realizar la consulta
                                            String query = "SELECT id_artista, nombre_artistico, genero_musical, promedio_numerico_artista, foto_perfil_artista "
                                                    + "FROM artista "
                                                    + "WHERE genero_musical = 'Pop' "
                                                    + "ORDER BY id_artista DESC "
                                                    + "LIMIT 18";
                                            rs = stmt.executeQuery(query);

                                            // Mostrar los resultados en los divs
                                            while (rs.next()) {
                                                int id = rs.getInt("id_artista");
                                                String nombreArtistico = rs.getString("nombre_artistico");
                                                String generoMusical = rs.getString("genero_musical");
                                                String promedioNumerico = rs.getString("promedio_numerico_artista");
                                                byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                                    %>
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="image">
                                                <%
                                                    String imagenSrc = "";
                                                    if (fotoPerfil != null) {
                                                        imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                                    }
                                                %>

                                                <img src="<%= imagenSrc%>" alt="">
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
                                                <button class="aboutMe" onclick="irACuentaArtista('<%= id%>', '<%= id_cliente%>')">Contratar</button>
                                            </div>
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
                            </section>
                        </div>
                        <div class="arrow next" id="next-pop" onclick="next_slider_pop()"> <i class="fa-solid fa-chevron-right fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="arrow prev" id="prev-pop"  onclick="prev_slider_pop()"> <i class="fa-solid fa-chevron-left fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="nav-bar"> 
                            <div class="punto-nav-bar t1" id="t1-pop" onclick="cambio_tamaño_nav_t1_pop()"></div>
                            <div class="punto-nav-bar t2"id="t2-pop" onclick="cambio_tamaño_nav_t2_pop()"></div>
                            <div class="punto-nav-bar t3" id="t3-pop" onclick="cambio_tamaño_nav_t3_pop()"></div>
                        </div>

                        <script type="text/javascript">

                            var t1_pop = document.getElementById("t1-pop");
                            var t2_pop = document.getElementById("t2-pop");
                            var t3_pop = document.getElementById("t3-pop");
                            var next_pop = document.getElementById("next-pop");
                            var prev_pop = document.getElementById("prev-pop");
                            var section_pop = document.getElementById("section-block-pop");

                            var blockindex_pop = 0;

                            function next_slider_pop() {
                                if (blockindex_pop === 2) {
                                    blockindex_pop = 0;
                                } else {
                                    blockindex_pop = (blockindex_pop < 2) ? blockindex_pop + 1 : 2;
                                }
                                section_pop.style.transform = 'translateX(' + (blockindex_pop) * -33.33 + '%)';
                                if (blockindex_pop === 0) {
                                    cambio_tamaño_nav_t1_pop();
                                }
                                if (blockindex_pop === 1) {
                                    cambio_tamaño_nav_t2_pop();
                                }
                                if (blockindex_pop === 2) {
                                    cambio_tamaño_nav_t3_pop();
                                }


                            }
                            function prev_slider_pop() {
                                if (blockindex_pop === 0) {
                                    blockindex_pop = 2;
                                } else {
                                    blockindex_pop = (blockindex_pop > 0) ? blockindex_pop - 1 : 0;
                                }
                                section_pop.style.transform = 'translateX(' + (blockindex_pop) * -33.33 + '%)';
                                console.log(blockindex_pop);
                                if (blockindex_pop === 0) {
                                    cambio_tamaño_nav_t1_pop();
                                }
                                if (blockindex_pop === 1) {
                                    cambio_tamaño_nav_t2_pop();
                                }
                                if (blockindex_pop === 2) {
                                    cambio_tamaño_nav_t3_pop();
                                }
                            }

                            function cambio_tamaño_nav_t1_pop() {
                                t1_pop.style.transform = "scale(1.1)";
                                t2_pop.style.transform = "scale(0.8)";
                                t3_pop.style.transform = "scale(0.55)";
                                t1_pop.style.opacity = '1';
                                t2_pop.style.opacity = '0.8';
                                t3_pop.style.opacity = '0.5';
                                section_pop.style.transform = "translateX(0%)";
                            }
                            function cambio_tamaño_nav_t2_pop() {
                                t1_pop.style.transform = "scale(0.8)";
                                t2_pop.style.transform = "scale(1.1)";
                                t3_pop.style.transform = "scale(0.8)";
                                t1_pop.style.opacity = '0.8';
                                t2_pop.style.opacity = '1';
                                t3_pop.style.opacity = '0.8';
                                section_pop.style.transform = "translateX(-33.33%)";
                            }

                            function cambio_tamaño_nav_t3_pop() {
                                t1_pop.style.transform = "scale(0.55)";
                                t2_pop.style.transform = "scale( 0.8)";
                                t3_pop.style.transform = "scale(1.1)";
                                t1_pop.style.opacity = '0.5';
                                t2_pop.style.opacity = '0.8';
                                t3_pop.style.opacity = '1';
                                section_pop.style.transform = "translateX(-66.66%)";
                            }



                        </script> 


                    </div>
                </div>
                <!-- slider gneros ---------------------------------------------->
                <div class="contenedor-slider-generos">

                    <h1 style="color: #ffffff;">Cumbia</h1>

                    <div class="slider">
                        <div class="contenedor-slider-block">
                            <section class="section-block" id="section-block_Cumbia">   
                                <div class="block-card">

                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection(url, user, password);
                                            stmt = conn.createStatement();

                                            // Realizar la consulta
                                            String query = "SELECT id_artista, nombre_artistico, genero_musical, promedio_numerico_artista, foto_perfil_artista "
                                                    + "FROM artista "
                                                    + "WHERE genero_musical = 'Cumbia' "
                                                    + "ORDER BY id_artista DESC "
                                                    + "LIMIT 18";
                                            rs = stmt.executeQuery(query);

                                            // Mostrar los resultados en los divs
                                            while (rs.next()) {
                                                int id = rs.getInt("id_artista");
                                                String nombreArtistico = rs.getString("nombre_artistico");
                                                String generoMusical = rs.getString("genero_musical");
                                                String promedioNumerico = rs.getString("promedio_numerico_artista");
                                                byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                                    %>
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="image">
                                                <%
                                                    String imagenSrc = "";
                                                    if (fotoPerfil != null) {
                                                        imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                                    }
                                                %>

                                                <img src="<%= imagenSrc%>" alt="">
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
                                                <button class="aboutMe" onclick="irACuentaArtista('<%= id%>', '<%= id_cliente%>')">Contratar</button>
                                            </div>
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
                            </section>
                        </div>
                        <div class="arrow next" id="next_Cumbia" onclick="next_slider_Cumbia()"> <i class="fa-solid fa-chevron-right fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="arrow prev" id="prev_Cumbia"  onclick="prev_slider_Cumbia()"> <i class="fa-solid fa-chevron-left fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="nav-bar"> 
                            <div class="punto-nav-bar t1" id="t1_Cumbia" onclick="cambio_tamaño_nav_t1_Cumbia()"></div>
                            <div class="punto-nav-bar t2"id="t2_Cumbia" onclick="cambio_tamaño_nav_t2_Cumbia()"></div>
                            <div class="punto-nav-bar t3" id="t3_Cumbia" onclick="cambio_tamaño_nav_t3_Cumbia()"></div>
                        </div>

                        <script type="text/javascript">

                            var t1_Cumbia = document.getElementById("t1_Cumbia");
                            var t2_Cumbia = document.getElementById("t2_Cumbia");
                            var t3_Cumbia = document.getElementById("t3_Cumbia");
                            var next_Cumbia = document.getElementById("next_Cumbia");
                            var prev_Cumbia = document.getElementById("prev_Cumbia");
                            var section_Cumbia = document.getElementById("section-block_Cumbia");

                            var blockindex_Cumbia = 0;

                            function next_slider_Cumbia() {
                                if (blockindex_Cumbia === 2) {
                                    blockindex_Cumbia = 0;
                                } else {
                                    blockindex_Cumbia = (blockindex_Cumbia < 2) ? blockindex_Cumbia + 1 : 2;
                                }
                                section_Cumbia.style.transform = 'translateX(' + (blockindex_Cumbia) * -33.33 + '%)';
                                if (blockindex_Cumbia === 0) {
                                    cambio_tamaño_nav_t1_Cumbia();
                                }
                                if (blockindex_Cumbia === 1) {
                                    cambio_tamaño_nav_t2_Cumbia();
                                }
                                if (blockindex_Cumbia === 2) {
                                    cambio_tamaño_nav_t3_Cumbia();
                                }


                            }
                            function prev_slider_Cumbia() {
                                if (blockindex_Cumbia === 0) {
                                    blockindex_Cumbia = 2;
                                } else {
                                    blockindex_Cumbia = (blockindex_Cumbia > 0) ? blockindex_Cumbia - 1 : 0;
                                }
                                section_Cumbia.style.transform = 'translateX(' + (blockindex_Cumbia) * -33.33 + '%)';
                                if (blockindex_Cumbia === 0) {
                                    cambio_tamaño_nav_t1_Cumbia();
                                }
                                if (blockindex_Cumbia === 1) {
                                    cambio_tamaño_nav_t2_Cumbia();
                                }
                                if (blockindex_Cumbia === 2) {
                                    cambio_tamaño_nav_t3_Cumbia();
                                }
                            }

                            function cambio_tamaño_nav_t1_Cumbia() {
                                t1_Cumbia.style.transform = "scale(1.1)";
                                t2_Cumbia.style.transform = "scale(0.8)";
                                t3_Cumbia.style.transform = "scale(0.55)";
                                t1_Cumbia.style.opacity = '1';
                                t2_Cumbia.style.opacity = '0.8';
                                t3_Cumbia.style.opacity = '0.5';
                                section_Cumbia.style.transform = "translateX(0%)";
                            }
                            function cambio_tamaño_nav_t2_Cumbia() {
                                t1_Cumbia.style.transform = "scale(0.8)";
                                t2_Cumbia.style.transform = "scale(1.1)";
                                t3_Cumbia.style.transform = "scale(0.8)";
                                t1_Cumbia.style.opacity = '0.8';
                                t2_Cumbia.style.opacity = '1';
                                t3_Cumbia.style.opacity = '0.8';
                                section_Cumbia.style.transform = "translateX(-33.33%)";
                            }

                            function cambio_tamaño_nav_t3_Cumbia() {
                                t1_Cumbia.style.transform = "scale(0.55)";
                                t2_Cumbia.style.transform = "scale( 0.8)";
                                t3_Cumbia.style.transform = "scale(1.1)";
                                t1_Cumbia.style.opacity = '0.5';
                                t2_Cumbia.style.opacity = '0.8';
                                t3_Cumbia.style.opacity = '1';
                                section_Cumbia.style.transform = "translateX(-66.66%)";
                            }



                        </script> 


                    </div>
                </div>

                <!-- slider gneros ---------------------------------------------->
                <div class="contenedor-slider-generos">

                    <h1 style="color: #ffffff;">Electrónica</h1>

                    <div class="slider">
                        <div class="contenedor-slider-block">
                            <section class="section-block" id="section-block_Electronica"> 
                                <div class="block-card">

                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection(url, user, password);
                                            stmt = conn.createStatement();

                                            // Realizar la consulta
                                            String query = "SELECT id_artista, nombre_artistico, genero_musical, promedio_numerico_artista, foto_perfil_artista "
                                                    + "FROM artista "
                                                    + "WHERE genero_musical = 'Electrónica' "
                                                    + "ORDER BY id_artista DESC "
                                                    + "LIMIT 18";
                                            rs = stmt.executeQuery(query);

                                            // Mostrar los resultados en los divs
                                            while (rs.next()) {
                                                int id = rs.getInt("id_artista");
                                                String nombreArtistico = rs.getString("nombre_artistico");
                                                String generoMusical = rs.getString("genero_musical");
                                                String promedioNumerico = rs.getString("promedio_numerico_artista");
                                                byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                                    %>
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="image">
                                                <%
                                                    String imagenSrc = "";
                                                    if (fotoPerfil != null) {
                                                        imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                                    }
                                                %>

                                                <img src="<%= imagenSrc%>" alt="">
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
                                                <button class="aboutMe" onclick="irACuentaArtista('<%= id%>', '<%= id_cliente%>')">Contratar</button>
                                            </div>
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
                            </section>
                        </div>
                        <div class="arrow next" id="next_Electronica" onclick="next_slider_Electronica()"> <i class="fa-solid fa-chevron-right fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="arrow prev" id="prev_Electronica"  onclick="prev_slider_Electronica()"> <i class="fa-solid fa-chevron-left fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="nav-bar"> 
                            <div class="punto-nav-bar t1" id="t1_Electronica" onclick="cambio_tamaño_nav_t1_Electronica()"></div>
                            <div class="punto-nav-bar t2"id="t2_Electronica" onclick="cambio_tamaño_nav_t2_Electronica()"></div>
                            <div class="punto-nav-bar t3" id="t3_Electronica" onclick="cambio_tamaño_nav_t3_Electronica()"></div>
                        </div>

                        <script type="text/javascript">

                            var t1_Electronica = document.getElementById("t1_Electronica");
                            var t2_Electronica = document.getElementById("t2_Electronica");
                            var t3_Electronica = document.getElementById("t3_Electronica");
                            var next_Electronica = document.getElementById("next_Electronica");
                            var prev_Electronica = document.getElementById("prev_Electronica");
                            var section_Electronica = document.getElementById("section-block_Electronica");

                            var blockindex_Electronica = 0;

                            function next_slider_Electronica() {
                                if (blockindex_Electronica === 2) {
                                    blockindex_Electronica = 0;
                                } else {
                                    blockindex_Electronica = (blockindex_Electronica < 2) ? blockindex_Electronica + 1 : 2;
                                }
                                section_Electronica.style.transform = 'translateX(' + (blockindex_Electronica) * -33.33 + '%)';
                                if (blockindex_Electronica === 0) {
                                    cambio_tamaño_nav_t1_Electronica();
                                }
                                if (blockindex_Electronica === 1) {
                                    cambio_tamaño_nav_t2_Electronica();
                                }
                                if (blockindex_Electronica === 2) {
                                    cambio_tamaño_nav_t3_Electronica();
                                }


                            }
                            function prev_slider_Electronica() {
                                if (blockindex_Electronica === 0) {
                                    blockindex_Electronica = 2;
                                } else {
                                    blockindex_Electronica = (blockindex_Electronica > 0) ? blockindex_Electronica - 1 : 0;
                                }
                                section_Electronica.style.transform = 'translateX(' + (blockindex_Electronica) * -33.33 + '%)';
                                if (blockindex_Electronica === 0) {
                                    cambio_tamaño_nav_t1_Electronica();
                                }
                                if (blockindex_Electronica === 1) {
                                    cambio_tamaño_nav_t2_Electronica();
                                }
                                if (blockindex_Electronica === 2) {
                                    cambio_tamaño_nav_t3_Electronica();
                                }
                            }

                            function cambio_tamaño_nav_t1_Electronica() {
                                t1_Electronica.style.transform = "scale(1.1)";
                                t2_Electronica.style.transform = "scale(0.8)";
                                t3_Electronica.style.transform = "scale(0.55)";
                                t1_Electronica.style.opacity = '1';
                                t2_Electronica.style.opacity = '0.8';
                                t3_Electronica.style.opacity = '0.5';
                                section_Electronica.style.transform = "translateX(0%)";
                            }
                            function cambio_tamaño_nav_t2_Electronica() {
                                t1_Electronica.style.transform = "scale(0.8)";
                                t2_Electronica.style.transform = "scale(1.1)";
                                t3_Electronica.style.transform = "scale(0.8)";
                                t1_Electronica.style.opacity = '0.8';
                                t2_Electronica.style.opacity = '1';
                                t3_Electronica.style.opacity = '0.8';
                                section_Electronica.style.transform = "translateX(-33.33%)";
                            }

                            function cambio_tamaño_nav_t3_Electronica() {
                                t1_Electronica.style.transform = "scale(0.55)";
                                t2_Electronica.style.transform = "scale( 0.8)";
                                t3_Electronica.style.transform = "scale(1.1)";
                                t1_Electronica.style.opacity = '0.5';
                                t2_Electronica.style.opacity = '0.8';
                                t3_Electronica.style.opacity = '1';
                                section_Electronica.style.transform = "translateX(-66.66%)";
                            }



                        </script> 


                    </div>
                </div>


                <!-- slider gneros ---------------------------------------------->
                <div class="contenedor-slider-generos">

                    <h1 style="color: #ffffff;">Mariachi</h1>

                    <div class="slider">
                        <div class="contenedor-slider-block">
                            <section class="section-block" id="section-block_Mariachi"> 

                                <!-- Block card -------------------------- -->    
                                <div class="block-card">


                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection(url, user, password);
                                            stmt = conn.createStatement();

                                            // Realizar la consulta
                                            String query = "SELECT id_artista, nombre_artistico, genero_musical, promedio_numerico_artista, foto_perfil_artista "
                                                    + "FROM artista "
                                                    + "WHERE genero_musical = 'Mariachi' "
                                                    + "ORDER BY id_artista DESC "
                                                    + "LIMIT 18";
                                            rs = stmt.executeQuery(query);

                                            // Mostrar los resultados en los divs
                                            while (rs.next()) {
                                                int id = rs.getInt("id_artista");
                                                String nombreArtistico = rs.getString("nombre_artistico");
                                                String generoMusical = rs.getString("genero_musical");
                                                String promedioNumerico = rs.getString("promedio_numerico_artista");
                                                byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                                    %>
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="image">
                                                <%
                                                    String imagenSrc = "";
                                                    if (fotoPerfil != null) {
                                                        imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                                    }
                                                %>

                                                <img src="<%= imagenSrc%>" alt="">
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
                                                <button class="aboutMe" onclick="irACuentaArtista('<%= id%>', '<%= id_cliente%>')">Contratar</button>
                                            </div>
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
                                <!-- Block card -----------------------end -->
                            </section>
                        </div>

                        <div class="arrow next" id="next_Mariachi" onclick="next_slider_Mariachi()"> <i class="fa-solid fa-chevron-right fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="arrow prev" id="prev_Mariachi"  onclick="prev_slider_Mariachi()"> <i class="fa-solid fa-chevron-left fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="nav-bar"> 
                            <div class="punto-nav-bar t1" id="t1_Mariachi" onclick="cambio_tamaño_nav_t1_Mariachi()"></div>
                            <div class="punto-nav-bar t2"id="t2_Mariachi" onclick="cambio_tamaño_nav_t2_Mariachi()"></div>
                            <div class="punto-nav-bar t3" id="t3_Mariachi" onclick="cambio_tamaño_nav_t3_Mariachi()"></div>
                        </div>

                        <script type="text/javascript">

                            var t1_Mariachi = document.getElementById("t1_Mariachi");
                            var t2_Mariachi = document.getElementById("t2_Mariachi");
                            var t3_Mariachi = document.getElementById("t3_Mariachi");
                            var next_Mariachi = document.getElementById("next_Mariachi");
                            var prev_Mariachi = document.getElementById("prev_Mariachi");
                            var section_Mariachi = document.getElementById("section-block_Mariachi");

                            var blockindex_Mariachi = 0;

                            function next_slider_Mariachi() {
                                if (blockindex_Mariachi === 2) {
                                    blockindex_Mariachi = 0;
                                } else {
                                    blockindex_Mariachi = (blockindex_Mariachi < 2) ? blockindex_Mariachi + 1 : 2;
                                }
                                section_Mariachi.style.transform = 'translateX(' + (blockindex_Mariachi) * -33.33 + '%)';
                                if (blockindex_Mariachi === 0) {
                                    cambio_tamaño_nav_t1_Mariachi();
                                }
                                if (blockindex_Mariachi === 1) {
                                    cambio_tamaño_nav_t2_Mariachi();
                                }
                                if (blockindex_Mariachi === 2) {
                                    cambio_tamaño_nav_t3_Mariachi();
                                }


                            }
                            function prev_slider_Mariachi() {
                                if (blockindex_Mariachi === 0) {
                                    blockindex_Mariachi = 2;
                                } else {
                                    blockindex_Mariachi = (blockindex_Mariachi > 0) ? blockindex_Mariachi - 1 : 0;
                                }
                                section_Mariachi.style.transform = 'translateX(' + (blockindex_Mariachi) * -33.33 + '%)';
                                if (blockindex_Mariachi === 0) {
                                    cambio_tamaño_nav_t1_Mariachi();
                                }
                                if (blockindex_Mariachi === 1) {
                                    cambio_tamaño_nav_t2_Mariachi();
                                }
                                if (blockindex_Mariachi === 2) {
                                    cambio_tamaño_nav_t3_Mariachi();
                                }
                            }

                            function cambio_tamaño_nav_t1_Mariachi() {
                                t1_Mariachi.style.transform = "scale(1.1)";
                                t2_Mariachi.style.transform = "scale(0.8)";
                                t3_Mariachi.style.transform = "scale(0.55)";
                                t1_Mariachi.style.opacity = '1';
                                t2_Mariachi.style.opacity = '0.8';
                                t3_Mariachi.style.opacity = '0.5';
                                section_Mariachi.style.transform = "translateX(0%)";
                            }
                            function cambio_tamaño_nav_t2_Mariachi() {
                                t1_Mariachi.style.transform = "scale(0.8)";
                                t2_Mariachi.style.transform = "scale(1.1)";
                                t3_Mariachi.style.transform = "scale(0.8)";
                                t1_Mariachi.style.opacity = '0.8';
                                t2_Mariachi.style.opacity = '1';
                                t3_Mariachi.style.opacity = '0.8';
                                section_Mariachi.style.transform = "translateX(-33.33%)";
                            }

                            function cambio_tamaño_nav_t3_Mariachi() {
                                t1_Mariachi.style.transform = "scale(0.55)";
                                t2_Mariachi.style.transform = "scale( 0.8)";
                                t3_Mariachi.style.transform = "scale(1.1)";
                                t1_Mariachi.style.opacity = '0.5';
                                t2_Mariachi.style.opacity = '0.8';
                                t3_Mariachi.style.opacity = '1';
                                section_Mariachi.style.transform = "translateX(-66.66%)";
                            }



                        </script> 


                    </div>
                </div>


                <!-- slider gneros ---------------------------------------------->
                <div class="contenedor-slider-generos">

                    <h1 style="color: #ffffff;">Indie</h1>

                    <div class="slider">
                        <div class="contenedor-slider-block">
                            <section class="section-block" id="section-block_Indie"> 

                                <!-- Block card -------------------------- -->    
                                <div class="block-card">


                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection(url, user, password);
                                            stmt = conn.createStatement();

                                            // Realizar la consulta
                                            String query = "SELECT id_artista, nombre_artistico, genero_musical, promedio_numerico_artista, foto_perfil_artista "
                                                    + "FROM artista "
                                                    + "WHERE genero_musical = 'Indie' "
                                                    + "ORDER BY id_artista DESC "
                                                    + "LIMIT 18";
                                            rs = stmt.executeQuery(query);

                                            // Mostrar los resultados en los divs
                                            while (rs.next()) {
                                                int id = rs.getInt("id_artista");
                                                String nombreArtistico = rs.getString("nombre_artistico");
                                                String generoMusical = rs.getString("genero_musical");
                                                String promedioNumerico = rs.getString("promedio_numerico_artista");
                                                byte[] fotoPerfil = rs.getBytes("foto_perfil_artista");
                                    %>
                                    <div class="card">
                                        <div class="card-content">
                                            <div class="image">
                                                <%
                                                    String imagenSrc = "";
                                                    if (fotoPerfil != null) {
                                                        imagenSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fotoPerfil);
                                                    }
                                                %>

                                                <img src="<%= imagenSrc%>" alt="">
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
                                                <button class="aboutMe" onclick="irACuentaArtista('<%= id%>', '<%= id_cliente%>')">Contratar</button>
                                            </div>
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
                                <!-- Block card -----------------------end -->
                            </section>
                        </div>
                        <div class="arrow next" id="next_Indie" onclick="next_slider_Indie()"> <i class="fa-solid fa-chevron-right fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="arrow prev" id="prev_Indie"  onclick="prev_slider_Indie()"> <i class="fa-solid fa-chevron-left fa-2xl" style="color: #ffffff;"></i></div>
                        <div class="nav-bar"> 
                            <div class="punto-nav-bar t1" id="t1_Indie" onclick="cambio_tamaño_nav_t1_Indie()"></div>
                            <div class="punto-nav-bar t2"id="t2_Indie" onclick="cambio_tamaño_nav_t2_Indie()"></div>
                            <div class="punto-nav-bar t3" id="t3_Indie" onclick="cambio_tamaño_nav_t3_Indie()"></div>
                        </div>

                        <script type="text/javascript">

                            var t1_Indie = document.getElementById("t1_Indie");
                            var t2_Indie = document.getElementById("t2_Indie");
                            var t3_Indie = document.getElementById("t3_Indie");
                            var next_Indie = document.getElementById("next_Indie");
                            var prev_Indie = document.getElementById("prev_Indie");
                            var section_Indie = document.getElementById("section-block_Indie");

                            var blockindex_Indie = 0;

                            function next_slider_Indie() {
                                if (blockindex_Indie === 2) {
                                    blockindex_Indie = 0;
                                } else {
                                    blockindex_Indie = (blockindex_Indie < 2) ? blockindex_Indie + 1 : 2;
                                }
                                section_Indie.style.transform = 'translateX(' + (blockindex_Indie) * -33.33 + '%)';
                                if (blockindex_Indie === 0) {
                                    cambio_tamaño_nav_t1_Indie();
                                }
                                if (blockindex_Indie === 1) {
                                    cambio_tamaño_nav_t2_Indie();
                                }
                                if (blockindex_Indie === 2) {
                                    cambio_tamaño_nav_t3_Indie();
                                }


                            }
                            function prev_slider_Indie() {
                                if (blockindex_Indie === 0) {
                                    blockindex_Indie = 2;
                                } else {
                                    blockindex_Indie = (blockindex_Indie > 0) ? blockindex_Indie - 1 : 0;
                                }
                                section_Indie.style.transform = 'translateX(' + (blockindex_Indie) * -33.33 + '%)';
                                if (blockindex_Indie === 0) {
                                    cambio_tamaño_nav_t1_Indie();
                                }
                                if (blockindex_Indie === 1) {
                                    cambio_tamaño_nav_t2_Indie();
                                }
                                if (blockindex_Indie === 2) {
                                    cambio_tamaño_nav_t3_Indie();
                                }
                            }

                            function cambio_tamaño_nav_t1_Indie() {
                                t1_Indie.style.transform = "scale(1.1)";
                                t2_Indie.style.transform = "scale(0.8)";
                                t3_Indie.style.transform = "scale(0.55)";
                                t1_Indie.style.opacity = '1';
                                t2_Indie.style.opacity = '0.8';
                                t3_Indie.style.opacity = '0.5';
                                section_Indie.style.transform = "translateX(0%)";
                            }
                            function cambio_tamaño_nav_t2_Indie() {
                                t1_Indie.style.transform = "scale(0.8)";
                                t2_Indie.style.transform = "scale(1.1)";
                                t3_Indie.style.transform = "scale(0.8)";
                                t1_Indie.style.opacity = '0.8';
                                t2_Indie.style.opacity = '1';
                                t3_Indie.style.opacity = '0.8';
                                section_Indie.style.transform = "translateX(-33.33%)";
                            }

                            function cambio_tamaño_nav_t3_Indie() {
                                t1_Indie.style.transform = "scale(0.55)";
                                t2_Indie.style.transform = "scale( 0.8)";
                                t3_Indie.style.transform = "scale(1.1)";
                                t1_Indie.style.opacity = '0.5';
                                t2_Indie.style.opacity = '0.8';
                                t3_Indie.style.opacity = '1';
                                section_Indie.style.transform = "translateX(-66.66%)";
                            }



                        </script> 


                    </div>
                </div>



            </div>
            
        </div>

        <script src="https://kit.fontawesome.com/26ab79e4eb.js" crossorigin="anonymous"></script>
    </body>
</html>
