<%-- 
    Document   : Artistas
    Created on : 28/12/2020, 06:43:21 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artista</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Artistas</h1>

        <form name="agregar" method="post" action="AgregarArtista.jsp">
            <input type="submit" name="agregar_artista" id="agregar_artista" value="Agregar Artista"/>
        </form>

        <form name="consultar_artistas" method="post" action="ConsultarArtistas.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar artistas para modificación");
                } else {
                    out.print("Consultar artistas");
                } %>" id="<% if (id == 1) {
                    out.print("Consultar artistas para modificación");
                } else {
                    out.print("Consultar artistas");
                } %>" value="<% if (id == 1) {
                    out.print("Consultar artistas para modificación");
                } else {
                    out.print("Consultar artistas");
                }%>"/>
        </form>

    </body>
</html>
