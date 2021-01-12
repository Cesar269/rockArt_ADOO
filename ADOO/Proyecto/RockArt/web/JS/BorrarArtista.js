function borra()
{

    var result = confirm("¿Desea borrar este Artista?");
    if ((result === true))
    {
        alert("Artista borrado");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Artista no borrado");
        window.location = 'ConsultarArtistas.jsp';
    }
}