document.charset = "UTF-8";

function MostrarPassi() {
  var toggle = document.getElementById("mostrari");
  var toggleLabel = document.getElementById("togglePassword_password");
  var pssi = document.getElementById("password");
  
  
  if (toggle.checked) {
    toggleLabel.classList.add("checked");
    pssi.type = 'text';
  } else {
    toggleLabel.classList.remove("checked");
    pssi.type = 'password';
  }
}

function MostrarPassc() {
  var toggle = document.getElementById("mostrarc");
  var toggleLabel = document.getElementById("togglePassword_comprobar");
  var pssc = document.getElementById("confirmar_password");
  
  
  if (toggle.checked) {
    toggleLabel.classList.add("checked");
    pssc.type = 'text';
  } else {
    toggleLabel.classList.remove("checked");
    pssc.type = 'password';
  }
}

function mostrarDatos_Cliente() {
  var nombre = document.getElementById("nombre").value;
  var apellido = document.getElementById("apellido").value;
  var email = document.getElementById("email").value;
  var password = document.getElementById("password");
  var form = document.getElementById("form_c");
  form.action = "Alta_cuenta_cliente.jsp";
  
  var dialogo = document.createElement("div");
  dialogo.setAttribute("id", "dialogo");
  dialogo.style.backgroundColor = "#212121";
  dialogo.style.color = "#fff";
  dialogo.style.padding = "20px";
  dialogo.style.borderRadius = "5px";
  dialogo.style.boxShadow = "0 0 10px #000";
  dialogo.style.position = "fixed";
  dialogo.style.top = "10%";
  dialogo.style.left = "50%";
  dialogo.style.transform = "translate(-50%, -50%)";
  
  var contenido = document.createElement("p");
  contenido.innerHTML = "Nombre: " + nombre + "<br>Apellido: " + apellido + "<br>Email: " + email;

  var botonConfirmar = document.createElement("button");
  botonConfirmar.innerHTML = "Confirmar";
  botonConfirmar.style.border = "1px solid #fff";
  botonConfirmar.style.backgroundColor = "#212121";
  botonConfirmar.style.color = "#fff";
  botonConfirmar.style.padding = "10px";
  botonConfirmar.style.marginRight = "10px";
  botonConfirmar.addEventListener("click", function() {
    form.submit();
  });

  var botonCancelar = document.createElement("button");
  botonCancelar.innerHTML = "Cancelar";
  botonCancelar.style.border = "1px solid #fff";
  botonCancelar.style.backgroundColor = "#212121";
  botonCancelar.style.color = "#fff";
  botonCancelar.style.padding = "10px";
  botonCancelar.addEventListener("click", function() {
    document.body.removeChild(dialogo);
  });

  dialogo.appendChild(contenido);
  dialogo.appendChild(botonConfirmar);
  dialogo.appendChild(botonCancelar);

  document.body.appendChild(dialogo);
}


function comprobar_Contra_Cliente(event) {
  var password = document.getElementById("password");
  var confirmar_password = document.getElementById("confirmar_password");
  var mensaje = '<p style="color: red;">Los passwords no son iguales</p>';
  var error = document.getElementById("error");
  
  if (password.value !== confirmar_password.value) {
    error.innerHTML = mensaje;
    event.preventDefault();
  } else {
    event.preventDefault();
    comprobar_rellenado_Cliente(event);
    error.innerHTML = "";
  }
}

function mostrarDatos_Artista() {
  var nombre = document.getElementById("nombre").value;
  var apellido = document.getElementById("apellido").value;
  var email = document.getElementById("email").value;
  var password = document.getElementById("password");
  var form = document.getElementById("form_c");
  form.action = "Alta_cuenta_artista.jsp";
  
  var dialogo = document.createElement("div");
  dialogo.setAttribute("id", "dialogo");
  dialogo.style.backgroundColor = "#212121";
  dialogo.style.color = "#fff";
  dialogo.style.padding = "20px";
  dialogo.style.borderRadius = "5px";
  dialogo.style.boxShadow = "0 0 10px #000";
  dialogo.style.position = "fixed";
  dialogo.style.top = "10%";
  dialogo.style.left = "50%";
  dialogo.style.transform = "translate(-50%, -50%)";
  
  var contenido = document.createElement("p");
  contenido.innerHTML = "Nombre: " + nombre + "<br>Apellido: " + apellido + "<br>Email: " + email;

  var botonConfirmar = document.createElement("button");
  botonConfirmar.innerHTML = "Confirmar";
  botonConfirmar.style.border = "1px solid #fff";
  botonConfirmar.style.backgroundColor = "#212121";
  botonConfirmar.style.color = "#fff";
  botonConfirmar.style.padding = "10px";
  botonConfirmar.style.marginRight = "10px";
  botonConfirmar.addEventListener("click", function() {
    form.submit();
  });

  var botonCancelar = document.createElement("button");
  botonCancelar.innerHTML = "Cancelar";
  botonCancelar.style.border = "1px solid #fff";
  botonCancelar.style.backgroundColor = "#212121";
  botonCancelar.style.color = "#fff";
  botonCancelar.style.padding = "10px";
  botonCancelar.addEventListener("click", function() {
    document.body.removeChild(dialogo);
  });

  dialogo.appendChild(contenido);
  dialogo.appendChild(botonConfirmar);
  dialogo.appendChild(botonCancelar);

  document.body.appendChild(dialogo);
}

function comprobar_Contra_Artista() {
  var password = document.getElementById("password");
  var confirmar_password = document.getElementById("confirmar_password");
  var mensaje = '<p style="color: red;">Los passwords no son iguales</p>';
  var error = document.getElementById("error");

  if (password.value !== confirmar_password.value) {
    error.innerHTML = mensaje;
    event.preventDefault();
  } 
  else {
    event.preventDefault();
    comprobar_rellenado_Artista();
    error.innerHTML = "";
  }
}

function comprobar_rellenado_Artista() {
  var nombre = document.getElementById("nombre").value;
  var apellido = document.getElementById("apellido").value;
  var email = document.getElementById("email").value;
  var password = document.getElementById("password").value;
  var confirmar_password = document.getElementById("confirmar_password").value;
  var error = document.getElementById("error");
  
  if (nombre === "" || apellido === "" || email === "" || password === "" || confirmar_password === ""){
      event.preventDefault();
  } 
  else {
    event.preventDefault();
    mostrarDatos_Artista();
    error.innerHTML = "";
  }
}

function comprobar_rellenado_Cliente(event) {
  var nombre = document.getElementById("nombre").value;
  var apellido = document.getElementById("apellido").value;
  var email = document.getElementById("email").value;
  var password = document.getElementById("password").value;
  var confirmar_password = document.getElementById("confirmar_password").value;
  var error = document.getElementById("error");

  // Detener el envío del formulario si hay campos vacíos
  if (nombre === "" || apellido === "" || email === "" || password === "" || confirmar_password === "") {
    event.preventDefault();
  } 
  else{
    mostrarDatos_Cliente();
    error.innerHTML = "";
  }
}

function validarTotal() {
  var nombre = document.getElementById("nombre");
  var apellido = document.getElementById("apellido");
  var password = document.getElementById("password");
  var confirmar_password = document.getElementById("confirmar_password");
  var error = document.getElementById("error");
  var botona = document.getElementById("cuenta_artista");
  var botonc = document.getElementById("cuenta_cliente");

  if (nombre.value.length > 20) {
    error.style.color = "red";
    error.innerHTML = "El nombre no debe superar los 20 caracteres";
    botona.disabled = true;
    botonc.disabled = true;
    return false;
  } else if (apellido.value.length > 20) {
    error.style.color = "red";
    error.innerHTML = "El apellido no debe superar los 20 caracteres";
    botona.disabled = true;
    botonc.disabled = true;
    return false;
  } else if (password.value.length > 20) {
    error.style.color = "red";
    error.innerHTML = "Su password no debe superar los 20 caracteres";
    botona.disabled = true;
    botonc.disabled = true;
    return false;
  } else {
    error.innerHTML = "";
    botona.disabled = false;
    botonc.disabled = false;
    return true;
  }
}

function validarletras() {
  var input = document.getElementById("nombre");
  var input2 = document.getElementById("apellido");
  input.value = input.value.replace(/[^a-zA-Z]/g, '');
  input2.value = input2.value.replace(/[^a-zA-Z]/g, '');
}
