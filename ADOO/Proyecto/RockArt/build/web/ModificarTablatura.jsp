<%-- 
    Document   : ModificarTablatura
    Created on : 9/01/2021, 12:25:48 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Tablatura</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
        <script src="JS/ModificarTablatura.js" type="text/javascript"></script>
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
                r = sta.executeQuery("select Tablatura.Id, Tablatura.Fecha, Tablatura.URL, Tablatura.Traductor, Tablatura.Correo_del_traductor, Canciones.Nombre as Cancion from Tablatura inner join Canciones where Tablatura.Id_Cancion = Canciones.Id and Tablatura.Id = " + id + ";");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Fecha = r.getString("Fecha");
                    String URL = r.getString("URL");
                    String Traductor = r.getString("Traductor");
                    String Correo_del_traductor = r.getString("Correo_del_traductor");
                    String Cancion = r.getString("Cancion");
        %>

        <form method="post" action="ModificarTablatura2.jsp" name="formulario" id="formulario">

            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/> <br/>
            Fecha: <input type='date' disabled="disabled" name='fecha' id  = 'fecha' required value = '<%=Fecha%>'/> <br/>
            URL: <input type="file" required="required" name="url" id="url" disabled="disabled" maxlength="300"> <br/>
            Traductor: <input type="text" required="required" disabled="disabled" value="<%=Traductor%>" name="traductor" id="traductor" maxlength="50">
            <br/>
            Correo electrónico del traductor: <input type="email" disabled="disabled" required="required" name="correo" value="<%=Correo_del_traductor%>" id="correo" maxlength="50">
            <br/>
            Canción: <select disabled="disabled" id="cancion" name="cancion" required="required">
                <%
                    s = sta2.executeQuery("select Nombre from Canciones;");
                    while (s.next()) {
                        String Nombre = s.getString("Nombre");
                %>
                <option <% if (Nombre.equalsIgnoreCase(Cancion)) {
                        out.print("selected = 'selected'");
                    }%> value="<%=Nombre%>"><%=Nombre%></option> 
                <%
                    }
                %>
            </select> <br/>
            <input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar la tablatura.');</script>");
                    out.println("<script>window.location='ConsultarTablaturas.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
