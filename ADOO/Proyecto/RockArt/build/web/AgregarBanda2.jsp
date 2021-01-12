<%-- 
    Document   : AgregarBanda2
    Created on : 29/12/2020, 09:53:58 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Banda</title>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("nombre");
            Connection conn = null;
            Statement sta = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = conn.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            try {
                sta.executeUpdate("insert into Banda (Nombre) values ('" + Nombre + "');"
                );
                out.print("<script> alert('Banda agregada exitosamente'); </script>");
                out.println("<script>window.location='ConsultarBandas.jsp';</script>");
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
