document.charset = "UTF-8";

function MostrarPass() {
  var toggle = document.getElementById("mostrar");
  var toggleLabel = document.getElementById("togglePassword");
  var pssi = document.getElementById("contra");
  
 if (toggle.checked) {
    toggleLabel.classList.add("checked");
    pssi.type = 'text';
  } else {
    toggleLabel.classList.remove("checked");
    pssi.type = 'password';
  }
}
