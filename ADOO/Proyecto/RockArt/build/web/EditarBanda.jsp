<%-- 
    Document   : EditarBanda
    Created on : 3/01/2021, 12:08:53 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Integrantes</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id2").toString());
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
                u = sta4.executeQuery("select Nombre, Apellido_Paterno, Apellido_Materno from Artista;");
                v = sta5.executeQuery("select Nombre, Apellido_Paterno, Apellido_Materno from Musico;");
                if (r.next()) {
        %> 

        <h1><%=r.getString("Nombre")%></h1>

        <%
            } else {
                out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                out.println("<script>window.location='ConsultarBandas.jsp';</script>");
            }

            //En esta parte va lo de los artistas

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
        <h3>Agregar un artista a la banda</h3>
        <form method="post" action="AgregarArtistaBanda.jsp">
            <input type="text" style="width: 20px; display: none;" id="id2" name="id2" value="<%=id%>" readonly="readonly">
            <select id="agregar_artista_banda" name="agregar_artista_banda" required="required">
                <%
                    while (u.next()) {
                        String Nombre = u.getString("Nombre");
                        String Apellido_Paterno = u.getString("Apellido_Paterno");
                        String Apellido_Materno = u.getString("Apellido_Materno");

                %>
                <option value="<%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%>"><%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%></option> 
                <%
                    }
                %>
            </select>
            <br/>
            <input type="submit" value="Agregar"/>
        </form>

        <h3>Eliminar un artista de la banda</h3>
        <%
            u = sta4.executeQuery("select Nombre, Apellido_Paterno, Apellido_Materno from Artista;");
        %>
        <form method="post" action="EliminarArtistaBanda.jsp">
            <input type="text" style="width: 20px; display: none;" id="id3" name="id3" value="<%=id%>" readonly="readonly">
            <select id="eliminar_artista_banda" name="eliminar_artista_banda" required="required">
                <%
                    while (u.next()) {
                        String Nombre = u.getString("Nombre");
                        String Apellido_Paterno = u.getString("Apellido_Paterno");
                        String Apellido_Materno = u.getString("Apellido_Materno");

                %>
                <option value="<%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%>"><%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%></option> 
                <%
                    }
                %>
            </select>
            <br/>
            <input type="submit" value="Eliminar"/>
        </form>
        <%
            // En esta parte va lo de los músicos

        %>
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
        <h3>Agregar un musico a la banda</h3>
        <form method="post" action="AgregarMusicoBanda.jsp">
            <input type="text" style="width: 20px; display: none;" id="id4" name="id4" value="<%=id%>" readonly="readonly">
            <select id="agregar_musico_banda" name="agregar_musico_banda" required="required">
                <%
                    while (v.next()) {
                        String Nombre = v.getString("Nombre");
                        String Apellido_Paterno = v.getString("Apellido_Paterno");
                        String Apellido_Materno = v.getString("Apellido_Materno");

                %>
                <option value="<%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%>"><%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%></option> 
                <%
                    }
                %>
            </select>
            <br/>
            <input type="submit" value="Agregar"/>
        </form>

        <h3>Eliminar un musico de la banda</h3>
        <%
            v = sta5.executeQuery("select Nombre, Apellido_Paterno, Apellido_Materno from Musico;");
        %>
        <form method="post" action="EliminarMusicoBanda.jsp">
            <input type="text" style="width: 20px; display: none;" id="id5" name="id5" value="<%=id%>" readonly="readonly">
            <select id="eliminar_musico_banda" name="eliminar_musico_banda" required="required">
                <%
                    while (v.next()) {
                        String Nombre = v.getString("Nombre");
                        String Apellido_Paterno = v.getString("Apellido_Paterno");
                        String Apellido_Materno = v.getString("Apellido_Materno");

                %>
                <option value="<%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%>"><%=(Nombre + " " + Apellido_Paterno + " " + Apellido_Materno)%></option> 
                <%
                    }
                %>
            </select>
            <br/>
            <input type="submit" value="Eliminar"/>
        </form>
        <%                } catch (SQLException error) {
                out.print(error.toString());
            }
            con.close();
        %>
    </body>
</html>
