function borra()
{

    var result = confirm("¿Desea borrar esta tablatura?");
    if ((result === true))
    {
        alert("Tablatura borrada");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Tablatura no borrada");
        window.location = 'ConsultarTablaturas.jsp';
    }
}