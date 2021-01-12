<%-- 
    Document   : ModificarAlbum2
    Created on : 4/01/2021, 12:57:20 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Album</title>
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
            String Nombre = request.getParameter("nombre");
            String Anio = request.getParameter("anio");
            String Pistas = request.getParameter("numero");
            String Banda = request.getParameter("banda");
            String Compania = request.getParameter("compania");
            String Portada = request.getParameter("imagen_de_portada");
            String Contraportada = request.getParameter("imagen_de_contraportada");
            String URLPortada = "Imagenes de un album/" + Portada;
            String URLContraportada = "Imagenes de un album/" + Contraportada;

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
                r = sta2.executeQuery("select Id from Banda where Nombre = '" + Banda + "';");
                s = sta3.executeQuery("select Id from Compania_de_grabacion where Nombre = '" + Compania + "';");
                if (r.next() && s.next()) {
                    sta.executeUpdate("update Album set Nombre='" + Nombre + "',Anio=" + Anio + ",Numero_de_pistas=" + Pistas + ",Id_Banda=" + r.getInt("Id") + ",Id_Compania_Grabacion=" + s.getInt("Id") + ",Imagen_de_portada='" + URLPortada + "',Imagen_de_contraportada='" + URLContraportada + "' where Id = " + id + ";");
                    out.println("<script>alert('Album Modificado.');</script>");
                    out.println("<script>window.location='ConsultarAlbums.jsp';</script>");

                } else {
                    out.println("<script>alert('Lo sentimos, ha habido un error. Vuelva a intentarlo');</script>");
                    out.println("<script>window.location='ConsultarAlbums.jsp';</script>");
                }
            } catch (SQLException error) {
                out.println(error.toString());
            }
        %>
    </body>
</html>
