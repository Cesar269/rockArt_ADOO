<%-- 
    Document   : Albums
    Created on : 3/01/2021, 05:55:04 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Álbums</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Álbums</h1>

        <form name="agregar" method="post" action="AgregarAlbum.jsp">
            <input type="submit" name="agregar_album" id="agregar_album" value="Agregar Álbum"/>
        </form>

        <form name="consultar_albums" method="post" action="ConsultarAlbums.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar albums para modificación");
                } else {
                    out.print("Consultar albums");
                } %>" id="<% if (id == 1) {
                        out.print("Consultar albums para modificación");
                    } else {
                        out.print("Consultar albums");
                    } %>" value="<% if (id == 1) {
                        out.print("Consultar albums para modificación");
                    } else {
                        out.print("Consultar albums");
                    }%>"/>
        </form>

    </body>
</html>
