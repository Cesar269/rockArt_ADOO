function habilita() {

    var fecha, url, traductor, correo, cancion, boton;

    fecha = document.getElementById("fecha");
    url = document.getElementById("url");
    traductor = document.getElementById("traductor");
    correo = document.getElementById("correo");
    cancion = document.getElementById("cancion");
    boton = document.getElementById("modificar");

    fecha.disabled = false;
    url.disabled = false;
    traductor.disabled = false;
    correo.disabled = false;
    cancion.disabled = false;
    boton.disabled = false;


}