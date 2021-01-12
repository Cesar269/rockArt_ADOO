<%-- 
    Document   : CerrarSesion
    Created on : 26/12/2020, 07:03:07 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar sesión</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            out.println("<script>window.location='index.html';</script>");
        %>
    </body>
</html>
