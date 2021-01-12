<%-- 
    Document   : BorrarMusico
    Created on : 29/12/2020, 02:24:51 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
        <script src="JS/BorrarMusico.js" type="text/javascript"></script>
    </head>
    <body>
        <%

            String id = request.getParameter("baja");
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
            /////////////////////////////////////////////////////////////////////////////
            try {
                r = sta.executeQuery("select * from Musico where Id ='" + id + "';");
                if (r.next()) {

                    out.println("<form id='borrar' action='BorrarMusico2.jsp' method='post'>");
                    out.println("<input type='text' style='display:none;' name ='user' value='" + id + "' >");
                    out.println("</form>");
                    out.println("<script>borra();</script>");

                } else {
                    out.print("<script>alert('No existe el Musico');</script>");
                    out.println("<script>window.location='ConsultarMusicos.jsp';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>
    </body>
</html>
