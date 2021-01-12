<%-- 
    Document   : ModificarCancion2
    Created on : 8/01/2021, 09:40:58 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Canción</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            ResultSet r = null;
            String id = request.getParameter("id");
            String Cancion = request.getParameter("nombre");
            String Duracion = request.getParameter("duracion");
            String Album = request.getParameter("album");
            String Pistas = request.getParameter("numero");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
                sta2 = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta2.executeQuery("select Id from Album where Nombre = '" + Album + "';");
                if (r.next()) {
                    sta.executeUpdate("update Canciones set Nombre='" + Cancion + "',Duracion='" + Duracion + "',Id_Album=" + r.getInt("Id") + ",Numero_de_pista_del_album=" + Pistas + " where Id = " + id + ";");
                    out.println("<script>alert('Canción Modificada.');</script>");
                    out.println("<script>window.location='ConsultarCanciones.jsp';</script>");

                } else {
                    out.println("<script>alert('Lo sentimos, ha habido un error. Vuelva a intentarlo');</script>");
                    out.println("<script>window.location='ConsultarCanciones.jsp';</script>");
                }
            } catch (SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>
