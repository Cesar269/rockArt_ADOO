<%-- 
    Document   : ModificarConductor
    Created on : 27/12/2020, 06:59:06 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar cuestionario</title>
        <script src="JS/ModificarConductor.js" type="text/javascript"></script>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Modificar Conductor</h1>
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
                r = sta.executeQuery("select * from Usuarios where Id = " + id + ";");
                if (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
                    String Apellido_Paterno = r.getString("Apellido_Paterno");
                    String Apellido_Materno = r.getString("Apellido_Materno");
                    String Genero = r.getString("Genero");
                    String Ciudad_de_nacimiento = r.getString("Ciudad_de_nacimiento");
                    String Correo_electronico = r.getString("Correo_electronico");
                    String Telefono = r.getString("Telefono");
                    String Contrasenia = r.getString("Contrasenia");
        %>

        <form method="post" action="ModificarConductor2.jsp" name="formulario" id="formulario">

            <input type="text" id="id" name="id" value="<%=Id%>" readonly="readonly" style="display: none;"/>
            Nombre: <input type='text' disabled="disabled" name='nombre' id  = 'nombre' required value = '<%=Nombre%>'/> <br/>
            Apellido Paterno: <input type='text' disabled="disabled" name='apellido_paterno' id='apellido_paterno' value = '<%=Apellido_Paterno%>'  required/> <br/>
            Apellido Materno: <input type='text' disabled="disabled" name='apellido_materno' id='apellido_materno'  value = '<%=Apellido_Materno%>'  required/> <br/>
            Genero: <input type='text' disabled="disabled" name='genero' id='genero' placeholder="Escriba F ó M" value = '<%if (Genero.equalsIgnoreCase("F")) {
                    out.print("Femenino");
                } else {
                    out.print("Masculino");
                }%>' required/> <br/>
            Ciudad de nacimiento: <input type='text' disabled="disabled" name='ciudad_de_nacimiento' id='ciudad_de_nacimiento'  value = '<%=Ciudad_de_nacimiento%>'  required/> <br/>
            Correo electrónico: <input type="email" disabled="disabled" name="correo" id ="correo" value ="<%=Correo_electronico%>" required maxlength="35"/> <br/>
            Teléfono: <input type="text" disabled="disabled" name="numero" id="numero" onkeypress="return soloEnteros(event);" value="<%=Telefono%>" maxlength="10" minlength="10" required/><br/>
            Contraseña: <input type="text" disabled="disabled" name="contrasenia" id="contrasenia" value="<%=Contrasenia%>" required  maxlength="16"/><br/>
            <input type = 'submit' disabled="disabled" name = 'modificar' id="modificar" value = 'Modificar'/> 
        </form>

        <%
                } else {
                    out.println("<script>alert('Lo sentimos, hubo un error al cargar el conductor.');</script>");
                    out.println("<script>window.location='ConsultarConductores.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>

        <input type="button" name="action" onclick="habilita();" value="Habilitar campos"/>

    </body>
</html>
