function borra()
{

    var result = confirm("¿Desea borrar este album?");
    if ((result === true))
    {
        alert("Album Borrado");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Album no borrado");
        window.location = 'ConsultarAlbums.jsp';
    }
}