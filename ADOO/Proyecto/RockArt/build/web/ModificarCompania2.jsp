<%-- 
    Document   : ModificarCompania2
    Created on : 29/12/2020, 05:56:13 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Compañia</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement sta = null;
            String id = request.getParameter("id");
            String Nombre = request.getParameter("nombre");
            String Direccion = request.getParameter("direccion");
            String Sitio_web = request.getParameter("sitio_web");
            String Telefono = request.getParameter("numero");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                sta.executeUpdate("update Compania_de_grabacion set Nombre='" + Nombre + "',Direccion='" + Direccion + "',Sitio_web='" + Sitio_web + "',Telefono=" + Telefono + " where Id = " + id + ";");
                out.println("<script>alert('Compañia Modificada.');</script>");
                out.println("<script>window.location='ConsultarCompanias.jsp';</script>");
            } catch (SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>
