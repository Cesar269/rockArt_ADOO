<%-- 
    Document   : AgregarArtistaInvitado2
    Created on : 9/01/2021, 06:34:47 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Artista Invitado</title>
    </head>
    <body>
        <%
            String Musico = request.getParameter("artista_invitado");
            String Cancion = request.getParameter("cancion");
            Connection conn = null;
            Statement sta = null;
            Statement sta2 = null;
            Statement sta3 = null;
            ResultSet r = null;
            ResultSet s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = conn.createStatement();
                sta2 = conn.createStatement();
                sta3 = conn.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            try {
                r = sta.executeQuery("select Id from Musico where Nombre = '" + Musico + "';");
                s = sta2.executeQuery("select Id from Canciones where Nombre = '" + Cancion + "';");
                if (r.next() && s.next()) {
                    sta.executeUpdate("insert into Artistas_invitados (Id_Musico,Id_Cancion) values (" + r.getInt("Id") + "," + s.getInt("Id") + ");"
                    );
                    out.print("<script> alert('Artista Invitado agregado exitosamente'); </script>");
                    out.println("<script>window.location='ConsultarArtistasInvitados.jsp';</script>");
                } else {
                    out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                    out.println("<script>window.location='AgregarArtistaInvitado.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
