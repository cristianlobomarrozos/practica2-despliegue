<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="parametrizar.jsp"%>


<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection(bbdd,usuario, contrasenya);
    Statement s = conexion.createStatement();
            
    int CodJef = Integer.parseInt(request.getParameter("CodJef"));
             
    s.execute ("DELETE FROM Jefe WHERE CodJef="+CodJef);
            
    response.sendRedirect("jefe.jsp");
%>

