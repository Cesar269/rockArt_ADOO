<%-- 
    Document   : ConsultarAlbums
    Created on : 3/01/2021, 05:57:27 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Álbums</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            Statement sta3 = null;  //Resulta que para cada ResultSet que quiera ocupar tengo que ocupar un Statement diferente.
            ResultSet r = null;
            ResultSet s = null;
            ResultSet t = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
                sta2 = con.createStatement();
                sta3 = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta.executeQuery("select * from Album;");

        %>


        <table border = '1' > 
            <tr>
                <%                    if (id == 1) {
                %>
                <td>Id</td>
                <% } %>
                <td>Nombre</td><td>Año de publicación</td><td>Número de pistas</td><td>Banda</td><td>Compañia de grabación</td><td>Imagen de portada</td><td>Imagen de contraportada</td>
                <%if (id == 1) {  %>
                <td>Modificar</td>
                <% } %>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Nombre = r.getString("Nombre");
                    String Anio = r.getString("Anio");
                    String Numero_de_pistas = r.getString("Numero_de_pistas");
                    int Id_Banda = r.getInt("Id_Banda");
                    int Id_Compania = r.getInt("Id_Compania_Grabacion");
                    String URLPortada = r.getString("Imagen_de_portada");
                    String URLContraportada = r.getString("Imagen_de_contraportada");
            %>
            <tr>
                <%
                    if (id == 1) {
                %>
            <form name="modificar" method="post" action="ModificarAlbum.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"></td>
                <td> <%=Nombre%> </td>
                <td> <%=Anio%></td>
                <td> <%=Numero_de_pistas%></td>
                <td> <% s = sta2.executeQuery("select Nombre from Banda where Id = " + Id_Banda + ";");
                    if (s.next()) {
                        out.print(s.getString("Nombre"));
                    } else {
                        out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                        out.println("<script>window.location='ConsultarAlbums.jsp';</script>");
                    }
                    %> </td>
                <td> <% t = sta3.executeQuery("select Nombre from Compania_de_grabacion where Id = " + Id_Compania + ";");
                    if (t.next()) {
                        out.print(t.getString("Nombre"));
                    } else {
                        out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                        out.println("<script>window.location='ConsultarAlbums.jsp';</script>");
                    }
                    %> </td>
                <td> <img alt="Imagen de portada" style="width: 120px; height: 120px;" src="<%=URLPortada%>"/> </td>
                <td> <img alt="Imagen de contraportada" style="width: 120px; height: 120px;" src="<%=URLContraportada%>"/></td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar'/> </td>
            </form>
            <%
            } else {
            %>
            <td> <%=Nombre%> </td>
            <td> <%=Anio%></td>
            <td> <%=Numero_de_pistas%></td>
            <td> <% s = sta2.executeQuery("select Nombre from Banda where Id = " + Id_Banda + ";");
                if (s.next()) {
                    out.print(s.getString("Nombre"));
                } else {
                    out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                    out.println("<script>window.location='ConsultarAlbums.jsp';</script>");
                }
                %> </td>
            <td> <% t = sta3.executeQuery("select Nombre from Compania_de_grabacion where Id = " + Id_Compania + ";");
                if (t.next()) {
                    out.print(t.getString("Nombre"));
                } else {
                    out.print("<script> alert('Lo sentimos, hemos tenido un problema. Intente de nuevo'); </script>");
                    out.println("<script>window.location='ConsultarAlbums.jsp';</script>");
                }
                %> </td>
            <td> <img alt="Imagen de portada" style="width: 120px; height: 120px;" src="<%=URLPortada%>"/> </td>
            <td> <img alt="Imagen de contraportada" style="width: 120px; height: 120px;" src="<%=URLContraportada%>"/></td>
                <%
                    }
                %>
        </tr>

        <% } %>
    </table>
    <%
        } catch (SQLException error) {
            out.print(error.toString());
        }
        con.close();
    %>

    <%
        if (id == 1) {
    %>
    <h1>Borrar un álbum</h1>


    <form name="borrar_album" method="post" action="BorrarAlbum.jsp">
        Ingrese el número del album a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required  onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Album"/>
    </form>
    <% }%>
</body>
</html>
