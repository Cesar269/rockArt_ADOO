<%-- 
    Document   : VerCanciones
    Created on : 10/01/2021, 07:37:51 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver canciones</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id_album").toString());
            Connection con = null;
            Statement sta = null;
            ResultSet r = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta.executeQuery("select * from Canciones where Id_Album = " + id + ";");

        %>
        <table border = '1' > 
            <tr>
                <td>Nombre</td><td>Duración</td><td>Número de pista en el álbum</td>
            </tr>
            <%            while (r.next()) {
                    String Cancion = r.getString("Nombre");
                    String Duracion = r.getString("Duracion");
                    int Pistas = r.getInt("Numero_de_pista_del_album");
            %>
            <tr>
                <td> <%=Cancion%> </td>
                <td> <%=Duracion%></td>
                <td> <%=Pistas%> </td>
            </tr>
            <% } %>
        </table>
        <%            } catch (SQLException error) {
                out.print(error.toString());
            }
            con.close();
        %>
    </body>
</html>
