<%-- 
    Document   : Canciones
    Created on : 4/01/2021, 05:45:04 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Canciones</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Canciones</h1>

        <form name="agregar" method="post" action="AgregarCancion.jsp">
            <input type="submit" name="agregar_cancion" id="agregar_cancion" value="Agregar Canción"/>
        </form>

        <form name="consultar_canciones" method="post" action="ConsultarCanciones.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar canciones para modificación");
                } else {
                    out.print("Consultar canciones");
                } %>" id="<% if (id == 1) {
                        out.print("Consultar canciones para modificación");
                    } else {
                        out.print("Consultar canciones");
                    } %>" value="<% if (id == 1) {
                            out.print("Consultar canciones para modificación");
                        } else {
                            out.print("Consultar canciones");
                        }%>"/>
        </form>

    </body>
</html>
