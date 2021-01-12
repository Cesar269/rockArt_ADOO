<%-- 
    Document   : ModificarMusico2
    Created on : 29/12/2020, 02:12:11 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Músico</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement sta = null;
            String id = request.getParameter("id");
            String Nombre = request.getParameter("nombre");
            String Apellido_Paterno = request.getParameter("apellido_paterno");
            String Apellido_Materno = request.getParameter("apellido_materno");
            String Instrumento = request.getParameter("instrumento");
            String Ciudad_de_nacimiento = request.getParameter("ciudad_de_nacimiento");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                sta.executeUpdate("update Musico set Nombre='" + Nombre + "',Apellido_Paterno='" + Apellido_Paterno + "',Apellido_Materno='" + Apellido_Materno + "',Instrumento='" + Instrumento + "',Ciudad_de_nacimiento='" + Ciudad_de_nacimiento + "' where Id = " + id + ";");
                out.println("<script>alert('Conductor Modificado.');</script>");
                out.println("<script>window.location='ConsultarMusicos.jsp';</script>");
            } catch (SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>
