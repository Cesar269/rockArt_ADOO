<%-- 
    Document   : VerMas
    Created on : 10/01/2021, 07:05:53 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar información general</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id").toString());
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            Statement sta3 = null;
            Statement sta4 = null;
            Statement sta5 = null;
            ResultSet r = null;
            ResultSet s = null;
            ResultSet t = null;
            ResultSet u = null;
            ResultSet v = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
                sta2 = con.createStatement();
                sta3 = con.createStatement();
                sta4 = con.createStatement();
                sta5 = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta.executeQuery("select Nombre from Banda where Id = " + id + ";");
                if (r.next()) {
        %> 

        <h1><%=r.getString("Nombre")%></h1>

        <%
            } else {
                out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                out.println("<script>window.location='ConsultarBandas.jsp';</script>");
            }
        %> 
        <h1>Artistas Integrantes de la Banda</h1>
        <table border = '1' > 
            <tr>
                <td>Id</td><td>Nombre</td><td>Apellido Paterno</td><td>Apellido Materno</td><td>Genero</td><td>Ciudad de nacimiento</td><td>Biografía</td><td>Sitio web</td>
            </tr>
            <%                s = sta2.executeQuery("select Artista.* from Artista inner join Registro_Banda_Artistas  where Registro_Banda_Artistas.Id_Banda = " + id + " and Artista.Id = Registro_Banda_Artistas.Id_Artista;");
                while (s.next()) {
                    int Id = s.getInt("Id");
                    String Nombre = s.getString("Nombre");
                    String Apellido_Paterno = s.getString("Apellido_Paterno");
                    String Apellido_Materno = s.getString("Apellido_Materno");
                    String Genero = s.getString("Genero");
                    String Ciudad_de_nacimiento = s.getString("Ciudad_de_nacimiento");
                    String Biografia = s.getString("Biografia");
                    String Sitio_web = s.getString("Sitio_web");

            %>
            <tr>
                <td> <%=Id%></td>
                <td> <%=Nombre%> </td>
                <td> <%=Apellido_Paterno%></td>
                <td> <%=Apellido_Materno%></td>
                <td> <%if (Genero.equalsIgnoreCase("F")) {
                        out.print("Femenino");
                    } else {
                        out.print("Masculino");
                    }%> </td>
                <td> <%=Ciudad_de_nacimiento%> </td>
                <td> <%=Biografia%> </td>
                <td> <a href="<%=Sitio_web%>" target=" "><%=Sitio_web%></a></td>
            </tr>
            <% }%> 
        </table>
        <h1>Musicos Integrantes de la Banda</h1>
        <table border = '1' > 
            <tr>
                <td>Id</td><td>Nombre</td><td>Apellido Paterno</td><td>Apellido Materno</td><td>Instrumento</td><td>Ciudad de nacimiento</td>
            </tr>
            <%                t = sta3.executeQuery("select Musico.* from Musico inner join Registro_Banda_Musicos  where Registro_Banda_Musicos.Id_Banda = " + id + " and Musico.Id = Registro_Banda_Musicos.Id_Musico;");
                while (t.next()) {
                    int Id = t.getInt("Id");
                    String Nombre = t.getString("Nombre");
                    String Apellido_Paterno = t.getString("Apellido_Paterno");
                    String Apellido_Materno = t.getString("Apellido_Materno");
                    String Instrumento = t.getString("Instrumento");
                    String Ciudad_de_nacimiento = t.getString("Ciudad_de_nacimiento");

            %>
            <tr>
                <td> <%=Id%></td>
                <td> <%=Nombre%> </td>
                <td> <%=Apellido_Paterno%></td>
                <td> <%=Apellido_Materno%></td>
                <td> <%=Instrumento%> </td>
                <td> <%=Ciudad_de_nacimiento%> </td></tr>
                <% }%> 
        </table>
        <h1>Albums de la banda</h1>

        <%
            u = sta4.executeQuery("select Album.* from Album inner join Banda where Album.Id_Banda = Banda.Id and Banda.Id = " + id + ";");
        %>
        <table border = '1' > 
            <tr>
                <td>Id</td><td>Nombre</td><td>Año de publicación</td><td>Número de pistas</td><td>Compañia de grabación</td><td>Imagen de portada</td><td>Imagen de contraportada</td><td>Ver canciones</td>
            </tr>
            <%            while (u.next()) {
                    int Id = u.getInt("Id");
                    String Nombre = u.getString("Nombre");
                    String Anio = u.getString("Anio");
                    String Numero_de_pistas = u.getString("Numero_de_pistas");
                    int Id_Compania = u.getInt("Id_Compania_Grabacion");
                    String URLPortada = u.getString("Imagen_de_portada");
                    String URLContraportada = u.getString("Imagen_de_contraportada");
            %>
            <tr>
            <form name="ver_canciones" method="post" action="VerCanciones.jsp">

                <td> <input type="text" style="width: 20px;" id="id_album" name="id_album" value="<%=Id%>" readonly="readonly"></td>
                <td> <%=Nombre%> </td>
                <td> <%=Anio%></td>
                <td> <%=Numero_de_pistas%></td>
                <td> <% v = sta5.executeQuery("select Nombre from Compania_de_grabacion where Id = " + Id_Compania + ";");
                    if (v.next()) {
                        out.print(v.getString("Nombre"));
                    } else {
                        out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                        out.println("<script>window.location='InformacionGeneral.jsp';</script>");
                    }
                    %> </td>
                <td> <img alt="Imagen de portada" style="width: 120px; height: 120px;" src="<%=URLPortada%>"/> </td>
                <td> <img alt="Imagen de contraportada" style="width: 120px; height: 120px;" src="<%=URLContraportada%>"/></td>
                <td> <input type = 'submit' name = 'ver' value = 'Ver Canciones'/> </td>
            </form>
        </tr>

        <% } %>
    </table>

    <%                 } catch (SQLException error) {
            out.print(error.toString());
        }
        con.close();
    %>
</body>
</html>
