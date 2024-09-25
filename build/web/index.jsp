
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
                    <form action="Crear_Cuenta.jsp" method="post">   
                        <button class="boton_ci">Crear Cuenta</button>
                    </form>  
                </div>

                <div class="boton_crear"> 
                    <form action="Sesion.jsp" method="post">   
                        <button class="boton_ci">Iniciar Sesión</button>
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
                </div>
            </div>

            <!-- barra lateral ---------------------------------------------- -->
            <nav class="barra_lateral"> 

                <a href="#" onclick="cambiarDireccion_home()" ><i class="fa-solid fa-house" style="color: #ffffff;">                    </i>Home</a>

            </nav>

            <!-- space ---------------------------------------------------- -->
            <iframe id="iframe" src="home_outlogin.jsp"  class="space" ></iframe>
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
                function cambiarDireccion_buscar() {
                    var iframe = document.getElementById("iframe");

                    iframe.classList.add("hidden");
                    setTimeout(function () {
                        iframe.src = "buscar.jsp";
                        iframe.classList.remove("hidden");
                    }, 500);

                }
                ;

                function cambiarDireccion_MiCuenta() {
                    var iframe = document.getElementById("iframe");
                    iframe.classList.add("hidden");
                    setTimeout(function () {
                        iframe.src = "Mi_Cuenta_ArtistaBD.jsp";
                        iframe.classList.remove("hidden");
                    }, 500);
                }
                ;

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