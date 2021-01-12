function borra()
{

    var result = confirm("¿Desea borrar este Conductor?");
    if ((result === true))
    {
        alert("Conductor borrado");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Conductor no borrado");
        window.location = 'ConsultarConductores.jsp';
    }
}