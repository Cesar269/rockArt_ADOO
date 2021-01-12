<%-- 
    Document   : ModificarTablatura2
    Created on : 9/01/2021, 03:05:10 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Tablatura</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            ResultSet r = null;
            String id = request.getParameter("id");
            String Fecha = request.getParameter("fecha");
            String URL = request.getParameter("url");
            URL = "Tablaturas/" + URL;
            String Traductor = request.getParameter("traductor");
            String Correo = request.getParameter("correo");
            String Cancion = request.getParameter("cancion");
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
                sta2 = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta2.executeQuery("select Id from Canciones where Nombre = '" + Cancion + "';");
                if (r.next()) {
                    sta.executeUpdate("update Tablatura set Fecha='" + Fecha + "',URL='" + URL + "',Traductor='" + Traductor + "',Correo_del_traductor='" + Correo + "',Id_Cancion=" + r.getInt("Id") + " where Id = " + id + ";");
                    out.println("<script>alert('Tablatura modificada.');</script>");
                    out.println("<script>window.location='ConsultarTablaturas.jsp';</script>");

                } else {
                    out.println("<script>alert('Lo sentimos, ha habido un error. Vuelva a intentarlo');</script>");
                    out.println("<script>window.location='ConsultarTablaturas.jsp';</script>");
                }
            } catch (SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>
