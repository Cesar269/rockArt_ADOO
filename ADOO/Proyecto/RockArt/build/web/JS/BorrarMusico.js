function borra()
{

    var result = confirm("¿Desea borrar este Musico?");
    if ((result === true))
    {
        alert("Musico borrado");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Musico no borrado");
        window.location = 'ConsultarMusicos.jsp';
    }
}