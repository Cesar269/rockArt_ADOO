<%-- 
    Document   : ArtistasInvitados
    Created on : 9/01/2021, 06:19:18 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artistas invitados</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Artistas Invitados</h1>

        <form name="agregar" method="post" action="AgregarArtistaInvitado.jsp">
            <input type="submit" name="agregar_artista_invitado" id="agregar_artista_invitado" value="Agregar Artista Invitado"/>
        </form>

        <form name="consultar_artista_invitado" method="post" action="ConsultarArtistasInvitados.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar artistas invitados para modificación");
                } else {
                    out.print("Consultar artistas invitados");
                } %>" id="<% if (id == 1) {
                        out.print("Consultar artistas invitados para modificación");
                    } else {
                        out.print("Consultar artistas invitados");
                    } %>" value="<% if (id == 1) {
                            out.print("Consultar artistas invitados para modificación");
                        } else {
                            out.print("Consultar artistas invitados");
                        }%>"/>
        </form>

    </body>
</html>
