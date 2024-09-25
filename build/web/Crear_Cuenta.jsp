<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Crear cuenta</title>
    <link rel="stylesheet" href="Styles/Crear_Cuenta.css">
    <script src="scripts/Crear_Cuenta.js"></script>
  </head>
    <body style="background-color: #212121">
        <form class="form_c" action="" method="post" id="form_c">
          <p id="heading_c">Crea tu cuenta de MelodyFinder</p>
          <div class="filas">
              <div class="juntos">
                  <input type="text" class="input-field_c" id="nombre" name="nombre" onkeydown="validarTotal()" onkeyup="validarletras()" placeholder="Nombre" required>
              </div>
              <div class="juntos">
                  <input type="text" class="input-field_c" id="apellido" name="apellido" onkeydown="validarTotal()" onkeyup="validarletras()" placeholder="Apellido" required><br><br>
              </div>
          </div>
          <div class="field_c">
              <input type="email" class="input-field_c" id="email" name="email" placeholder="Correo electrónico" required><br><br>
          </div>
          <div class="field_c">
              <input type="password" class="input-field_c" id="password" name="password" onkeyup="validarTotal()" placeholder="Ingresa tu contraseña" required>
              <label for="mostrari" id="togglePassword_password">
                  <input type="checkbox" id="mostrari" onclick="MostrarPassi()">
              </label>
              <br><br>
          </div>
          <div class="field_c">
              <input type="password" class="input-field_c" id="confirmar_password" name="confirmar_password" placeholder="Confirma tu contraseña" required>
              <label for="mostrarc" id="togglePassword_comprobar">
                  <input type="checkbox" id="mostrarc" onclick="MostrarPassc()">
              </label>
          </div>
          <p style="text-align: left; margin-top: 1px; margin-bottom: 1px;" id="error"></p>
          <div class="btn_c">
              <input type="submit" class="button1_c" id="cuenta_artista" name="cuenta_artista" value="Cuenta Artista" formaction="Alta_cuenta_artista.jsp" onclick="comprobar_Contra_Artista()">
              <input type="submit" class="button2_c" id="cuenta_cliente" name="cuenta_cliente" value="Cuenta Cliente" formaction="Alta_cuenta_cliente.jsp" onclick="comprobar_Contra_Cliente(event)">
          </div>
          <br>
          <br>
      </form>
  </body>
</html>