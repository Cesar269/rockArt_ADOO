<%-- 
    Document   : AgregarBanda
    Created on : 29/12/2020, 09:33:13 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Banda</title>
    </head>
    <body>
        <h1>Agregar Banda</h1>
        <form name="formulario" method="post" action="AgregarBanda2.jsp">
            Nombre: <input type="text" name="nombre" required/>
            <br>
            <br>
            <input type="submit" name="agregar" value="Agregar Banda"/> 
        </form>
    </body>
</html>
