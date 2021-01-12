<%-- 
    Document   : ModificarBanda
    Created on : 29/12/2020, 10:01:53 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Banda</title>
        <script src="JS/ModificarBanda.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Banda</h1>
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
                r = sta.executeQuery("select * from Banda where Id = " + id + ";");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
        %>

        <form method="post" action="ModificarBanda2.jsp" name="formulario" id="formulario">
            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/>
            Nombre: <input type='text' disabled="disabled" name='nombre' id  = 'nombre' required value = '<%=Nombre%>'/> <br/>
            <input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar la banda.');</script>");
                    out.println("<script>window.location='ConsultarBandas.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
