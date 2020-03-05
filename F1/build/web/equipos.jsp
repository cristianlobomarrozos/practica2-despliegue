<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="parametrizar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <title>Listado Equipos</title>
    </head>
    <body>

        <%            if (session.getAttribute("usuario") == null) {
                session.setAttribute("error", "Debe iniciar sesión para acceder a la página.");
                response.sendRedirect("login.jsp");
            }
        %>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="f1-icon.png" class="icono""></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="login.jsp">Login <span class="sr-only"></span></a></li>
                        <li><a href="pilotos.jsp">Pilotos</a></li>
                        <li><a href="equipos.jsp">Equipos</a></li>
                        <li><a href="jefe.jsp">Jefes</a></li>
                        <li><a href="logout.jsp"><span class="float-left">Logout</span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="marco">
            <h1>Listado de Equipos</h1>
        </div>

        <table class="table table-striped">
            <tr><th>Código</th><th>Nombre</th><th>Campeonatos</th><th>Jefe</th></tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion = DriverManager.getConnection(bbdd, usuario, contrasenya);
                        Statement s = conexion.createStatement();

                        if (session.getAttribute("usuario").equals("admin")) {

                    %>
            <form action="anyadir-equipo.jsp">
                <tr>
                    <td><input type="int" name="CodEqui" value="<%= (request.getParameter("CodEqui") == null)
                        ? "" : request.getParameter("CodEqui")%>"></td>
                    <td><input type="String" name="NomEqui" value="<%= (request.getParameter("NomEqui") == null)
                        ? "" : request.getParameter("NomEqui")%>"></td>
                    <td><input type="int" name="Campeonatos" value="<%= (request.getParameter("Campeonatos") == null)
                        ? "" : request.getParameter("Campeonatos")%>"></td>
                    <td></td>
                    <td><button type="submit" value="Añadir" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></button></td>
                </tr>
            </form>
            <%

                ResultSet listado = s.executeQuery("SELECT E.CodEqui, E.NomEqui,E.Campeonatos, J.ApeJef FROM Equipo E left join Jefe J on (E.CodEqui=J.CodEqui) order by Campeonatos desc");

                while (listado.next()) {
                    out.println("<tr>");
                    for (int i = 1; i <= 4; i++) {
                        out.println("<td>" + listado.getString(i) + "</td>");
                    }
            %>
            <td>

                <form method="get" action="borrado-equipo.jsp">
                    <input type="hidden" name="CodEqui" value="<%=listado.getString("CodEqui")%>"/>
                    <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
                </form>
                <form method="get" action="modify-equipo.jsp">
                    <input type="hidden" name="CodEqui" value="<%=listado.getString("CodEqui")%>"/>
                    <input type="hidden" name="NomEqui" value="<%=listado.getString("NomEqui")%>"/>
                    <input type="hidden" name="Campeonatos" value="<%=listado.getString("Campeonatos")%>"/>
                    <input type="hidden" name="CodJef" value="<%=listado.getString("ApeJef")%>"/>
                    <button type="submit"  class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></button>
                </form>
            </td>
            <%

                        out.println("</tr>\n");
                    }
                } else if (session.getAttribute("usuario").equals("guest")) {

                    ResultSet listado = s.executeQuery("SELECT E.CodEqui, E.NomEqui,E.Campeonatos, J.ApeJef FROM Equipo E left join Jefe J on (E.CodEqui=J.CodEqui) order by Campeonatos desc");

                    while (listado.next()) {
                        out.println("<tr>");
                        for (int i = 1; i <= 4; i++) {
                            out.println("<td>" + listado.getString(i) + "</td>");
                        }

                        out.println("</tr>\n");
                    }

                } else {
                    response.sendRedirect("login.jsp");
                }
                conexion.close();
            %>
        </table>

    </body>
</html>