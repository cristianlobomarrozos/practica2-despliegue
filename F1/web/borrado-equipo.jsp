<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="parametrizar.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(bbdd,usuario, contrasenya);
            Statement s = conexion.createStatement();
            
            int CodEqui = Integer.parseInt(request.getParameter("CodEqui"));
             
            s.execute ("DELETE FROM Equipo WHERE CodEqui="+CodEqui);
            
            response.sendRedirect("equipos.jsp");
        %>
    </body>
</html>
