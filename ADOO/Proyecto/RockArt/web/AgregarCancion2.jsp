<%-- 
    Document   : AgregarCancion2
    Created on : 4/01/2021, 06:05:12 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Canción</title>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("nombre");
            String Duracion = request.getParameter("duracion");
            String Album = request.getParameter("album");
            String Pistas = request.getParameter("numero");
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
                r = sta.executeQuery("select Id from Album where Nombre = '" + Album + "';");
                if (r.next()) {
                    int Id_Album = r.getInt("Id");
                    sta.executeUpdate("insert into Canciones (Nombre,Duracion,Id_Album,Numero_de_pista_del_album) values ('" + Nombre + "','" + Duracion + "'," + Id_Album + "," + Pistas + ");"
                    );
                    out.print("<script> alert('Canción agregada exitosamente'); </script>");
                    out.println("<script>window.location='ConsultarCanciones.jsp';</script>");

                } else {
                    out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                    out.println("<script>window.location='AgregarCancion.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
