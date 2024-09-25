<%
    String id_cliente = request.getParameter("id");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buscar</title>
        <link rel="stylesheet" href="Styles/buscar.css">
        <!-- ===== Link Swiper's CSS ===== -->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

        <!-- ===== Fontawesome CDN Link ===== -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>

    </head>
    <body>
        

            <h1 style="color: #ffffff;">Géneros</h1>

            <div class="contendor-card-generos">
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Mariachi')"><a>Mariachi</a><img src="img_generos/mari3.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Ranchera')"><a>Ranchera</a><img src="img_generos/ranch2.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Cumbia')"><a>Cumbia</a><img src="img_generos/cumbia.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Merengue')"><a>Merengue</a><img src="img_generos/merengue.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Salsa')"><a>Salsa</a><img src="img_generos/salsa.jpg" ></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Pop')"><a>Pop</a><img src="img_generos/michael.jpg" ></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Electronica')"><a>Electrónica</a><img src="img_generos/avicii.jpg" ></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Indie')"><a>Indie </a><img src="img_generos/prueva.jpg" ></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Rock')"><a>Rock</a><img src="img_generos/ImagenRock.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Rock and roll')"><a>Rock and roll</a><img src="img_generos/elvis.jpg" ></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Jazz')"><a>Jazz</a><img src="img_generos/louis.jpg" ></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Country')"><a>Country</a><img src="img_generos/contry1.jpg" ></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Punk')"><a>Punk</a><img src="img_generos/punk.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Metal')"><a>Metal</a><img src="img_generos/metalica.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Heavymetal')"><a>Heavy Metal</a><img src="img_generos/ImagenHeavyMetal.jpg"></div>
                <div class="card-genero" onclick="cambiarDireccion_genero_buscar('Rap')"><a>Rap</a><img src="img_generos/rap.jpg"></div>
            </div>
        </div>
        <script>
            function cambiarDireccion_genero_buscar(variable) {
                var parentWindow = window.parent;
                // Modifica la dirección del iframe en el elemento padre
                parentWindow.document.getElementById('iframe').src = "genero_busqueda.jsp?nombreVariable=" + variable+"&id=<%= id_cliente %>";
            }
        </script>
    </body>
</html>
