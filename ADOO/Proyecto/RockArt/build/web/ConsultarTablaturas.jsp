<%-- 
    Document   : ConsultarTablaturas
    Created on : 8/01/2021, 11:42:32 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Tablaturas</title>
        <script src="JS/SoloEnteros.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            int id = Integer.parseInt(sesion.getAttribute("id").toString());
            Connection con = null;
            Statement sta = null;
            ResultSet r = null;
            ResultSet s = null;
            ResultSet t = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt?autoReconnect=true&useSSL=false", "root", "");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                r = sta.executeQuery("select Tablatura.Id, Tablatura.Fecha, Tablatura.URL, Tablatura.Traductor, Tablatura.Correo_del_traductor,Canciones.Nombre as Cancion from Tablatura inner join Canciones  where Tablatura.Id_Cancion = Canciones.Id order by Tablatura.Id;");

        %>


        <table border = '1' > 
            <tr>
                <%                    if (id == 1) {
                %>
                <td>Id</td>
                <% } %>
                <td>Fecha</td><td>Url</td><td>Traductor</td><td>Correo del traductor</td><td>Canción</td>
                <%if (id == 1) {  %>
                <td>Modificar</td>
                <% } %>
            </tr>
            <%            while (r.next()) {
                    int Id = r.getInt("Id");
                    String Fecha = r.getString("Fecha");
                    String URL = r.getString("URL");
                    String Traductor = r.getString("Traductor");
                    String Correo_del_traductor = r.getString("Correo_del_traductor");
                    String Cancion = r.getString("Cancion");
            %>
            <tr>
                <%
                    if (id == 1) {
                %>
            <form name="modificar" method="post" action="ModificarTablatura.jsp">

                <td> <input type="text" style="width: 20px;" id="id" name="id" value="<%=Id%>" readonly="readonly"></td>
                <td> <%=Fecha%> </td>
                <td> <a href="<%=URL%>" target=" "><%=URL%></a></td>
                <td> <%=Traductor%></td>
                <td> <%=Correo_del_traductor%></td>
                <td> <%=Cancion%> </td>
                <td> <input type = 'submit' name = 'modificar' value = 'Modificar'/> </td>
            </form>
            <%
            } else {
            %>
            <td> <%=Fecha%> </td>
            <td> <a href="<%=URL%>" target=" "><%=URL%></a></td>
            <td> <%=Traductor%></td>
            <td> <%=Correo_del_traductor%></td>
            <td> <%=Cancion%> </td>
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
    <h1>Borrar una tablatura</h1>


    <form name="borrar_tablatura" method="post" action="BorrarTablatura.jsp">
        Ingrese el número de la tablatura a borrar: <br/><br/>
        <input type="text" name="baja" id="baja" required  onkeypress="return soloEnteros(event);"/><br/><br/>
        <input type="submit" name="realiza" id="realiza" value="Borrar Tablatura"/>
    </form>
    <% }%>
</body>
</html>
