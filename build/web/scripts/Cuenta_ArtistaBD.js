function Modal_Perfil(){
    const btnAbrirModal = document.querySelector("#contratar");
    const btnCerrarModal = document.querySelector("#cancelar_subida");
    const modal = document.querySelector("#modal");

    btnAbrirModal.addEventListener("click",()=>{modal.showModal();});
    btnCerrarModal.addEventListener("click",()=>{modal.close();});
}

function expandirImagen() {
  const imagen = document.querySelector('.imagen_perfil');
  imagen.classList.toggle('expandida');
}

