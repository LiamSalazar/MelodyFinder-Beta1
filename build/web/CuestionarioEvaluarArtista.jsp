<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idEvento = request.getParameter("idEvento");
    String idCliente = request.getParameter("idCliente");
    String idArtista = request.getParameter("idArtista");
%>
<html>
    <head>
      <title>MelodyFinder</title>
      <link rel="stylesheet" href="Styles/CuestionarioEvaluarArtista.css">
      <script src="CuestionarioEvaluarArtista.js"></script>
      <style>
        .option.selected {
          background-color: #D1D3D4;
        }
      </style>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color: #212121" onload="checkFormCompletion()">
        <form class="form" id="form" action="CuestionarioEvaluarArtista2.jsp" method="post">
          <input type="hidden" value="<%= idEvento %>" name="idEvento">
          <input type="hidden" value="<%= idCliente %>" name="idCliente">
          <input type="hidden" value="<%= idArtista %>" name="idArtista">
          <div class="quiz">
            <div class="quiz-header"></div>
            <h1>Evaluación del Artista</h1>
            <div class="question">
              <h3>1) ¿Cómo fue el artista con respecto a los tiempos acordados?</h3>
            </div>
            <div class="option" id="a">
              <label>
                <input type="checkbox" name="pregunta1" value="Puntual" id="pregunta1A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>A</p></span>
                <span><p>Puntual</p></span>
              </label>
            </div>
            <div class="option borderme" id="b">
              <label>
                <input type="checkbox" name="pregunta1" value="Impuntual" id="pregunta1B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>B</p></span>
                <span><p>Impuntual</p></span>
              </label>
            </div>
          </div>
          <div class="quiz">
            <div class="question">
              <h3>2) ¿Cómo calificaría la actitud del artista previo y durante el evento?</h3>
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
              <h3>3) ¿Considera que cumplió con las expectativas conforme a lo visto en su perfil y redes sociales?</h3>
            </div>
            <div class="option" id="a3">
              <label>
                <input type="checkbox" name="pregunta3" value="Cumple Expectativas" id="pregunta3A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>A</p></span>
                <span><p>Cumple expectativas</p></span>
              </label>
            </div>
            <div class="option borderme" id="b3">
              <label>
                <input type="checkbox" name="pregunta3" value="No Cumple Expectativas" id="pregunta3B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>B</p></span>
                <span><p>No cumple expectativas</p></span>
              </label>
            </div>
          </div>
          <div class="quiz">
            <div class="question">
              <h3>4) ¿Cómo evaluaría su rendimiento en función del aprovechamiento del tiempo?</h3>
            </div>
            <div class="option" id="a4">
              <label>
                <input type="checkbox" name="pregunta4" value="Buen Rendimiento" id="pregunta4A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>A</p></span>
                <span><p>Buen rendimiento</p></span>
              </label>
            </div>
            <div class="option borderme" id="b4">
              <label>
                <input type="checkbox" name="pregunta4" value="Mal Rendimiento" id="pregunta4B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>B</p></span>
                <span><p>Mal rendimiento</p></span>
              </label>
            </div>
          </div>
          <div class="quiz">
            <div class="question">
              <h3>5) ¿Cómo considera a este artista en caso de otro evento a futuro?</h3>
            </div>
            <div class="option" id="a5">
              <label>
                <input type="checkbox" name="pregunta5" value="Contratable" id="pregunta5A" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>A</p></span>
                <span><p>Contratable</p></span>
              </label>
            </div>
            <div class="option borderme" id="b5">
              <label>
                <input type="checkbox" name="pregunta5" value="No Contratable" id="pregunta5B" onclick="handleCheckboxChange(this)" onchange="checkFormCompletion()">
                <span class="letter"><p>B</p></span>
                <span><p>No contratable</p></span>
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
