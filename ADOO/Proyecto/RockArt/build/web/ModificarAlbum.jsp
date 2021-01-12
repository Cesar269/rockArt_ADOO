<%-- 
    Document   : ModificarAlbum
    Created on : 4/01/2021, 08:04:22 AM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Álbum</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
        <script src="JS/ModificarAlbum.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Álbum</h1>
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
                r = sta.executeQuery("select Album.Id,Album.Nombre,Album.Anio,Album.Numero_de_pistas,Banda.Nombre as Banda,Compania_de_grabacion.Nombre as Compania,Album.Imagen_de_portada,Album.Imagen_de_contraportada from Album inner join Banda inner join Compania_de_grabacion where Album.Id = " + id + " and Album.Id_Banda = Banda.Id and Album.Id_Compania_Grabacion = Compania_de_grabacion.Id;");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
                    int Anio = r.getInt("Anio");
                    int Numero_de_pistas = r.getInt("Numero_de_pistas");
                    String Banda = r.getString("Banda");
                    String Compania = r.getString("Compania");
        %>

        <form method="post" action="ModificarAlbum2.jsp" name="formulario" id="formulario">

            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/>
            Nombre: <input type='text' disabled="disabled" name='nombre' id  = 'nombre' required value = '<%=Nombre%>'/> <br/>
            Año: <select disabled="disabled" id="anio" name="anio"   required="required">
                <%                    for (int i = 0; i < 102; i++) {
                %>
                <option <% if ((2021 - i) == Anio) {
                        out.print("selected = 'selected'");
                    }%> value="<%=(2021 - i)%>"><%=(2021 - i)%></option> 
                <%
                    }
                %>
            </select> <br/>
            Número de pistas: <input type="text" disabled="disabled" id="numero" value="<%=Numero_de_pistas%>" name="numero" onkeypress="return soloEnteros(event);" maxlength="4" minlength="1" required/> <br/>
            Banda: <select disabled="disabled" id="banda" name="banda"   required="required">
                <%
                    s = sta2.executeQuery("select Nombre from Banda order by Nombre;");
                    while (s.next()) {
                %>
                <option <% if (s.getString("Nombre").equalsIgnoreCase(Banda)) {
                        out.print("selected = 'selected'");
                    } %> value="<% out.print(s.getString("Nombre")); %>"><% out.print(s.getString("Nombre")); %></option>
                <% }%>
            </select> <br/>
            Compañia de grabación: <select disabled="disabled" id="compania" name="compania" required="required">
                <%
                    t = sta3.executeQuery("select Nombre from Compania_de_grabacion order by Nombre;");
                    while (t.next()) {
                %>
                <option <% if (t.getString("Nombre").equalsIgnoreCase(Compania)) {
                        out.print("selected = 'selected'");
                    } %> value="<% out.print(t.getString("Nombre")); %>"><% out.print(t.getString("Nombre")); %></option>
                <% }%>
            </select> <br/>
            Imagen de portada: <input type="file" disabled="disabled" name="imagen_de_portada" id="imagen_de_portada"  required /><br/>
            Imagen de contraportada: <input type="file" disabled="disabled" name="imagen_de_contraportada" id="imagen_de_contraportada"  required /><br/>
            <input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar el Álbum.');</script>");
                    out.println("<script>window.location='ConsultarAlbums.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
