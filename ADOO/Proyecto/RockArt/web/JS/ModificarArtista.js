function habilita(){
    
    var nombre,apellido_paterno,apellido_materno,genero,ciudad_de_nacimiento,biografia,sitio_web,boton;
    
    nombre = document.getElementById("nombre");
    apellido_paterno = document.getElementById("apellido_paterno");
    apellido_materno = document.getElementById("apellido_materno");
    genero = document.getElementById("genero");
    ciudad_de_nacimiento = document.getElementById("ciudad_de_nacimiento");
    biografia = document.getElementById("biografia");
    sitio_web = document.getElementById("sitio_web");
    boton = document.getElementById("modificar");
    
    nombre.disabled = false;
    apellido_paterno.disabled = false;
    apellido_materno.disabled = false;
    genero.disabled = false;
    ciudad_de_nacimiento.disabled = false;
    biografia.disabled = false;
    sitio_web.disabled = false;
    boton.disabled = false;
    
    
}