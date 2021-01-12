function habilita(){
    
    var nombre,apellido_paterno,apellido_materno,genero,ciudad_de_nacimiento,correo,telefono,contrasenia,boton;
    
    nombre = document.getElementById("nombre");
    apellido_paterno = document.getElementById("apellido_paterno");
    apellido_materno = document.getElementById("apellido_materno");
    genero = document.getElementById("genero");
    ciudad_de_nacimiento = document.getElementById("ciudad_de_nacimiento");
    correo = document.getElementById("correo");
    telefono = document.getElementById("numero");
    contrasenia = document.getElementById("contrasenia");
    boton = document.getElementById("modificar");
    
    nombre.disabled = false;
    apellido_paterno.disabled = false;
    apellido_materno.disabled = false;
    genero.disabled = false;
    ciudad_de_nacimiento.disabled = false;
    correo.disabled = false;
    telefono.disabled = false;
    contrasenia.disabled = false;
    boton.disabled = false;
    
    
}