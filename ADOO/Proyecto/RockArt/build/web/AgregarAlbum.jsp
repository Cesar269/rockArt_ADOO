<%-- 
    Document   : AgregarAlbum
    Created on : 3/01/2021, 05:56:25 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Álbum</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            Connection con = null;
            Statement sta = null;
            ResultSet r = null;
            ResultSet s = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta.executeQuery("select Nombre from Banda order by Nombre;"); //No está validado para que dos bandas tengan el mismo nombre, así que por ende no acepta que dos bandas tengan el mismo nombre.
        %>
        <h1>Agregar Álbum</h1>
        <form name="formulario" method="post" action="AgregarAlbum2.jsp">
            Nombre: <input type="text" name="nombre" required/>
            <br>
            <br>
            Año: <select id="anio" name="anio" required="required">
                <%                    for (int i = 0; i < 102; i++) {
                %>
                <option value="<%=(2021 - i)%>"><%=(2021 - i)%></option> 
                <%
                    }
                %>
            </select> 
            <br>
            <br>
            Número de pistas: <input type="text" name="numero" onkeypress="return soloEnteros(event);" maxlength="4" minlength="1" required/>
            <br>
            <br>
            Banda: <select id="banda" name="banda" required="required">
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
            Compañia de grabación: <select id="compania" name="compania" required="required">
                <%
                    s = sta.executeQuery("select Nombre from Compania_de_grabacion order by Nombre;"); //No está validado para que dos bandas tengan el mismo nombre, así que por ende no acepta que dos bandas tengan el mismo nombre.
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
            Imagen de portada: <input type="file" name="portada" required="required"/> <!--No está validado para que solo acepte imagenes, por ende, solo seleccionar imagenes-->
            <br>
            <br>
            Imagen de contraportada: <input type="file" name="contraportada" required="required"/> <!--No está validado para que solo acepte imagenes, por ende, solo seleccionar imagenes-->
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
