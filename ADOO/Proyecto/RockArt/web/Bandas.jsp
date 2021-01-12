<%-- 
    Document   : Bandas
    Created on : 29/12/2020, 09:27:40 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bandas</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
        %>
        <h1>Bandas</h1>

        <form name="agregar" method="post" action="AgregarBanda.jsp">
            <input type="submit" name="agregar_banda" id="agregar_banda" value="Agregar Banda"/>
        </form>

        <form name="consultar_bandas" method="post" action="ConsultarBandas.jsp">
            <input type="submit" name="<% if (id == 1) {
                    out.print("Consultar bandas para modificación");
                } else {
                    out.print("Consultar bandas");
                } %>" id="<% if (id == 1) {
                        out.print("Consultar bandas para modificación");
                    } else {
                        out.print("Consultar bandas");
                    } %>" value="<% if (id == 1) {
                            out.print("Consultar bandas para modificación");
                        } else {
                            out.print("Consultar bandas");
                        }%>"/>
        </form>
    </body>
</html>
