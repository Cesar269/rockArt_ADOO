function habilita(){
    
    var nombre,apellido_paterno,apellido_materno,instrumento,ciudad_de_nacimiento;
    
    nombre = document.getElementById("nombre");
    apellido_paterno = document.getElementById("apellido_paterno");
    apellido_materno = document.getElementById("apellido_materno");
    instrumento = document.getElementById("instrumento");
    ciudad_de_nacimiento = document.getElementById("ciudad_de_nacimiento");
    boton = document.getElementById("modificar");
    
    nombre.disabled = false;
    apellido_paterno.disabled = false;
    apellido_materno.disabled = false;
    instrumento.disabled = false;
    ciudad_de_nacimiento.disabled = false;
    boton.disabled = false;
    
    
}