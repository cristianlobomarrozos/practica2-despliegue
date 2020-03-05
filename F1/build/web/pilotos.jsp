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
        <title>Listado Pilotos</title>
    </head>
    <body>

        <%          if (session.getAttribute("usuario") == null) {
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
            <h1>Listado de Pilotos</h1>
        </div>
        <table class="table table-striped">
            <tr><th>Código</th><th>Nombre</th><th>Apellido</th><th>Puntos</th><th>Victorias</th><th>Equipo</th><th>Jefe</th></tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                                                    Connection conexion = DriverManager.getConnection(bbdd, usuario, contrasenya);
                                                    Statement s = conexion.createStatement();
                                                    if (session.getAttribute("usuario").equals("admin")) {
                    %>
            <form method="get" action="anyadir.jsp">
                <tr>
                    <td>

                        <input type="int" name="CodPil">

                    </td>
                    <td>

                        <input type="String" name="NomPil">

                    </td>
                    <td>

                        <input type="String" name="ApePil">

                    </td>
                    <td>

                        <input type="int" name="Puntos">

                    </td>
                    <td>

                        <input type="int" name="Victorias">

                    </td>
                    <td>

                        <select name="CodEqui">
                            <%
                                

                                ResultSet equipos = s.executeQuery("SELECT CodEqui, NomEqui FROM Equipo");

                                while (equipos.next()) {
                            %>

                            <option value="<%= equipos.getString("CodEqui")%>"
                                    <%= (equipos.getString("CodEqui").equals(request.getParameter("CodEqui")))? 
                                    "selected": ""
                                    %>><%= equipos.getString("NomEqui")%></option>
                            <%
                                }

                            %>
                        </select>
                    </td>
                    <td>

                        <%                        /*
                            ResultSet jefes = s.executeQuery ("SELECT J.CodJef,E.NomEqui, J.ApeJef FROM Jefe J join Equipo E on (J.CodEqui=E.CodEqui)");
                        
                            System.out.println("");
                             */
                        %>

                    </td>
                    <td>

                        <button type="submit" value="Añadir" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></button>

                    </td>
                </tr>
            </form>
            <%            ResultSet listado = s.executeQuery("SELECT P.CodPil, P.NomPil, P.ApePil, P.Puntos, P.Victorias, E.NomEqui, J.ApeJef, E.CodEqui FROM Piloto P left join Equipo E on (P.CodEqui=E.CodEqui) left join Jefe J on (E.CodEqui=J.CodEqui) order by Puntos desc");

                while (listado.next()) {
                    out.println("<tr>");
                    for (int i = 1; i <= 7; i++) {
                        out.println("<td>" + listado.getString(i) + "</td>");
                    }
            %>
            <td>
                <form method="get" action="borrado.jsp">
                    <input type="hidden" name="CodPil" value="<%=listado.getString("CodPil")%>"/>
                    <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>
                </form>
                <form method="get" action="modify.jsp">
                    <input type="hidden" name="CodPil" value="<%=listado.getString("CodPil")%>"/>
                    <input type="hidden" name="NomPil" value="<%=listado.getString("NomPil")%>"/>
                    <input type="hidden" name="ApePil" value="<%=listado.getString("ApePil")%>"/>
                    <input type="hidden" name="Puntos" value="<%=listado.getString("Puntos")%>"/>
                    <input type="hidden" name="Victorias" value="<%=listado.getString("Victorias")%>"/>
                    <input type="hidden" name="NomEqui" value="<%=listado.getString("NomEqui") %>"/>
                    <input type="hidden" name="CodEqui" value="<%=listado.getString("CodEqui")%>"/>
                    <input type="hidden" name="ApeJef" value="<%=listado.getString("ApeJef")%>"/>
                    <button type="submit"  class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></button>
                </form>
            </td>

            <%
                    out.println("</tr>\n");
                }
} else if (session.getAttribute("usuario").equals("guest")) {
            %>

            <%            ResultSet listado = s.executeQuery("SELECT P.CodPil, P.NomPil, P.ApePil, P.Puntos, P.Victorias, E.NomEqui, J.ApeJef, E.CodEqui FROM Piloto P left join Equipo E on (P.CodEqui=E.CodEqui) left join Jefe J on (E.CodEqui=J.CodEqui) order by Puntos desc");

                while (listado.next()) {
                    out.println("<tr>");
                    for (int i = 1; i <= 7; i++) {
                        out.println("<td>" + listado.getString(i) + "</td>");
                    }
            %>

            <%
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
