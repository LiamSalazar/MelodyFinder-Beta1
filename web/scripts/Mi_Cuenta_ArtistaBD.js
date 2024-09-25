function Modal_Perfil(){
    const btnAbrirModal = document.querySelector("#editarHijo");
    const btnCerrarModal = document.querySelector("#cancelar_subida");
    const modal = document.querySelector("#modal");

    btnAbrirModal.addEventListener("click",()=>{modal.showModal();});
    btnCerrarModal.addEventListener("click",()=>{modal.close();});
}

function expandirImagen() {
  const imagen = document.querySelector('.imagen_perfil');
  imagen.classList.toggle('expandida');
}

function Modal_Muchos(){
    const btnAbrirModalmuchos = document.querySelector("#abrirmuchos");
    const btnCerrarModalmuchos = document.querySelector("#cancelar_subidamuchos");
    const modalmuchos = document.querySelector("#modalmuchos");

    btnAbrirModalmuchos.addEventListener("click",()=>{modalmuchos.showModal();});

    btnCerrarModalmuchos.addEventListener("click",()=>{modalmuchos.close();});
}

function openModal(){
    const btnAbrirModalfecha = document.querySelector("#abrirfecha");
    const btnCerrarModalfecha = document.querySelector("#cancelar_subidafecha");
    const modalfecha = document.querySelector("#modalfecha");

    btnAbrirModalfecha.addEventListener("click",()=>{modalfecha.showModal();});

    btnCerrarModalfecha.addEventListener("click",()=>{modalfecha.close();});
}
