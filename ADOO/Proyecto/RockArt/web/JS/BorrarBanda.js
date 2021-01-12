function borra()
{

    var result = confirm("¿Desea borrar esta banda?");
    if ((result === true))
    {
        alert("Banda borrada");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Banda no borrada");
        window.location = 'ConsultarBandas.jsp';
    }
}