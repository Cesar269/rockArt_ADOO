<%-- 
    Document   : AgregarCompania2
    Created on : 29/12/2020, 03:28:06 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Compañia</title>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("nombre");
            String Direccion = request.getParameter("direccion");
            String Sitio_web = request.getParameter("sitio_web");
            String Telefono = request.getParameter("numero");
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
                sta.executeUpdate("insert into Compania_de_grabacion (Nombre,Direccion,Sitio_web,Telefono) values ('" + Nombre + "','" + Direccion + "','" + Sitio_web + "'," + Telefono + ");");
                out.print("<script> alert('Compañia agregada exitosamente'); </script>");
                out.println("<script>window.location='ConsultarCompanias.jsp';</script>");
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
