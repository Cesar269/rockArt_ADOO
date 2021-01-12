function habilita() {

    var artista_invitado, cancion, boton;

    artista_invitado = document.getElementById("artista_invitado");
    cancion = document.getElementById("cancion");
    boton = document.getElementById("modificar");

    artista_invitado.disabled = false;
    cancion.disabled = false;
    boton.disabled = false;


}