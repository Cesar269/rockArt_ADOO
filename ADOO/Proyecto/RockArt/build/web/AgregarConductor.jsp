<%-- 
    Document   : AgregarConductor
    Created on : 26/12/2020, 07:54:02 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Conductor</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Agrega un nuevo conductor</h1>

        <form name="formulario" method="post" action="AgregarConductor2.jsp">
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
            Correo electrónico: <input type="email" name="correo" required maxlength="35"/> 
            <br>
            <br>
            Teléfono: <input type="text" name="numero" onkeypress="return soloEnteros(event);" maxlength="10" minlength="10" required/>
            <br>
            <br>
            Contraseña: <input type="password" name="contrasenia"  required  maxlength="16"/> 

            <input type="submit" name="agregar" value="Agregar Conductor"/> 
        </form>

    </body>
</html>
