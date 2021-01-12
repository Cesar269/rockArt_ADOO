<%-- 
    Document   : ModificarArtistaInvitado2
    Created on : 9/01/2021, 07:30:25 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Artista Invitado</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            Statement sta3 = null;
            ResultSet r = null;
            ResultSet s = null;
            String id = request.getParameter("id");
            String Musico = request.getParameter("artista_invitado");
            String Cancion = request.getParameter("cancion");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
                sta2 = con.createStatement();
                sta3 = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta2.executeQuery("select Id from Musico where Nombre = '" + Musico + "';");
                s = sta3.executeQuery("select Id from Canciones where Nombre = '" + Cancion + "';");
                if (r.next() && s.next()) {
                    sta.executeUpdate("update Artistas_invitados set Id_musico=" + r.getInt("Id") + ",Id_Cancion=" + s.getInt("Id") + " where Id = " + id + ";");
                    out.println("<script>alert('Artista invitado modificado.');</script>");
                    out.println("<script>window.location='ConsultarArtistasInvitados.jsp';</script>");

                } else {
                    out.println("<script>alert('Lo sentimos, ha habido un error. Vuelva a intentarlo');</script>");
                    out.println("<script>window.location='ConsultarArtistasInvitados.jsp';</script>");
                }
            } catch (SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>
