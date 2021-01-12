<%-- 
    Document   : AgregarConductor2
    Created on : 26/12/2020, 08:36:22 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Conductor</title>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("nombre");
            String Apellido_Paterno = request.getParameter("apellido_paterno");
            String Apellido_Materno = request.getParameter("apellido_materno");
            String Genero = request.getParameter("genero");
            String Ciudad_de_nacimiento = request.getParameter("ciudad_de_nacimiento");
            String Correo_electronico = request.getParameter("correo");
            //int Telefono = Integer.parseInt(request.getParameter("numero"));
            String Telefono = request.getParameter("numero");
            String Contrasenia = request.getParameter("contrasenia");
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
                sta.executeUpdate("insert into Usuarios (Nombre,Apellido_Paterno,Apellido_Materno,Genero,Ciudad_de_nacimiento,Correo_electronico,Telefono,Contrasenia) values ('" + Nombre + "','" + Apellido_Paterno + "','" + Apellido_Materno + "','" + Genero + "','" + Ciudad_de_nacimiento + "','" + Correo_electronico + "'," + Telefono +",'" +Contrasenia+ "');");
                out.print("<script> alert('Conductor agregado exitosamente'); </script>");
                out.println("<script>window.location='Jefe.jsp';</script>");
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
