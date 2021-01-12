<%-- 
    Document   : EliminarArtistaBanda
    Created on : 10/01/2021, 05:08:07 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Artista Banda</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id3").toString());
            String NombreCompleto = request.getParameter("eliminar_artista_banda");
            boolean bandera = false;
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            Statement sta3 = null;
            ResultSet r = null;
            ResultSet s = null;

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
                r = sta.executeQuery("select Artista.Nombre, Artista.Apellido_Paterno, Artista.Apellido_Materno from Artista inner join Registro_Banda_Artistas  where Registro_Banda_Artistas.Id_Banda = " + id + "  and Artista.Id = Registro_Banda_Artistas.Id_Artista;");
                while (r.next()) {
                    String Nombre = r.getString("Nombre");
                    String Apellido_Paterno = r.getString("Apellido_Paterno");
                    String Apellido_Materno = r.getString("Apellido_Materno");
                    if ((Nombre + " " + Apellido_Paterno + " " + Apellido_Materno).equalsIgnoreCase(NombreCompleto)) {
                        bandera = true;
                    }
                }

                if (bandera) {
                    s = sta2.executeQuery("select Id,Nombre,Apellido_Paterno,Apellido_Materno from Artista;");
                    while (s.next()) {
                        int Id = s.getInt("Id");
                        String Nombre = s.getString("Nombre");
                        String Apellido_Paterno = s.getString("Apellido_Paterno");
                        String Apellido_Materno = s.getString("Apellido_Materno");
                        if ((Nombre + " " + Apellido_Paterno + " " + Apellido_Materno).equalsIgnoreCase(NombreCompleto)) {
                            sta3.executeUpdate("delete  from Registro_Banda_Artistas where Id_Artista =" + Id + ";"); //aqui no lleva el * en el delete
                            out.print("<script> alert('Artista eliminado de la banda exitosamente'); </script>");
                            out.println("<script>window.location='ConsultarBandas.jsp';</script>");
                        }
                    }
                } else {
                    out.print("<script> alert('El artista que desea eliminar no pertenece a la banda'); </script>");
                    out.println("<script>window.location='ConsultarBandas.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
            con.close();
        %>
    </body>
</html>
