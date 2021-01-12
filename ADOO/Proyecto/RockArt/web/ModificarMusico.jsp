<%-- 
    Document   : ModificarMusico
    Created on : 29/12/2020, 01:49:09 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Músico</title>
        <script src="JS/ModificarMusico.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Músico</h1>
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
                r = sta.executeQuery("select * from Musico where Id = " + id + ";");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
                    String Apellido_Paterno = r.getString("Apellido_Paterno");
                    String Apellido_Materno = r.getString("Apellido_Materno");
                    String Instrumento = r.getString("Instrumento");
                    String Ciudad_de_nacimiento = r.getString("Ciudad_de_nacimiento");
        %>

        <form method="post" action="ModificarMusico2.jsp" name="formulario" id="formulario">
            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/>
            Nombre: <input type='text' disabled="disabled" name='nombre' id  = 'nombre' required value = '<%=Nombre%>'/> <br/>
            Apellido Paterno: <input type='text' disabled="disabled" name='apellido_paterno' id='apellido_paterno' value = '<%=Apellido_Paterno%>'  required/> <br/>
            Apellido Materno: <input type='text' disabled="disabled" name='apellido_materno' id='apellido_materno'  value = '<%=Apellido_Materno%>'  required/> <br/>
            Instrumento: <input type="text" disabled="disabled" name="instrumento" id ="instrumento" value ="<%=Instrumento%>" required /> <br/>
            Ciudad de nacimiento: <input type='text' disabled="disabled" name='ciudad_de_nacimiento' id='ciudad_de_nacimiento'  value = '<%=Ciudad_de_nacimiento%>'  required/> <br/>
            <input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar el Músico.');</script>");
                    out.println("<script>window.location='ConsultarMusicos.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
