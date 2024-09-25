

function comprobar_rellenado_Artista() {
    var nombre_artistico = document.getElementById("nombre_artistico").value;
    var generos = document.getElementById("generos").value;
    var ciudad_artista = document.getElementById("ciudad_artista").value;
    var spotify = document.getElementById("spotify").value;
    var tiktok = document.getElementById("tiktok").value;
    var facebook = document.getElementById("facebook").value;
    var instagram = document.getElementById("instagram").value;
    var costo_promedio_hora = document.getElementById("costo_promedio_hora").value;
    var integrantes = document.getElementById("integrantes").value;

    if (nombre_artistico === "" || generos === "" || ciudad_artista === "" || spotify === "" || tiktok === "" || facebook === "" || instagram === "" || costo_promedio_hora === "" || integrantes === "") {
    event.preventDefault();
  }
  else {
    event.preventDefault(); 
    mostrarDatos_Artista();
  }
}

function mostrarDatos_Artista() {
  document.charset = "UTF-8";  
    
  var nombre = document.getElementById("nombre_artistico").value;
  var generos = document.getElementById("generos").value;
  var ciudad = document.getElementById("ciudad_artista").value;
  var costo = document.getElementById("costo_promedio_hora").value;
  var integrantes = document.getElementById("integrantes").value;
  var form = document.getElementById("form_a");
  
  if (nombre === "" || generos === "" || ciudad === "" || costo === "" || integrantes === ""){
    return;
  } 
  
  form.action = "Alta_cuenta_artista_2.jsp";
  
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
  contenido.innerHTML = "Nombre del Artista: " + nombre + "<br>Estilo musical: " + generos + "<br>Ciudad: " + ciudad + "<br>Costo: " + costo + "<br>Total de integrantes: " + integrantes;

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

function validarTotal() {
  var nombre = document.getElementById("nombre_artistico");
  var error = document.getElementById("error_a");
  var botona = document.getElementById("cuenta_artista");
  
  if (nombre.value.length > 20) {
    error.style.color = "red";
    error.innerHTML = "El nombre no debe superar los 20 caracteres";
    botona.disabled = true;
    return false;
  }
  else{
      botona.disabled = false;
      error.innerHTML = "";
  }
}



function validarNumeros() {
  var precio_hora = document.getElementById("costo_promedio_hora").value;
  var integrantes = document.getElementById("integrantes").value;
  
  // Expresión regular para validar números enteros o decimales positivos
  var regexNumeros = /^[0-9]+(\.[0-9]{1,2})?$/;

  if (!regexNumeros.test(precio_hora)) {
    document.getElementById("costo_promedio_hora").value = "";
  }
  if (!regexNumeros.test(integrantes)) {
    document.getElementById("integrantes").value = "";
  }
}
