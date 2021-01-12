<%-- 
    Document   : AgregarArtistaInvitado
    Created on : 9/01/2021, 06:24:21 PM
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
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            ResultSet r = null;
            ResultSet s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
                sta2 = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta.executeQuery("select Nombre from Musico order by Nombre;"); //No está validado para que dos bandas tengan el mismo nombre, así que por ende no acepta que dos bandas tengan el mismo nombre.
                s = sta2.executeQuery("select Nombre from Canciones order by Nombre;");
        %>
        <h1>Agregar Artista Invitado</h1>
        <form name="formulario" method="post" action="AgregarArtistaInvitado2.jsp">
            Selecciona el músico que és artista invitado: 
            <select id="artista_invitado" name="artista_invitado" required="required">
                <%
                    while (r.next()) {
                        String Nombre = r.getString("Nombre");
                %>
                <option value="<%=Nombre%>"><%=Nombre%></option> 
                <%
                    }
                %>
            </select> 
            <br>
            <br>
            Selecciona la canción en la que és artista invitado:
            <select id="cancion" name="cancion" required="required">
                <%
                    while (s.next()) {
                        String Nombre = s.getString("Nombre");
                %>
                <option value="<%=Nombre%>"><%=Nombre%></option> 
                <%
                    }
                %>
            </select>
            <br>
            <br>
            <input type="submit" name="agregar" value="Agregar Artista Invitado"/> 
        </form>
        <%
            } catch (SQLException error) {
                out.print(error.toString());
            }
            con.close();
        %>
    </body>
</html>
