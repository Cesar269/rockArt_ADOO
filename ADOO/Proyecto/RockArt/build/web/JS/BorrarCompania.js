function borra()
{

    var result = confirm("¿Desea borrar esta compañia?");
    if ((result === true))
    {
        alert("Compañia borrada");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Compañia no borrada");
        window.location = 'ConsultarCompanias.jsp';
    }
}