<%-- 
    Document   : ConsultarBandas
    Created on : 29/12/2020, 09:40:18 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Bandas</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
        <script src="JS/ConsultarBandas.js" type="text/javascript"></script>
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
                r = sta.executeQuery("select * from Banda;");

        %>


        <table border = '1' > 
            <tr>
                <%                    if (id == 1) {
                %>
                <td>Id</td>
                <% } %>
                <td>Nombre</td>
                <%if (id == 1) {  %>
                <td>Modificar nombre</td>
                <td>Editar integrantes</td>
                <% } %>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
            %>
            <tr>
                <%
                    if (id == 1) {
                %>
            <form name="modificar" method="post" action="ModificarBanda.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"></td>
                <td> <%=Nombre%> </td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar nombre'/> </td>
            </form>
            <form name="editar" id="editar" method="post" action="EditarBanda.jsp">
                <input type="text" style="width: 20px; display: none;" id="id2" name="id2" value="<%=Id%>" readonly="readonly">
                <td> <input type="submit" name="action" value="Editar integrantes"/></td>
            </form>
            <%
            } else {
            %>
            <td> <%=Nombre%> </td>
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
    <h1>Borrar una banda</h1>


    <form name="borrar_banda" method="post" action="BorrarBanda.jsp">
        Ingrese el número de la banda a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required  onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Banda"/>
    </form>
    <% }%>
</body>
</html>
