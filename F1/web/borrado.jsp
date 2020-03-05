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
            
            int CodPil = Integer.parseInt(request.getParameter("CodPil"));
             
            s.execute ("DELETE FROM Piloto WHERE CodPil="+CodPil);
            
            response.sendRedirect("pilotos.jsp");
        %>
    </body>
</html>
