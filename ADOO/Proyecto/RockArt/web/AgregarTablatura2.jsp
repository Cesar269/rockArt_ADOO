<%-- 
    Document   : AgregarTablatura2
    Created on : 9/01/2021, 11:04:14 AM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Tablatura</title>
    </head>
    <body>
        <%
            String Fecha = request.getParameter("fecha");
            String URL = request.getParameter("url");
            URL = "Tablaturas/" + URL;
            String Traductor = request.getParameter("traductor");
            String Correo = request.getParameter("correo");
            String Cancion = request.getParameter("cancion");
            Connection conn = null;
            Statement sta = null;
            ResultSet r = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = conn.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            try {
                r = sta.executeQuery("select Id from Canciones where Nombre = '" + Cancion + "';");
                if (r.next()) {
                    int Id_Cancion = r.getInt("Id");
                    sta.executeUpdate("insert into Tablatura (Fecha,URL,Traductor,Correo_del_traductor,Id_Cancion) values ('" + Fecha + "','" + URL + "','" + Traductor + "','" + Correo + "'," + Id_Cancion + ");"
                    );
                    out.print("<script> alert('Tablatura agregada exitosamente'); </script>");
                    out.println("<script>window.location='ConsultarTablaturas.jsp';</script>");
                } else {
                    out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                    out.println("<script>window.location='ConsultarTablaturas.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
