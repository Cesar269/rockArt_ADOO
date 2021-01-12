<%-- 
    Document   : AgregarTablatura
    Created on : 8/01/2021, 11:41:59 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Tablatura</title>
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
                r = sta.executeQuery("select Nombre from Canciones order by Nombre;"); //No está validado para que dos bandas tengan el mismo nombre, así que por ende no acepta que dos bandas tengan el mismo nombre.
        %>
        <h1>Agregar Tablatura</h1>
        <form name="formulario" method="post" action="AgregarTablatura2.jsp">
            Fecha: <input type="date" name="fecha" id="fecha" required/>  <!--No está validado para que no acepte fechas posteriores a la actual, por lo tanto, no ingresar fechas posteriores a la actual.-->
            <br>
            <br>
            URL: <input type="file" required="required" name="url" id="url" maxlength="300"> 
            <br/>
            <br/>
            Traductor: <input type="text" required="required" name="traductor" id="traductor" maxlength="50">
            <br/>
            <br/>
            Correo electrónico del traductor: <input type="email" required="required" name="correo" id="correo" maxlength="50">
            <br/>
            <br/>
            Canción: <select id="cancion" name="cancion" required="required">
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
            <input type="submit" name="agregar" value="Agregar Álbum"/> 
        </form>
        <%
            } catch (SQLException error) {
                out.print(error.toString());
            }
            con.close();
        %>
    </body>
</html>
