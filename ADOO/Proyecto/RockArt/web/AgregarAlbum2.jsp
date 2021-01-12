<%-- 
    Document   : AgregarAlbum2
    Created on : 3/01/2021, 07:16:11 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Álbum</title>
    </head>
    <body>
        <%
            String Nombre = request.getParameter("nombre");
            String Anio = request.getParameter("anio");
            String Pistas = request.getParameter("numero");
            String Banda = request.getParameter("banda");
            String Compania = request.getParameter("compania");
            String Portada = request.getParameter("portada");
            String Contraportada = request.getParameter("contraportada");
            String URLPortada = "Imagenes de un album/" + Portada;
            String URLContraportada = "Imagenes de un album/" + Contraportada;
            Connection conn = null;
            Statement sta = null;
            ResultSet r = null;
            ResultSet s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = conn.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            try {
                r = sta.executeQuery("select Id from Banda where Nombre = '" + Banda + "';");
                if (r.next()) {
                    int Id_Banda = r.getInt("Id");
                    s = sta.executeQuery("select Id from Compania_de_grabacion where Nombre = '" + Compania + "';");
                    if (s.next()) {
                        int Id_Compania = s.getInt("Id");
                        sta.executeUpdate("insert into Album (Nombre,Anio,Numero_de_pistas,Id_Banda,Id_Compania_Grabacion,Imagen_de_portada,Imagen_de_contraportada) values ('" + Nombre + "'," + Anio + "," + Pistas + "," + Id_Banda + "," + Id_Compania + ",'" + URLPortada + "','" + URLContraportada + "');"
                        );
                        out.print("<script> alert('Álbum agregado exitosamente'); </script>");
                        out.println("<script>window.location='ConsultarAlbums.jsp';</script>");
                    } else {
                        out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                        out.println("<script>window.location='AgregarAlbum.jsp';</script>");
                    }
                } else {
                    out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                    out.println("<script>window.location='AgregarAlbum.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
    </body>
</html>
