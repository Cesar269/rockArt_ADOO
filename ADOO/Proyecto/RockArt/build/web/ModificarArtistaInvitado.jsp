<%-- 
    Document   : ModificarArtistaInvitado
    Created on : 9/01/2021, 07:16:55 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Artista Invitado</title>
        <script src="JS/ModificarArtistaInvitado.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Artista Invitado</h1>
        <%
            String id = request.getParameter("id");
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            Statement sta3 = null;
            ResultSet r = null;
            ResultSet s = null;
            ResultSet t = null;

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
                r = sta.executeQuery("select Artistas_invitados.Id, Musico.Nombre as Musico, Canciones.Nombre as Cancion from Artistas_invitados inner join Musico inner join Canciones where Artistas_invitados.Id_musico = Musico.Id and Artistas_invitados.Id_Cancion = Canciones.Id and Artistas_invitados.Id = " + id + ";");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Musico = r.getString("Musico");
                    String Cancion = r.getString("Cancion");
        %>

        <form method="post" action="ModificarArtistaInvitado2.jsp" name="formulario" id="formulario">

            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/>
            Selecciona el músico que és artista invitado: 
            <select id="artista_invitado" disabled="disabled" name="artista_invitado" required="required">
                <%
                    s = sta2.executeQuery("select Nombre from Musico order by Nombre;"); //No está validado para que dos bandas tengan el mismo nombre, así que por ende no acepta que dos bandas tengan el mismo nombre.
                    while (s.next()) {
                %>
                <option <% if (s.getString("Nombre").equals(Musico)) {
                        out.print("selected = 'selected'");
                    }%> value="<%=s.getString("Nombre")%>"><%=s.getString("Nombre")%></option> 
                <%
                    }
                %>
            </select> 
            <br>
            <br>
            Selecciona la canción en la que és artista invitado:
            <select id="cancion" disabled="disabled" name="cancion" required="required">
                <%
                    t = sta3.executeQuery("select Nombre from Canciones order by Nombre;");
                    while (t.next()) {
                        String Nombre = t.getString("Nombre");
                %>
                <option <% if (Nombre.equals(Cancion)) {
                        out.print("selected = 'selected'");
                    }%> value="<%=Nombre%>"><%=Nombre%></option> 
                <%
                    }
                %>
            </select>
            <br>
            <br><input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar el artista invitado.');</script>");
                    out.println("<script>window.location='ConsultarArtistasInvitados.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
