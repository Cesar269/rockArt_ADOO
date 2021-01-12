<%-- 
    Document   : CompaniasDeGrabacion
    Created on : 29/12/2020, 03:06:10 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compañias de grabación</title>
    </head>
    <body>
        <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Compañias de grabación</h1>

        <form name="agregar" method="post" action="AgregarCompania.jsp">
            <input type="submit" name="agregar_compania" id="agregar_compania" value="Agregar Compañia"/>
        </form>

        <form name="consultar_compania" method="post" action="ConsultarCompanias.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar compañias para modificación");
                } else {
                    out.print("Consultar compañias");
                } %>" id="<% if (id == 1) {
                    out.print("Consultar compañias para modificación");
                } else {
                    out.print("Consultar compañias");
                } %>" value="<% if (id == 1) {
                    out.print("Consultar compañias para modificación");
                } else {
                    out.print("Consultar compañias");
                }%>"/>
        </form>

    </body>
    </body>
</html>
