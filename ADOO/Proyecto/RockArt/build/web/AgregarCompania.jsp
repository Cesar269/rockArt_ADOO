<%-- 
    Document   : AgregarCompania
    Created on : 29/12/2020, 03:24:57 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Compañia</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Agregar Compañia</h1>
        <form name="formulario" method="post" action="AgregarCompania2.jsp">
            
            Nombre: <input type="text" name="nombre" required/>
            <br>
            <br>
            Dirección:  <input type="text" name="direccion" required/>
            <br>
            <br>
            Sitio web: <input type="text" name="sitio_web" required maxlength="150"/> 
            <br>
            <br>
            Teléfono: <input type="text" name="numero" onkeypress="return soloEnteros(event);" maxlength="10" minlength="10" required/>
            <br>
            <br>
            <input type="submit" name="agregar" value="Agregar Compañia"/> 
        </form>
    </body>
</html>
