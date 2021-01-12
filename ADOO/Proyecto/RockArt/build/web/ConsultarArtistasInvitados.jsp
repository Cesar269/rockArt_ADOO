<%-- 
    Document   : ConsultarArtistasInvitados
    Created on : 9/01/2021, 06:26:26 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Artistas Invitados</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
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
                r = sta.executeQuery("select Artistas_invitados.Id, Musico.Nombre as Musico, Canciones.Nombre as Cancion from Artistas_invitados inner join Musico inner join Canciones where Artistas_invitados.Id_musico = Musico.Id and Artistas_invitados.Id_Cancion = Canciones.Id order by Artistas_invitados.Id;");

        %>


        <table border = '1' > 
            <tr>
                <%                    if (id == 1) {
                %>
                <td>Id</td>
                <% } %>
                <td>Músico</td><td>Canción</td>
                <%if (id == 1) {  %>
                <td>Modificar</td>
                <% } %>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Musico = r.getString("Musico");
                    String Cancion = r.getString("Cancion");
            %>
            <tr>
                <%
                    if (id == 1) {
                %>
            <form name="modificar" method="post" action="ModificarArtistaInvitado.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"></td>
                <td> <%=Musico%> </td>
                <td> <%=Cancion%></td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar'/> </td>
            </form>
            <%
            } else {
            %>
            <td> <%=Musico%> </td>
            <td> <%=Cancion%></td>    <%
                }
            %>
        </tr>

        <% } %>
    </table>
    <%
        } catch (SQLException error) {
            out.print(error.toString());
        }
        con.close();
    %>

    <%
        if (id == 1) {
    %>
    <h1>Borrar un artista invitado</h1>


    <form name="borrar_artista_invitado" method="post" action="BorrarArtistaInvitado.jsp">
        Ingrese el número del artista invitado a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required  onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Artista Invitado"/>
    </form>
    <% }%>
</body>
</html>
