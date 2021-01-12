<%-- 
    Document   : AgregarMusico2
    Created on : 29/12/2020, 01:27:03 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Musico</title>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("nombre");
            String Apellido_Paterno = request.getParameter("apellido_paterno");
            String Apellido_Materno = request.getParameter("apellido_materno");
            String Instrumento = request.getParameter("instrumento");
            String Ciudad_de_nacimiento = request.getParameter("ciudad_de_nacimiento");
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
                sta.executeUpdate("insert into Musico (Nombre,Apellido_Paterno,Apellido_Materno,Instrumento,Ciudad_de_nacimiento) values ('" + Nombre + "','" + Apellido_Paterno + "','" + Apellido_Materno + "','" + Instrumento + "','" + Ciudad_de_nacimiento + "');"
                );
                out.print("<script> alert('Músico agregado exitosamente'); </script>");
                out.println("<script>window.location='ConsultarMusicos.jsp';</script>");
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
