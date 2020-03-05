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
        <link rel="stylesheet" href="style.css" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

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

            int CodPil = Integer.parseInt(request.getParameter("CodPil"));
            String NomPil = request.getParameter("NomPil");
            String ApePil = request.getParameter("ApePil");
            int Puntos = Integer.parseInt(request.getParameter("Puntos"));
            int Victorias = Integer.parseInt(request.getParameter("Victorias"));
            int CodEqui = Integer.parseInt(request.getParameter("CodEqui"));

            s.execute("INSERT INTO Piloto VALUES(" + CodPil + ",'" + NomPil + "','" + ApePil + "'," + Puntos + "," + Victorias + "," + CodEqui + ")");

            conexion.close();

            response.sendRedirect("pilotos.jsp");
        %>

    </body>
</html>
