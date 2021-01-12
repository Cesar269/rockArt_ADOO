<%-- 
    Document   : ConsultarCanciones
    Created on : 4/01/2021, 05:48:03 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Canciones</title>
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
                r = sta.executeQuery("select Canciones.Id, Canciones.Nombre as Cancion, Canciones.Duracion, Album.Nombre as Album, Canciones.Numero_de_pista_del_album from Canciones inner join Album where Canciones.Id_Album = Album.Id;");

        %>


        <table border = '1' > 
            <tr>
                <%                    if (id == 1) {
                %>
                <td>Id</td>
                <% } %>
                <td>Nombre</td><td>Duración</td><td>Álbum</td><td>Número de pista en el álbum</td>
                <%if (id == 1) {  %>
                <td>Modificar</td>
                <% } %>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Cancion = r.getString("Cancion");
                    String Duracion = r.getString("Duracion");
                    String Album = r.getString("Album");
                    int Pistas = r.getInt("Numero_de_pista_del_album");
            %>
            <tr>
                <%
                    if (id == 1) {
                %>
            <form name="modificar" method="post" action="ModificarCancion.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"></td>
                <td> <%=Cancion%> </td>
                <td> <%=Duracion%></td>
                <td> <%=Album%></td>
                <td> <%=Pistas%> </td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar'/> </td>
            </form>
            <%
            } else {
            %>
            <td> <%=Cancion%> </td>
            <td> <%=Duracion%></td>
            <td> <%=Album%></td>
            <td> <%=Pistas%> </td>
            <%
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
    <h1>Borrar una canción</h1>


    <form name="borrar_cancion" method="post" action="BorrarCancion.jsp">
        Ingrese el número de la canción a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required  onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Canción"/>
    </form>
    <% }%>
</body>
</html>
