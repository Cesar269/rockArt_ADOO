<%-- 
    Document   : BorrarConductor
    Created on : 28/12/2020, 05:13:30 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
        <script src="JS/BorrarConductor.js" type="text/javascript"></script>
    </head>
    <body>
        <%

            String id = request.getParameter("baja");
            Connection con = null;
            Statement sta = null;
            ResultSet r = null;

            if (Integer.parseInt(id) != 1) {
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                    sta = con.createStatement();
                } catch (SQLException error) {
                    out.print(error.toString());
                }
                /////////////////////////////////////////////////////////////////////////////
                try {
                    r = sta.executeQuery("select * from Usuarios where Id ='" + id + "';");
                    if (r.next()) {

                        out.println("<form id='borrar' action='BorrarConductor2.jsp' method='post'>");
                        out.println("<input type='text' style='display:none;' name ='user' value='" + id + "' >");
                        out.println("</form>");
                        out.println("<script>borra();</script>");

                    } else {
                        out.print("<script>alert('No existe el conductor');</script>");
                        out.println("<script>window.location='ConsultarConductores.jsp';</script>");
                    }
                } catch (SQLException error) {
                    out.print(error.toString());
                }
            } else {
                out.print("<script>alert('No puedes borrarte a ti mismo');</script>");
                out.println("<script>window.location='ConsultarConductores.jsp';</script>");
            }


        %>
    </body>
</html>
