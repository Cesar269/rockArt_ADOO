<%-- 
    Document   : ModificarArtista2
    Created on : 28/12/2020, 11:24:32 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Artista</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement sta = null;
            String id = request.getParameter("id");
            String Nombre = request.getParameter("nombre");
            String Apellido_Paterno = request.getParameter("apellido_paterno");
            String Apellido_Materno = request.getParameter("apellido_materno");
            String Genero = request.getParameter("genero");
            String Ciudad_de_nacimiento = request.getParameter("ciudad_de_nacimiento");
            String Biografia = request.getParameter("biografia");
            String Sitio_web = request.getParameter("sitio_web");

            if (Genero.equals("F") || Genero.equals("M")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                    sta = con.createStatement();
                } catch (SQLException error) {
                    out.print(error.toString());
                }

                try {
                    sta.executeUpdate("update Artista set Nombre='" + Nombre + "',Apellido_Paterno='" + Apellido_Paterno + "',Apellido_Materno='" + Apellido_Materno + "',Genero='" + Genero + "',Ciudad_de_nacimiento='" + Ciudad_de_nacimiento + "',Biografia='" + Biografia + "',Sitio_web='" + Sitio_web + "' where Id = " + id + ";");
                    out.println("<script>alert('Artista Modificado.');</script>");
                    out.println("<script>window.location='ConsultarArtistas.jsp';</script>");
                } catch (SQLException error) {
                    out.println(error.toString());
                }
            } else {
                out.println("<script>alert('Escriba la letra F para femenino o M para Masculino en el campo de Genero');</script>");
                out.println("<script>window.location='ConsultarArtistas.jsp';</script>");
            }


        %>
    </body>
</html>
