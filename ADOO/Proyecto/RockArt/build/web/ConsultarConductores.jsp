<%-- 
    Document   : ConsultarConductores
    Created on : 26/12/2020, 10:58:26 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar conductores</title>
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
                r = sta.executeQuery("select * from Usuarios;");

        %>


        <table border = '1' > 
            <tr>
                <td>Id</td><td>Nombre</td><td>Apellido Paterno</td><td>Apellido Materno</td><td>Genero</td><td>Ciudad de nacimiento</td><td>Correo electrónico</td><td>Telefono</td><td>Contraseña</td><td>Modificar</td>
            </tr>
            <%            while (r.next()) {
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
            <tr>
            <form name="modificar" method="post" action="ModificarConductor.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"</td>
                <td> <%=Nombre%> </td>
                <td> <%=Apellido_Paterno%></td>
                <td> <%=Apellido_Materno%></td>
                <td> <%if (Genero.equalsIgnoreCase("F")) {
                        out.print("Femenino");
                    } else {
                        out.print("Masculino");
                    }%> </td>
                <td> <%=Ciudad_de_nacimiento%> </td>
                <td> <%=Correo_electronico%> </td>
                <td> <%=Telefono%></td>
                <td> <%=Contrasenia%></td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar'/> </td>



            </form>
        </tr>

        <% } %>
    </table>
    <%
        } catch (SQLException error) {
            out.print(error.toString());
        }

        con.close();
    %>

    <h1>Borrar un conductor</h1>


    <form name="borrar_conductor" method="post" action="BorrarConductor.jsp">
        Ingrese el número del usuario a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required maxlength="3" onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Conductor"/>
    </form>
</body>
</html>