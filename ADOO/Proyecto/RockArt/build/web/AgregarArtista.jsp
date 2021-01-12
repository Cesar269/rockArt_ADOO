<%-- 
    Document   : AgregarArtista
    Created on : 28/12/2020, 07:00:18 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Artista</title>
    </head>
    <body>
        <h1>Agregar Artista</h1>
        <form name="formulario" method="post" action="AgregarArtista2.jsp">
            Nombre: <input type="text" name="nombre" required/>
            <br>
            <br>
            Apellido Paterno:  <input type="text" name="apellido_paterno" required/>
            <br>
            <br>
            Apellido Materno: <input type="text" name="apellido_materno" required/>
            <br>
            <br>
            Genero:
            Masculino:  <input type="radio" name="genero" value="M" required > 
            Femenino:  <input type="radio" name="genero" value="F" required>
            <br>
            <br>
            Ciudad de nacimiento: <input type="text" name="ciudad_de_nacimiento" required/>
            <br>
            <br>
            Biografía: <input type="text" name="biografia" required maxlength="500"/> 
            <br>
            <br>
            Sitio web: <input type="text" name="sitio_web" required maxlength="150"/> 
            <br>
            <br>
            <input type="submit" name="agregar" value="Agregar Artista"/> 
        </form>
    </body>
</html>
