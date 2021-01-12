<%-- 
    Document   : ModificarCancion
    Created on : 8/01/2021, 09:15:02 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Canción</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
        <script src="JS/ModificarCancion.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Canción</h1>
        <%
            String id = request.getParameter("id");
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
                r = sta.executeQuery("select Canciones.Id, Canciones.Nombre as Cancion, Canciones.Duracion, Album.Nombre as Album, Canciones.Numero_de_pista_del_album from Canciones inner join Album where Canciones.Id = " + id + " and Canciones.Id_Album = Album.Id;");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Cancion = r.getString("Cancion");
                    String Duracion = r.getString("Duracion");
                    String Album = r.getString("Album");
                    int Pistas = r.getInt("Numero_de_pista_del_album");
        %>

        <form method="post" action="ModificarCancion2.jsp" name="formulario" id="formulario">

            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/>
            Nombre: <input type='text' disabled="disabled" name='nombre' id  = 'nombre' required value = '<%=Cancion%>'/> <br/>
            Duración: <input type="text" disabled="disabled" name="duracion" id="duracion" required="required" value="<%=Duracion%>"> <br/>
            Album: <select disabled="disabled" id="album" name="album"   required="required">
                <%
                    s = sta2.executeQuery("select Nombre from Album order by Nombre;");
                    while (s.next()) {
                %>
                <option <% if (s.getString("Nombre").equalsIgnoreCase(Album)) {
                        out.print("selected = 'selected'");
                    } %> value="<% out.print(s.getString("Nombre")); %>"><% out.print(s.getString("Nombre")); %></option>
                <% }%>
            </select> <br/>
            Número de pistas: <input type="text" disabled="disabled" id="numero" value="<%=Pistas%>" name="numero" onkeypress="return soloEnteros(event);" maxlength="3" minlength="1" required/> <br/>
            <input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar la canción.');</script>");
                    out.println("<script>window.location='ConsultarCanciones.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
