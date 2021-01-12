<%-- 
    Document   : ConsultarCompanias
    Created on : 29/12/2020, 03:25:21 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Compañias</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
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
                r = sta.executeQuery("select * from Compania_de_grabacion;");

        %>


        <table border = '1' > 
            <tr>
                <%                    if (id == 1) {
                %>
                <td>Id</td>
                <% } %>
                <td>Nombre</td><td>Dirección</td><td>Sitio web</td><td>Teléfono</td>
                <%if (id == 1) {  %>
                <td>Modificar</td>
                <% } %>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
                    String Direccion = r.getString("Direccion");
                    String Sitio_web = r.getString("Sitio_web");
                    String Telefono = r.getString("Telefono");
            %>
            <tr>
                <%
                    if (id == 1) {
                %>
            <form name="modificar" method="post" action="ModificarCompania.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"</td>
                <td> <%=Nombre%> </td>
                <td> <%=Direccion%></td>
                <td> <a href="<%=Sitio_web%>" target=" "><%=Sitio_web%></a></td>
                <td> <%=Telefono%> </td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar'/> </td>
            </form>
            <%
            } else {
            %>
            <td> <%=Nombre%> </td>
            <td> <%=Direccion%></td>
            <td> <a href="<%=Sitio_web%>" target=" "><%=Sitio_web%></a></td>
            <td> <%=Telefono%> </td>
            <%
                }
            %>
        </tr>

        <% } %>
    </table>
    <%
        } catch (SQLException error) {
            out.print(error.toString());
        }
        con.close();
    %>

    <%
        if (id == 1) {
    %>
    <h1>Borrar un compañia</h1>


    <form name="borrar_compania" method="post" action="BorrarCompania.jsp">
        Ingrese el número de la compañia a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required  onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Compañia"/>
    </form>
    <% }%>
</body>
</html>
