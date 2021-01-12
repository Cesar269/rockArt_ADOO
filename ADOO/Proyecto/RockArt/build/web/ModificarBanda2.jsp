<%-- 
    Document   : ModificarBanda2
    Created on : 3/01/2021, 12:16:52 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Banda</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement sta = null;
            String id = request.getParameter("id");
            String Nombre = request.getParameter("nombre");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                sta.executeUpdate("update Banda set Nombre='" + Nombre + "' where Id = " + id + ";");
                out.println("<script>alert('Banda Modificada.');</script>");
                out.println("<script>window.location='ConsultarBandas.jsp';</script>");
            } catch (SQLException error) {
                out.println(error.toString());
            }


        %>
    </body>
</html>
