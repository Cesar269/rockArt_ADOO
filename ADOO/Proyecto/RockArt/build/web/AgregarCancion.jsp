<%-- 
    Document   : AgregarCancion
    Created on : 4/01/2021, 05:47:08 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Canción</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <%
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
                r = sta.executeQuery("select Nombre from Album order by Nombre;"); //No está validado para que dos bandas tengan el mismo nombre, así que por ende no acepta que dos bandas tengan el mismo nombre.
        %>
        <h1>Agregar Canción</h1>
        <form name="formulario" method="post" action="AgregarCancion2.jsp">
            Nombre: <input type="text" name="nombre" required/>
            <br>
            <br>
            Duración: <input type="text" name="duracion" required/>
            <br>
            <br>
            Álbum: <select id="album" name="album" required="required">
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
            Número de pista en el álbum: <input type="text" name="numero" onkeypress="return soloEnteros(event);" maxlength="4" minlength="1" required/>
            <br>
            <br>
            <input type="submit" name="agregar" value="Agregar Canción"/> 
        </form>
        <%
            } catch (SQLException error) {
                out.print(error.toString());
            }
            con.close();
        %>
    </body>
</html>
