<%-- 
    Document   : ConsultarArtistas
    Created on : 28/12/2020, 07:21:36 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar artistas</title>
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
                r = sta.executeQuery("select * from Artista;");

        %>


        <table border = '1' > 
            <tr>
                <%                    if (id == 1) {
                %>
                <td>Id</td>
                <% } %>
                <td>Nombre</td><td>Apellido Paterno</td><td>Apellido Materno</td><td>Genero</td><td>Ciudad de nacimiento</td><td>Biografía</td><td>Sitio web</td>
                <%if (id == 1) {  %>
                <td>Modificar</td>
                <% } %>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
                    String Apellido_Paterno = r.getString("Apellido_Paterno");
                    String Apellido_Materno = r.getString("Apellido_Materno");
                    String Genero = r.getString("Genero");
                    String Ciudad_de_nacimiento = r.getString("Ciudad_de_nacimiento");
                    String Biografia = r.getString("Biografia");
                    String Sitio_web = r.getString("Sitio_web");
            %>
            <tr>
                <%
                    if (id == 1) {
                %>
            <form name="modificar" method="post" action="ModificarArtista.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"</td>
                <td> <%=Nombre%> </td>
                <td> <%=Apellido_Paterno%></td>
                <td> <%=Apellido_Materno%></td>
                <td> <%if (Genero.equalsIgnoreCase("F")) {
                        out.print("Femenino");
                    } else {
                        out.print("Masculino");
                    }%> </td>
                <td> <%=Ciudad_de_nacimiento%> </td>
                <td> <%=Biografia%> </td>
                <td> <a href="<%=Sitio_web%>" target=" "><%=Sitio_web%></a></td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar'/> </td>
            </form>
            <%
            } else {
            %>
            <td> <%=Nombre%> </td>
            <td> <%=Apellido_Paterno%></td>
            <td> <%=Apellido_Materno%></td>
            <td> <%if (Genero.equalsIgnoreCase("F")) {
                    out.print("Femenino");
                } else {
                    out.print("Masculino");
                }%> </td>
            <td> <%=Ciudad_de_nacimiento%> </td>
            <td> <%=Biografia%> </td>
            <td> <a href="<%=Sitio_web%>" target=" "><%=Sitio_web%></a></td>
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
    <h1>Borrar un artista</h1>


    <form name="borrar_artista" method="post" action="BorrarArtista.jsp">
        Ingrese el número del artista a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required  onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Artista"/>
    </form>
    <% }%>
</body>
</html>
