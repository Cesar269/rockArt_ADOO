function habilita() {

    var nombre, anio, pistas, banda, compania, imagen_de_portada, imagen_de_contraportada, boton;

    nombre = document.getElementById("nombre");
    anio = document.getElementById("anio");
    pistas = document.getElementById("numero");
    banda = document.getElementById("banda");
    compania = document.getElementById("compania");
    imagen_de_portada = document.getElementById("imagen_de_portada");
    imagen_de_contraportada = document.getElementById("imagen_de_contraportada");
    boton = document.getElementById("modificar");

    nombre.disabled = false;
    anio.disabled = false;
    pistas.disabled = false;
    banda.disabled = false;
    compania.disabled = false;
    imagen_de_portada.disabled = false;
    imagen_de_contraportada.disabled = false;
    boton.disabled = false;


}