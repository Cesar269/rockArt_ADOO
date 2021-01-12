<%-- 
    Document   : Musicos
    Created on : 29/12/2020, 12:51:14 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Musicos</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Musicos</h1>

        <form name="agregar" method="post" action="AgregarMusico.jsp">
            <input type="submit" name="agregar_musico" id="agregar_musico" value="Agregar Musico"/>
        </form>

        <form name="consultar_musicos" method="post" action="ConsultarMusicos.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar musicos para modificación");
                } else {
                    out.print("Consultar Musicos");
                } %>" id="<% if (id == 1) {
                    out.print("Consultar Musicos para modificación");
                } else {
                    out.print("Consultar Musicos");
                } %>" value="<% if (id == 1) {
                    out.print("Consultar musicos para modificación");
                } else {
                    out.print("Consultar musicos");
                }%>"/>
        </form>

    </body>
</html>
