<%-- 
    Document   : AgregarArtista2
    Created on : 28/12/2020, 07:08:43 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Artista</title>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("nombre");
            String Apellido_Paterno = request.getParameter("apellido_paterno");
            String Apellido_Materno = request.getParameter("apellido_materno");
            String Genero = request.getParameter("genero");
            String Ciudad_de_nacimiento = request.getParameter("ciudad_de_nacimiento");
            String Biografia = request.getParameter("biografia");
            String Sitio_web = request.getParameter("sitio_web");
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
                sta.executeUpdate("insert into Artista (Nombre,Apellido_Paterno,Apellido_Materno,Genero,Ciudad_de_nacimiento,Biografia,Sitio_web) values ('" + Nombre + "','" + Apellido_Paterno + "','" + Apellido_Materno + "','" + Genero + "','" + Ciudad_de_nacimiento + "','" + Biografia + "','" + Sitio_web + "');");
                out.print("<script> alert('Artista agregado exitosamente'); </script>");
                out.println("<script>window.location='ConsultarArtistas.jsp';</script>");
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
