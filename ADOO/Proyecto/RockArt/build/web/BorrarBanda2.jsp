<%-- 
    Document   : BorrarBanda2
    Created on : 3/01/2021, 05:31:24 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
    </head>
    <body>
        <%

            String id = request.getParameter("user");

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
            /////////////////////////////////////////////////////////////////
            try {
                sta.executeUpdate("delete  from Banda where Id =" + id + ";"); //aqui no lleva el * en el delete
                out.println("<script>window.location='ConsultarBandas.jsp';</script>");
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>
    </body>
</html>
