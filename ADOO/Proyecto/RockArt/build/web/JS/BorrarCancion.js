function borra()
{

    var result = confirm("¿Desea borrar ésta canción?");
    if ((result === true))
    {
        alert("Canción Borrada");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Canción no borrada");
        window.location = 'ConsultarCanciones.jsp';
    }
}