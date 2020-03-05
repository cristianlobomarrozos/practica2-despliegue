<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="parametrizar.jsp"%>
<%@page import="java.sql.Connection"%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection(bbdd, usuario, contrasenya);
    Statement s = conexion.createStatement();

    int CodJef = Integer.parseInt(request.getParameter("CodJef"));
    String NomJef = request.getParameter("NomJef");
    String ApeJef = request.getParameter("ApeJef");
    int CodEqui = Integer.parseInt(request.getParameter("CodEqui"));

    s.execute("INSERT INTO Jefe VALUES(" + CodJef + ",'" + NomJef + "'," + "'"+ApeJef+"',"  + CodEqui + ")");

    conexion.close();

    response.sendRedirect("jefe.jsp");
%>

