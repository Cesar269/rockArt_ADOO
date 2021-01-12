function habilita() {

    var nombre, direccion, sitio_web, telefono, boton;

    nombre = document.getElementById("nombre");
    direccion = document.getElementById("direccion");
    sitio_web = document.getElementById("sitio_web");
    telefono = document.getElementById("numero");
    boton = document.getElementById("modificar");

    nombre.disabled = false;
    direccion.disabled = false;
    sitio_web.disabled = false;
    telefono.disabled = false;
    boton.disabled = false;


}