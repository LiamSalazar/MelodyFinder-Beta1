<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String idEvento = request.getParameter("idEvento");
    String idArtista = request.getParameter("idUsuario");
    int idCliente = 0;
    // Datos de conexión a la base de datos
    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String usuario = "root";
    String contraseña = "n0m3l0";

    Connection conexion = null;
    PreparedStatement consulta = null;
    ResultSet resultado = null;

    try {
        // Establecer la conexión a la base de datos
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(url, usuario, contraseña);

        // Consulta para obtener el ID del cliente utilizando el ID del evento
        String consultaSQL = "SELECT Id_cliente FROM Eventos WHERE Id_Eventos = ?";
        consulta = conexion.prepareStatement(consultaSQL);
        consulta.setInt(1, Integer.parseInt(idEvento));
        resultado = consulta.executeQuery();

        if (resultado.next()) {
            idCliente = resultado.getInt("Id_cliente");
        }

        // Guardar el ID del cliente en una variable llamada idCliente
        idCliente = resultado.getInt("Id_cliente");
        request.setAttribute("idCliente", idCliente);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Cerrar la conexión a la base de datos
        if (resultado != null) {
            try {
                resultado.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (consulta != null) {
            try {
                consulta.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<html>
    <head>
        <title>MelodyFinder</title>
        <link rel="stylesheet" href="Styles/CuestionarioEvaluarCliente.css">
        <style>
            .option.selected {
                background-color: #D1D3D4;
            }
        </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color: #212121" onload="checkFormCompletion()">
        <form class="form" id="form" action="CuestionarioEvaluarCliente2.jsp" method="post">
            <input type="hidden" value="<%= idEvento%>" name="idEvento">
            <input type="hidden" value="<%= idCliente%>" name="idCliente">
            <input type="hidden" value="<%= idArtista%>" name="idArtista">
            <div class="quiz">
                <div class="quiz-header"></div>
                <h1>Evaluación del Cliente</h1>
                <div class="question">
                    <h3>1) ¿Cómo calificaría la seguridad del lugar proporcionado por el cliente?</h3>
                </div>
                <div class="option" id="a">
                    <label>
                        <input type="checkbox" name="pregunta1" value="Seguro" id="pregunta1A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>A</p></span>
                        <span><p>Seguro</p></span>
                    </label>
                </div>
                <div class="option borderme" id="b">
                    <label>
                        <input type="checkbox" name="pregunta1" value="Inseguro" id="pregunta1B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>B</p></span>
                        <span><p>Inseguro</p></span>
                    </label>
                </div>
            </div>
            <div class="quiz">
                <div class="question">
                    <h3>2) ¿Cómo calificaría la actitud del cliente previo y durante el evento?</h3>
                </div>
                <div class="option" id="a2">
                    <label>
                        <input type="checkbox" name="pregunta2" value="Buena Actitud" id="pregunta2A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>A</p></span>
                        <span><p>Buena actitud</p></span>
                    </label>
                </div>
                <div class="option borderme" id="b2">
                    <label>
                        <input type="checkbox" name="pregunta2" value="Mala Actitud" id="pregunta2B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>B</p></span>
                        <span><p>Mala actitud</p></span>
                    </label>
                </div>
            </div>
            <div class="quiz">
                <div class="question">
                    <h3>3) ¿Cómo considera la organización del cliente con respecto al evento?</h3>
                </div>
                <div class="option" id="a3">
                    <label>
                        <input type="checkbox" name="pregunta3" value="Buena Organizacion" id="pregunta3A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>A</p></span>
                        <span><p>Buena organización</p></span>
                    </label>
                </div>
                <div class="option borderme" id="b3">
                    <label>
                        <input type="checkbox" name="pregunta3" value="Mala Organizacion" id="pregunta3B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>B</p></span>
                        <span><p>Mala organización</p></span>
                    </label>
                </div>
            </div>
            <div class="quiz">
                <div class="question">
                    <h3>4) ¿Cómo considera a este cliente en caso de otro evento a futuro?</h3>
                </div>
                <div class="option" id="a4">
                    <label>
                        <input type="checkbox" name="pregunta4" value="Contratable" id="pregunta4A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>A</p></span>
                        <span><p>Contratable</p></span>
                    </label>
                </div>
                <div class="option borderme" id="b4">
                    <label>
                        <input type="checkbox" name="pregunta4" value="No Contratable" id="pregunta4B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>B</p></span>
                        <span><p>No contratable</p></span>
                    </label>
                </div>
            </div>
            <div class="quiz">
                <div class="question">
                    <h3>5) ¿Cómo considera a este cliente con respecto a su cumplimiento de los acuerdos?</h3>
                </div>
                <div class="option" id="a5">
                    <label>
                        <input type="checkbox" name="pregunta5" value="Cumple con lo Acordado" id="pregunta5A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>A</p></span>
                        <span><p>Cumple con lo acordado</p></span>
                    </label>
                </div>
                <div class="option borderme" id="b5">
                    <label>
                        <input type="checkbox" name="pregunta5" value="No cumple con lo Acordado" id="pregunta5B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                        <span class="letter"><p>B</p></span>
                        <span><p>No cumple con lo acordado</p></span>
                    </label>
                </div>
            </div>
            <button type="submit" id="enviarBtn">Enviar</button>
        </form>

        <script>
            function handleCheckboxChange(checkbox) {
                const questionContainer = checkbox.closest('.quiz');
                const checkboxes = questionContainer.querySelectorAll('input[type="checkbox"]');

                checkboxes.forEach((cb) => {
                    cb.checked = false;
                    cb.parentElement.parentElement.classList.remove('selected');
                });

                checkbox.checked = true;
                checkbox.parentElement.parentElement.classList.add('selected');

                checkFormCompletion();
            }

            function checkFormCompletion() {
                var pregunta1A = document.getElementById("pregunta1A");
                var pregunta1B = document.getElementById("pregunta1B");

                var pregunta2A = document.getElementById("pregunta2A");
                var pregunta2B = document.getElementById("pregunta2B");

                var pregunta3A = document.getElementById("pregunta3A");
                var pregunta3B = document.getElementById("pregunta3B");

                var pregunta4A = document.getElementById("pregunta4A");
                var pregunta4B = document.getElementById("pregunta4B");

                var pregunta5A = document.getElementById("pregunta5A");
                var pregunta5B = document.getElementById("pregunta5B");

                var enviar = document.getElementById("enviarBtn");

                if ((!pregunta1A.checked && !pregunta1B.checked) ||
                        (!pregunta2A.checked && !pregunta2B.checked) ||
                        (!pregunta3A.checked && !pregunta3B.checked) ||
                        (!pregunta4A.checked && !pregunta4B.checked) ||
                        (!pregunta5A.checked && !pregunta5B.checked)) {
                    enviar.disabled = true;
                } else {
                    enviar.disabled = false;
                }
            }

        </script>
    </body>
</html>
