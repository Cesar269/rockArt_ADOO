<%-- 
    Document   : AgregarMusico
    Created on : 29/12/2020, 12:56:01 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Músico</title>
    </head>
    <body>
        <h1>Agregar Músico</h1>
        <form name="formulario" method="post" action="AgregarMusico2.jsp">
            Nombre: <input type="text" name="nombre" required/>
            <br>
            <br>
            Apellido Paterno:  <input type="text" name="apellido_paterno" required/>
            <br>
            <br>
            Apellido Materno: <input type="text" name="apellido_materno" required/>
            <br>
            <br>
            Instrumento: <input type="text" name="instrumento" required maxlength="50"/> 
            <br>
            <br>
            Ciudad de nacimiento: <input type="text" name="ciudad_de_nacimiento" required/>
            <br>
            <br>
            <input type="submit" name="agregar" value="Agregar Musico"/> 
        </form>
    </body>
</html>
