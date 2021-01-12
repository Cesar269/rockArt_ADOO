<%-- 
    Document   : Tablaturas
    Created on : 8/01/2021, 11:34:16 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tablaturas</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Tablaturas</h1>

        <form name="agregar" method="post" action="AgregarTablatura.jsp">
            <input type="submit" name="agregar_tablatura" id="agregar_tablatura" value="Agregar Tablatura"/>
        </form>

        <form name="consultar_tablaturas" method="post" action="ConsultarTablaturas.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar tablaturas para modificación");
                } else {
                    out.print("Consultar tablaturas");
                } %>" id="<% if (id == 1) {
                        out.print("Consultar tablaturas para modificación");
                    } else {
                        out.print("Consultar tablaturas");
                    } %>" value="<% if (id == 1) {
                            out.print("Consultar tablaturas para modificación");
                        } else {
                            out.print("Consultar tablaturas");
                        }%>"/>
        </form>

    </body>
</html>
