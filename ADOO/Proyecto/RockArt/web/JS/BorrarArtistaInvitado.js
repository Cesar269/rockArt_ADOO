function borra()
{

    var result = confirm("¿Desea borrar este artista invitado?");
    if ((result === true))
    {
        alert("Artista Invitado Borrado");
        document.getElementById("borrar").submit();
    } else
    {
        alert("Artista Invitado no borrado");
        window.location = 'ConsultarArtistasInvitados.jsp';
    }
}