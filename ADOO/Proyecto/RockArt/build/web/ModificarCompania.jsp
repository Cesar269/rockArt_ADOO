<%-- 
    Document   : ModificarCompania
    Created on : 29/12/2020, 05:21:55 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Compañia</title>
        <script src="JS/ModificarCompania.js" type="text/javascript"></script>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Compañia</h1>
        <%
            String id = request.getParameter("id");
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
                r = sta.executeQuery("select * from Compania_de_grabacion where Id = " + id + ";");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
                    String Direccion = r.getString("Direccion");
                    String Sitio_web = r.getString("Sitio_web");
                    String Telefono = r.getString("Telefono");
        %>

        <form method="post" action="ModificarCompania2.jsp" name="formulario" id="formulario">

            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/>
            Nombre: <input type='text' disabled="disabled" name='nombre' id  = 'nombre' required value = '<%=Nombre%>'/> <br/>
            Direccion: <input type='text' disabled="disabled" name='direccion' id='direccion' value = '<%=Direccion%>'  required/> <br/>
            Sitio web: <input type="text" disabled="disabled" name="sitio_web" id="sitio_web" value="<%=Sitio_web%>" required /><br/>
            Teléfono: <input type="text" disabled="disabled" name="numero" id="numero" onkeypress="return soloEnteros(event);" value="<%=Telefono%>" maxlength="10" minlength="10" required/><br/>
            <input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar la compañia.');</script>");
                    out.println("<script>window.location='ConsultarCompanias.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
