<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="parametrizar.jsp"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir</title>
    </head>
    <body>

        <%            if (session.getAttribute("usuario") == null) {
                session.setAttribute("error", "Debe iniciar sesión para acceder a la página.");
                response.sendRedirect("login.jsp");
            } else if (session.getAttribute("usuario").equals("guest")) {
                session.setAttribute("error", "Ha iniciado sesión como invitado, por lo tanto no podrá acceder a la página del administrador.");
                response.sendRedirect("login.jsp");
            }
        %>


        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(bbdd, usuario, contrasenya);
            Statement s = conexion.createStatement();

            int CodEqui = Integer.parseInt(request.getParameter("CodEqui"));
            String NomEqui = request.getParameter("NomEqui");
            int Campeonatos = Integer.parseInt(request.getParameter("Campeonatos"));

            s.execute("INSERT INTO Equipo VALUES(" + CodEqui + ",'" + NomEqui + "'," + Campeonatos + ")");

            conexion.close();

            response.sendRedirect("equipos.jsp");
        %>

    </body>
</html>