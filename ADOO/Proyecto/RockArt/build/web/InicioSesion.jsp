<%-- 
    Document   : InicioSesion
    Created on : 26/12/2020, 06:45:59 PM
    Author     : alex_appleby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String Correo = request.getParameter("correo");
            String password = request.getParameter("contrasenia");
            Connection con = null;
            Statement sta = null;
            ResultSet r = null;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/RockArt", "root", "");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }
            
            try {
                r = sta.executeQuery("select * from Usuarios where Correo_electronico='" + Correo + "';");
                if (r.next()) {
                    String nombre = r.getString("Nombre");
                    String id = r.getString("Id");
                    String contrasenia = r.getString("Contrasenia"); 

                    if (contrasenia.equals(password)) {
                        sesion.setAttribute("usuario", nombre);  // Estos pasos son muy importantes porque con estas variables que le agrego a la sesión voy a estar trabajando todo el proytecto
                        sesion.setAttribute("id", id);
                        if (id.equals("1")){
                            out.println("<script>window.location='Jefe.jsp';</script>");
                        }else{
                            out.println("<script>window.location='Conductor.jsp';</script>");
                        }
                    } else {
                        out.println("<script>alert('Contraseña incorrecta');</script>");
                        out.println("<script>window.location='index.html';</script>");
                    }
                } else {
                    out.println("<script>alert('No estas registrado.');</script>");
                    out.println("<script>window.location='index.html';</script>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }


        %>
    </body>
</html>
