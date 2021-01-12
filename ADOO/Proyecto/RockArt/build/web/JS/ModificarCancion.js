function habilita() {

    var nombre, duracion, album, numero, boton;

    nombre = document.getElementById("nombre");
    duracion = document.getElementById("duracion");
    album = document.getElementById("album");
    numero = document.getElementById("numero");
    boton = document.getElementById("modificar");

    nombre.disabled = false;
    duracion.disabled = false;
    album.disabled = false;
    numero.disabled = false;
    boton.disabled = false;
}