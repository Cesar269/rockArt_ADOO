<%-- 
    Document   : Jefe
    Created on : 26/12/2020, 06:59:13 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido jefe</title>
        <script src="JS/Jefe.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Soy el jefe xdxdxd</h1>

        <form name="formulario" method="post" action="CerrarSesion.jsp">
            <input type="submit" name="cierra" value="Cerrar sesión"/> 
        </form>

        <form name="alta_conductor" method="post" action="AgregarConductor.jsp">
            <input type="submit" name="alta" id="alta" value="Agregar Conductor"/>
        </form>

        <form name="consulta_conductores" method="post" action="ConsultarConductores.jsp">
            <input type="submit" name="consultar" id="consultar" value="Consultar Conductores"/>
        </form>

        <form name="artistas" method="post" action="Artistas.jsp">
            <input type="submit" name="artistas" id="artistas" value="Artistas"/>
        </form>

        <form name="musicos" method="post" action="Musicos.jsp">
            <input type="submit" name="musicos" id="musicos" value="Musicos"/>
        </form>

        <form name="Companias" method="post" action="CompaniasDeGrabacion.jsp">
            <input type="submit" name="companias" id="companias" value="Compañias de grabación"/>
        </form>

        <form name="bandas" method="post" action="Bandas.jsp">
            <input type="submit" name="bandas" id="bandas" value="Bandas"/>
        </form>

        <form name="album" method="post" action="Albums.jsp">
            <input type="submit" name="albums" id="albums" value="Albums"/>
        </form>

        <form name="canciones" method="post" action="Canciones.jsp">
            <input type="submit" name="canciones" id="canciones" value="Canciones"/>
        </form>

        <form name="canciones" method="post" action="Tablaturas.jsp">
            <input type="submit" name="tablaturas" id="canciones" value="Tablaturas"/>
        </form>

        <form name="invitados" method="post" action="ArtistasInvitados.jsp">
            <input type="submit" name="invitados" id="invitados" value="Artistas Invitados"/>
        </form>
        
        <br/>
        <br/>
        <form name="informacion" method="post" action="InformacionGeneral.jsp">
            <input type="submit" name="informacion" id="informacion" value="Consultar Informacion General"/>
        </form>
    </body>
</html>
