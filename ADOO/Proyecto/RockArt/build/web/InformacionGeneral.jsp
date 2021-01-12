<%-- 
    Document   : InformacionGeneral
    Created on : 10/01/2021, 06:58:23 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Informacion General</title>
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
                r = sta.executeQuery("select * from Banda;");

        %>


        <table border = '1' > 
            <tr>
                <td>Id</td>
                <td>Nombre</td>
                <td>Ver información</td>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
            %>
            <tr>
            <form name="vermas" method="post" action="VerMas.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"></td>
                <td> <%=Nombre%> </td>
                <td> <input type = 'submit' name = 'vermas' value = 'Ver más información'/> </td>
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
</body>
</html>
